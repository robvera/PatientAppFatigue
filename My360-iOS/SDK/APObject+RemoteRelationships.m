//
//  APObject+RemoteRelationships.m
//  AnyPresence SDK
//

#import <objc/runtime.h>
#import "APManagedDataObject+Protected.h"
#import "APInternalObject.h"
#import "APObject+Internal.h"
#import "APObject+RemoteRelationships.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "NSString+Inflections.h"

NSString * const kAPRemoteRelationshipsErrorDomain = @"APRemoteRelationships";
NSInteger const kAPRemoteRelationshipsErrorCodeInvalidKeyPath = 1;
NSString * const kAPRemoteRelationshipsForeignKey = @"fk";

@protocol APObjectRemoteClass

+ (NSArray *)query:(NSString *)scope params:(NSDictionary *)params error:(NSError **)error;
+ (NSArray *)query:(NSString *)scope params:(NSDictionary *)params async:(APObjectsCallback)callback;

@end

@interface APObject (RemoteRelationships_Private)

@property (nonatomic, readonly) NSMutableArray * pendingOperations;
@property (nonatomic, readonly) NSMutableArray * loadedRelationships;

+ (NSRelationshipDescription *)relationship:(NSString *)key forward:(BOOL *)forward;
+ (NSString *)foreignKeyAttribute:(NSRelationshipDescription *)relationship;
+ (BOOL)isForwardRelationship:(NSRelationshipDescription *)relationship;
- (NSString *)queryForRelationship:(NSString *)key params:(NSDictionary **)params class:(Class *)destination;
- (void)setValue:(id)value forRelationship:(NSString *)key;
- (id)valueForKeyPath:(NSString *)keyPath error:(NSError **)error;
- (BOOL)enumerateUnloadedRelationships:(NSString *)keyPath callback:(void(^)(APObject * obj, NSString * relationshipKey, BOOL * stop))callback;

@end

@implementation APObject (RemoteRelationships)

#pragma mark - Public

- (BOOL)isRelationship:(NSString *)key {
    return [ThreadSafeReturn(^id{
        return @(!![[self class] relationship:key forward:nil]);
    }) boolValue];
}

- (BOOL)isRelationshipLoaded:(NSString *)key {
    return [ThreadSafeReturn(^id{
        return @([self.loadedRelationships containsObject:key]);
    }) boolValue];
}

- (BOOL)areAllRelationshipsLoaded {
    return [ThreadSafeReturn(^id{
        for (NSString * key in self.internal.entity.relationshipsByName) {
            if (![self.loadedRelationships containsObject:key])
                return @(NO);
        }
        
        return @(YES);
    }) boolValue];
}

- (void)loadRelationship:(NSString *)key error:(NSError **)error {
    Class<APObjectRemoteClass> destination;
    NSDictionary * params;
    NSString * query = [self queryForRelationship:key params:&params class:&destination];
    
    if (query) {
        id value = [destination query:query params:params error:error];
        if (!*error) {
            [self setValue:value forRelationship:key];
        }
    }
}

- (void)loadRelationship:(NSString *)key async:(APCallback)callback {
    Class<APObjectRemoteClass> destination;
    NSDictionary * params;
    NSString * query = [self queryForRelationship:key params:&params class:&destination];
    
    if (query) {
        [destination query:query params:params async:^(NSArray * objects, NSError * error) {
            if (!error) {
                [self setValue:objects forRelationship:key];
            }
            
            callback(error);
        }];
    } else {
        dispatch_async(dispatch_get_current_queue(), ^{
            callback(nil);
        });
    }
}

- (void)loadAllRelationshipsAsync:(APCallback)callback {
    __block NSError * firstError = nil;
    __block NSUInteger count = self.internal.entity.relationshipsByName.count;
    for (NSString * key in self.internal.entity.relationshipsByName) {
        [self loadRelationship:key async:^(NSError *error) {
            if (error && !firstError)
                firstError = error;
            
            if (--count == 0) {
                callback(firstError);
            }
        }];
    }
}

- (id)valueForKeyPath:(NSString *)keyPath error:(NSError **)error async:(APObjectCallback)callback {
    if ([self enumerateUnloadedRelationships:keyPath callback:^void(APObject * obj, NSString * relationshipKey, BOOL * stop) {
        *stop = YES;
    }]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            if (![self enumerateUnloadedRelationships:keyPath callback:^void(APObject * obj, NSString * relationshipKey, BOOL * stop) {
                NSError * error = nil;
                [obj loadRelationship:relationshipKey error:&error];
                
                if (error) {
                    *stop = YES;
                    
                    if (callback) {
                        callback(nil, error);
                    }
                }
            }]) {
                NSError * error = nil;
                id value = [self valueForKeyPath:keyPath error:&error];
                if (callback) {
                    callback(value, error);
                }
            }
        });
    }
    
    return [self valueForKeyPath:keyPath error:error];
}

