//
//  APObject+Remote.m
//  AnyPresence SDK
//

#import <objc/runtime.h>
#import "APCachedRequest.h"
#import "APDataManager.h"
#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+Local.h"
#import "APObject+RemoteID.h"
#import "APObject+Requests.h"
#import "APObject+Reflection.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "APManagedDataObject+Protected.h"
#import "APRequest.h"
#import "NSData+Serialization.h"
#import "APQuery.h"
#import "AnyPresenceAPI.h"
#import "APStringUtils.h"

@interface APObject (Remote_Private)

+ (void)expandError:(NSError **)error data:(id)data;

@end

@interface AnyPresenceAPI (Private)

+ (NSURL *)baseURL;

@end

@implementation APObject (Remote)

NSString * const kNSObjectRemoteErrorDictionaryKey = @"errors";

APReflectionPropertyName transformProperty = ^(NSString * name){
    return name;
};

#pragma mark - Configuration

+ (void)setBaseURL:(NSURL*)url {
    [AnyPresenceAPI setBaseURL:url];
}

+ (NSURL *)baseURL {
    
    if (![AnyPresenceAPI baseURL]) {
        @throw [NSException exceptionWithName:kAPRequestBaseURLException
                                       reason:@"Call [APObject setBaseURL:(NSURL *)URL] to set base URL"
                                     userInfo:nil];
    }
    
    return [AnyPresenceAPI baseURL];
}

#pragma mark - CRUD

- (BOOL)create:(NSError **)error {
    return [self createWithContext:nil config:nil error:error];
}

- (BOOL)createWithContext:(id)context error:(NSError **)error {
    return [self createWithContext:context config:nil error:error];
}

- (BOOL)createWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error {
    
    NSData * response = [[[self class] requestWithVerb:kAPRequestVerbCreate
                                                object:self
                                               context:[APStringUtils context:context withInstanceOfSelf:self]
                                                config:config]
                         load:error];
    
    if (!*error) {
        [self updateWithData:[response objectFromSerializationWithConfig:config] transform:transformProperty];
        return YES;
    } else {
        [[self class] expandError:error data:[response objectFromSerializationWithConfig:config]];
        return NO;
    }
}

- (BOOL)update:(NSError **)error {
    return [self updateWithContext:nil config:nil error:error];
}

- (BOOL)updateWithContext:(id)context error:(NSError **)error {
    return [self updateWithContext:context config:nil error:error];
}

- (BOOL)updateWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error {
    
    NSData * response = [[[self class] requestWithVerb:kAPRequestVerbUpdate
                                                    id:self.remoteID
                                                object:self
                                               context:[APStringUtils context:context withInstanceOfSelf:self]
                                                config:config]
                         load:error];
    
    if (!*error) {
        [self updateWithData:[response objectFromSerializationWithConfig:config] transform:transformProperty];
        return YES;
    } else {
        [[self class] expandError:error data:[response objectFromSerializationWithConfig:config]];
        return NO;
    }
}

- (BOOL)destroy:(NSError **)error {
    return [self destroyWithContext:nil config:nil error:error];
}

- (BOOL)destroyWithContext:(id)context error:(NSError **)error {
    return [self destroyWithContext:context config:nil error:error];
}

- (BOOL)destroyWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error {
    
    NSData * response = [[[self class] requestWithVerb:kAPRequestVerbDelete
                                                    id:self.remoteID
                                               context:[APStringUtils context:context withInstanceOfSelf:self]
                                                config:config]
                         load:error];
    
    if (!*error) {
        self.remoteID = nil;
        [self deleteLocal];
        return YES;
    } else {
        [[self class] expandError:error data:[response objectFromSerializationWithConfig:config]];
        return NO;
    }
}

- (BOOL)refresh:(NSError **)error {
    return [self refreshWithContext:nil config:nil error:error];
}

- (BOOL)refreshWithContext:(id)context error:(NSError **)error {
    return [self refreshWithContext:context config:nil error:error];
}