+ (BOOL)isRelationship:(NSString *)key forward:(BOOL *)forward {
    return !![self relationship:key forward:forward];
}

+ (BOOL)isForeignKeyProperty:(NSString *)key forRelationship:(NSString **)relationshipKey {
    for (NSRelationshipDescription * rel in [[self internalClass] entity].relationshipsByName.allValues) {
        NSString * prop = [self foreignKeyAttribute:rel];
        if ([prop isEqualToString:key]) {
            if (relationshipKey)
                *relationshipKey = rel.name;
            
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation APObject (RemoteRelationships_Private)

- (NSMutableArray *)pendingOperations {
    NSMutableArray * operations = objc_getAssociatedObject(self, _cmd);
    if (!operations) {
        operations = [NSMutableArray new];
        objc_setAssociatedObject(self, _cmd, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return operations;
}

- (NSMutableArray *)loadedRelationships {
    NSMutableArray * relationships = objc_getAssociatedObject(self.internal, _cmd);
    if (!relationships) {
        relationships = [NSMutableArray new];
        objc_setAssociatedObject(self.internal, _cmd, relationships, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return relationships;
}

- (NSString *)queryForRelationship:(NSString *)key params:(NSDictionary **)params class:(Class *)destination {
    BOOL forward;
    NSRelationshipDescription * relationship = [[self class] relationship:key forward:&forward];
    if (relationship) {
        Class internal = [APInternalObject classFor:relationship.destinationEntity];
        if (destination)
            *destination = [APObject publicClassForInteralClass:internal];
        
        id fk;
        NSString * fkKey;
        
        if (forward) {
            fkKey = [[self class] foreignKeyAttribute:relationship.inverseRelationship];
            fk = [self valueForKey:[self class].remoteConfig.remoteIDProperty];
        } else {
            fkKey = [(*destination).remoteConfig.remoteIDProperty underscore];
            fk = [self valueForKey:[[self class] foreignKeyAttribute:relationship]];
        }
        
        if (fk) {
            if (params)
                *params = @{ [fkKey underscore]: fk };
            return @"exact_match";
        }
    }
    
    return nil;
}

- (void)setValue:(id)value forRelationship:(NSString *)key {
    BOOL forward;
    NSRelationshipDescription * relationship = [[self class] relationship:key forward:&forward];
    if (relationship) {
        if (relationship.isToMany) {
            value = [NSOrderedSet orderedSetWithArray:value];
        } else {
            value = [value lastObject];
        }
        
        [self setValue:value forKey:key];
        
        ThreadSafe(^{
            [self.internal save];
            [self.loadedRelationships addObject:key];
        });
    }
}

- (id)valueForKeyPath:(NSString *)keyPath error:(NSError **)error  {
    @try {
        return [self valueForKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        if (error) {
            *error = [NSError errorWithDomain:kAPRemoteRelationshipsErrorDomain
                                         code:kAPRemoteRelationshipsErrorCodeInvalidKeyPath
                                     userInfo:@{ NSUnderlyingErrorKey: exception } ];
        }
        
        return nil;
    }
}

- (BOOL)enumerateUnloadedRelationships:(NSString *)keyPath callback:(void(^)(APObject * obj, NSString * relationshipKey, BOOL * stop))callback {
    NSArray * tokens = [keyPath componentsSeparatedByString:@"."];
    
    id value = tokens.count > 0 ? self : nil;
    for (NSString * token in tokens) {
        if ([value isKindOfClass:[APObject class]]) {
            APObject * rel = (APObject *)value;
            if ([rel isRelationship:token] && ![rel isRelationshipLoaded:token]) {
                BOOL stop = NO;
                callback(rel, token, &stop);
                
                if (stop) {
                    return YES;
                }
            }
        }
        
        if ([value respondsToSelector:NSSelectorFromString(token)]) {
            value = [value valueForKey:token];
        }
    }
    
    return NO;
}

+ (NSRelationshipDescription *)relationship:(NSString *)key forward:(BOOL *)forward {
    NSRelationshipDescription * relationship = [[[self internalClass] entity].relationshipsByName objectForKey:key];
    if (relationship && forward)
        *forward = [self isForwardRelationship:relationship];
    
    return relationship;
}

+ (NSString *)foreignKeyAttribute:(NSRelationshipDescription *)relationship {
    return [relationship.userInfo objectForKey:kAPRemoteRelationshipsForeignKey];
}

+ (BOOL)isForwardRelationship:(NSRelationshipDescription *)relationship {
    return ![self foreignKeyAttribute:relationship];
}

@end