- (BOOL)refreshWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error {
    
    NSData * response = [[[self class] requestWithVerb:kAPRequestVerbRead
                                                    id:self.remoteID
                                               context:[APStringUtils context:context withInstanceOfSelf:self]
                                                config:config]
                         load:error];
    
    if (!*error) {
        [self updateWithData:[response objectFromSerializationWithConfig:config] transform:transformProperty];
        return YES;
    } else {
        [[self class] expandError:error data:[response objectFromSerializationWithConfig:config]];
        return NO;
    }
}

#pragma mark - CRUD Async

- (void)createAsync:(APObjectCallback)callback {
    return [self createAsyncWithContext:nil config:nil async:callback];
}

- (void)createAsyncWithContext:(id)context async:(APObjectCallback)callback {
    return [self createAsyncWithContext:context config:nil async:callback];
}

- (void)createAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback {
    
    [[[self class] requestWithVerb:kAPRequestVerbCreate
                            object:self
                           context:[APStringUtils context:context withInstanceOfSelf:self]
                            config:config]
     loadAsync:^(NSData *response, NSError *error) {
         
         if (!error) {
             [self updateWithData:[response objectFromSerializationWithConfig:config] transform:transformProperty];
         } else {
             [[self class] expandError:&error data:[response objectFromSerializationWithConfig:config]];
         }
         callback(self, error);
     }];
}

- (void)updateAsync:(APObjectCallback)callback {
    return [self updateAsyncWithContext:nil config:nil async:callback];
}

- (void)updateAsyncWithContext:(id)context async:(APObjectCallback)callback {
    return [self updateAsyncWithContext:context config:nil async:callback];
}

- (void)updateAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback {
    
    [[[self class] requestWithVerb:kAPRequestVerbUpdate
                                id:self.remoteID
                            object:self
                           context:[APStringUtils context:context withInstanceOfSelf:self]
                            config:config]
     loadAsync:^(NSData *response, NSError *error) {
         
         if (!error) {
             [self updateWithData:[response objectFromSerializationWithConfig:config] transform:transformProperty];
         } else {
             [[self class] expandError:&error data:[response objectFromSerializationWithConfig:config]];
         }
         callback(self, error);
     }];
}

- (void)destroyAsync:(APObjectCallback)callback {
    return [self destroyAsyncWithContext:nil config:nil async:callback];
}

- (void)destroyAsyncWithContext:(id)context async:(APObjectCallback)callback {
    return [self destroyAsyncWithContext:context config:nil async:callback];
}

- (void)destroyAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback {
    
    if (!self.remoteID) {
        return;
    }
    
    [[[self class] requestWithVerb:kAPRequestVerbDelete
                                id:self.remoteID
                           context:[APStringUtils context:context withInstanceOfSelf:self]
                            config:config]
     loadAsync:^(NSData *response, NSError *error) {
         
         if (!error) {
             self.remoteID = nil;
             [self deleteLocal];
         } else {
             [[self class] expandError:&error data:[response objectFromSerializationWithConfig:config]];
         }
         callback(nil, error);
     }];
}

- (void)refreshAsync:(APObjectCallback)callback {
    return [self refreshAsyncWithContext:nil config:nil async:callback];
}

- (void)refreshAsyncWithContext:(id)context async:(APObjectCallback)callback {
    return [self refreshAsyncWithContext:context config:nil async:callback];
}

- (void)refreshAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback {
    
    if (!self.remoteID) {
        return;
    }
    
    [[[self class] requestWithVerb:kAPRequestVerbRead
                                id:self.remoteID
                           context:[APStringUtils context:context withInstanceOfSelf:self]
                            config:config]
     loadAsync:^(NSData *response, NSError *error) {
         
         if (!error) {
             [self updateWithData:[response objectFromSerializationWithConfig:config] transform:transformProperty];
         } else {
             [[self class] expandError:&error data:[response objectFromSerializationWithConfig:config]];
         }
         callback(self, error);
     }];
}

#pragma mark - Query

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
             error:(NSError **)error {
    
    return [self query:scope params:params offset:NSNotFound limit:NSNotFound context:nil config:nil error:error];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
           context:(id)context
             error:(NSError **)error {
    
    return [self query:scope params:params offset:NSNotFound limit:NSNotFound context:context config:nil error:error];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
           context:(id)context
            config:(APEndPointConfiguration *)config
             error:(NSError **)error {
    
    return [self query:scope params:params offset:NSNotFound limit:NSNotFound context:context config:config error:error];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
             error:(NSError **)error {
    
    return [self query:scope params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
           context:(id)context
             error:(NSError **)error {
    
    return [self query:scope params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
           context:(id)context
            config:(APEndPointConfiguration *)config
             error:(NSError **)error {
    
    context = [APStringUtils context:context withInstanceOfSelf:self];
    
    NSMutableDictionary * query = [[NSMutableDictionary alloc] initWithDictionary:[APQuery query:scope params:params context:context dataSource:[self dataSource]]];
    
    if (offset != NSNotFound && limit != NSNotFound) {
        [query addEntriesFromDictionary:[APQuery pagination:offset limit:limit config:config]];
    }
    
    NSData * response = [[[self class] requestWithVerb:kAPRequestVerbRead query:query context:context config:config] load:error];

    if (!*error) {
        NSArray * array = [self arrayFromData:[response objectFromSerializationWithConfig:config] transform:transformProperty];

        ThreadSafe(^{
            APCachedRequest * request = [APCachedRequest requestWithResource:[[self internalClass] entity].name scope:scope params:query];
            request.objects = [NSOrderedSet orderedSetWithArray:[self internalsForObjects:array]];
            [request save];
        });
        return array ?: @[ ];
    } else {
        [self expandError:error data:[response objectFromSerializationWithConfig:config]];
        return nil;
    }
}

+ (NSNumber *)aggregateQuery:(NSString *)scope
                      params:(NSDictionary *)params
                       error:(NSError **)error {
    
    return [self aggregateQuery:scope params:params context:nil config:nil error:error];
}

+ (NSNumber *)aggregateQuery:(NSString *)scope
                      params:(NSDictionary *)params
                     context:(id)context
                       error:(NSError **)error {
    
    return [self aggregateQuery:scope params:params context:context config:nil error:error];
}

+ (NSNumber *)aggregateQuery:(NSString *)scope
                      params:(NSDictionary *)params
                     context:(id)context
                      config:(APEndPointConfiguration *)config
                       error:(NSError **)error {
    
    context = [APStringUtils context:context withInstanceOfSelf:self];
    
    NSData * response = [[[self class] requestWithVerb:kAPRequestVerbRead
                                                 query:[APQuery query:scope params:params context:context dataSource:[self dataSource]]
                                               context:context 
                                                config:config]
                         load:error];
    NSNumber * aggregate = [response objectFromSerializationWithConfig:config error:error];
    
    if (!*error) {
        return aggregate;
    } else {
        [self expandError:error data:[response objectFromSerializationWithConfig:config]];
        return nil;
    }
}

#pragma mark - Query Async

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
             async:(APObjectsCallback)callback {
    
    return [self query:scope params:params offset:NSNotFound limit:NSNotFound context:nil config:nil async:callback];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
           context:(id)context
             async:(APObjectsCallback)callback {
    
    return [self query:scope params:params offset:NSNotFound limit:NSNotFound context:context config:nil async:callback];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
           context:(id)context
            config:(APEndPointConfiguration *)config
             async:(APObjectsCallback)callback {
    
    return [self query:scope params:params offset:NSNotFound limit:NSNotFound context:context config:config async:callback];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
             async:(APObjectsCallback)callback {
    
    return [self query:scope params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
           context:(id)context
             async:(APObjectsCallback)callback {
    
    return [self query:scope params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
           context:(id)context
            config:(APEndPointConfiguration *)config
             async:(APObjectsCallback)callback {
    
    context = [APStringUtils context:context withInstanceOfSelf:self];
    
    NSMutableDictionary * query = [[NSMutableDictionary alloc] initWithDictionary:[APQuery query:scope params:params context:context dataSource:[self dataSource]]];
    
    if (offset != NSNotFound && limit != NSNotFound) {
        [query addEntriesFromDictionary:[APQuery pagination:offset limit:limit config:config]];
    }

    APCachedRequest * request = ThreadSafeReturn(^id{
        return [APCachedRequest requestWithResource:[[self internalClass] entity].name scope:scope params:query];
    });
    
    [[[self class] requestWithVerb:kAPRequestVerbRead query:query context:context config:config] loadAsync:^(NSData *response, NSError *error) {
        
        [self expandError:&error data:[response objectFromSerializationWithConfig:config]];

        if (!error) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                NSArray * array = [self arrayFromData:[response objectFromSerializationWithConfig:config] transform:transformProperty];

                array = ThreadSafeReturn(^id{
                    request.objects = [NSOrderedSet orderedSetWithArray:[self internalsForObjects:array]];
                    [request save];
                    
                    return [self objectsWithInternals:[request.objects array]];
                });
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(array, nil);
                });
            });
        } else {
            callback(nil, error);
        }
    }];

    return ThreadSafeReturn(^id{
        return [self objectsWithInternals:[request.objects array] ?: @[ ]];
    });
}

+ (void)aggregateQuery:(NSString *)scope
                params:(NSDictionary *)params
                 async:(APObjectCallback)callback {
    
    [self aggregateQuery:scope params:params context:nil config:nil async:callback];
}

+ (void)aggregateQuery:(NSString *)scope
                params:(NSDictionary *)params
               context:(id)context
                 async:(APObjectCallback)callback {
    
    [self aggregateQuery:scope params:params context:context config:nil async:callback];
}

+ (void)aggregateQuery:(NSString *)scope
                params:(NSDictionary *)params
               context:(id)context
                config:(APEndPointConfiguration *)config
                 async:(APObjectCallback)callback {
    
    context = [APStringUtils context:context withInstanceOfSelf:self];
    
    [[[self class] requestWithVerb:kAPRequestVerbRead query:[APQuery query:scope params:params context:context dataSource:[self dataSource]] context:context config:config]
     loadAsync:^(NSData *response, NSError *error) {
         NSNumber *aggregate = (NSNumber *)[response objectFromSerializationWithConfig:config];
         [self expandError:&error data:aggregate];
         callback(aggregate, error);
    }];
}

@end

#pragma mark - Remote_Private Category Implementation

@implementation APObject (Remote_Private)

+ (void)expandError:(NSError **)error data:(id)data {
    
    if ([[*error domain] isEqualToString:kAPRequestErrorDomain] && [*error code] == kAPRequestErrorServerError) {
        
        NSDictionary * dict = (NSDictionary *)data;
        
        if ([dict isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary * errorsDict = [dict objectForKey:@"errors"];
            
            if ([errorsDict isKindOfClass:[NSDictionary class]]) {
                
                NSMutableDictionary * info = [[NSMutableDictionary alloc] initWithDictionary:[*error userInfo]];
                [info setObject:errorsDict forKey:kNSObjectRemoteErrorDictionaryKey];
                *error = [NSError errorWithDomain:[*error domain] code:[*error code] userInfo:[info copy]];
            }
        }
    }
}

@end

#pragma mark - RemoteConfig Category Implementation

@implementation APObject (RemoteConfig)

+ (APObjectRemoteConfig *)remoteConfig {
    
    APObjectRemoteConfig * config = objc_getAssociatedObject(self, _cmd);
    
    if (!config) {
        config = [APObjectRemoteConfig defaultConfigForClass:self];
        objc_setAssociatedObject(self, _cmd, config, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return config;
}

@end
