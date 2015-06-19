//
//  APObject+Reflection.m
//  AnyPresence SDK
//

#import <objc/runtime.h>
#import "APManagedDataObject+Protected.h"
#import "APInternalObject.h"
#import "APObject+Internal.h"
#import "APObject+Reflection.h"
#import "APObject+RemoteID.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "APObject+RemoteRelationships.h"
#import "NSObject+Reflection.h"
#import "NSString+Inflections.h"

@interface APObject (Reflection_Private)

+ (Class)propertyType:(NSString *)name;
- (void)setValues:(NSDictionary *)values transform:(APReflectionPropertyName)property;
- (id)propertyValueForKey:(NSString *)key;

@end

@implementation APObject (Reflection)

#pragma mark - Public

+ (NSArray *)properties {
    return [[self internalClass] entity].attributesByName.allKeys;
}

+ (NSString *)controller {
    return [[NSStringFromClass(self) underscore] pluralize];
}

+ (NSArray *)arrayFromData:(id)data transform:(APReflectionPropertyName)property {
    NSMutableArray * array = [NSMutableArray new];
    if ([data isKindOfClass:[NSArray class]]) {
        [data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                id idValue = [self decodeValue:[obj valueForKey:[self remoteConfig].remoteIDProperty] ofType:[[self class] propertyType:[self remoteConfig].remoteIDProperty]];
                APObject * object = [[self alloc] initWithRemoteID:idValue];
                [object setValues:obj transform:property];
                
                [array addObject:object];
            }
        }];
        
        ThreadSafe(^{
            [[self internalClass] saveContext];
        });
    }
    
    return array;
}

- (void)updateWithData:(id)data transform:(APReflectionPropertyName)property {
    
    //This is needed because objectFromXMLWithConfig:error: always returns an array, and here we're expecting a single dictionary object instead. objectFromJSONWithConfig:error: may return an array or a dictionary.
    if ([data isKindOfClass:[NSArray class]] && [data count])
        data = [data objectAtIndex:0];
    
    if ([data isKindOfClass:[NSDictionary class]])
        [self setValues:(NSDictionary *)data transform:property];
}

- (id)data {
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:[[self class] properties].count];
    [[[self class] properties] enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        id obj = [self propertyValueForKey:key];
        if (obj) {
            id value = [self encodeValue:obj ofType:[[self class] propertyType:key]];
            [dict setObject:value forKey:[(NSString *)key underscore]];
        }
    }];
    
    return dict;
}

@end

@implementation APObject (Reflection_Private)

+ (Class)propertyType:(NSString *)name {
    Class type = nil;
    unsigned int count;
    objc_property_t * properties = class_copyPropertyList([self class], &count);
    
    for (unsigned int i = 0; properties && i < count; i++) {
        NSString * propertyName = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
        if ([propertyName isEqualToString:name]) {
            
            NSString * tokens = [NSString stringWithCString:property_getAttributes(properties[i]) encoding:NSUTF8StringEncoding];
            for (NSString * token in [tokens componentsSeparatedByString:@","]) {
                if ([token hasPrefix:@"T"]) {
                    if ([token hasPrefix:@"T@"]) {
                        NSString * tokenType = [token substringFromIndex:2];
                        if ([tokenType hasPrefix:@"\""] && [tokenType hasSuffix:@"\""]) {
                            type = NSClassFromString([tokenType substringWithRange:NSMakeRange(1, tokenType.length - 2)]);
                        } else {
                            type = NSClassFromString(tokenType);
                        }
                    } else {
                        type = [NSNumber class];
                    }
                    
                    break;
                }
            }
            
            break;
        }
    }
    
    free(properties);
    
    return type;
}

- (void)setValues:(NSDictionary *)values transform:(APReflectionPropertyName)transformProperty {
    [values enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([key isKindOfClass:[NSString class]] && obj != [NSNull null]) {
            NSString * property = transformProperty([(NSString *)key camelizeWithLowerFirstLetter]);
            if ([[[self class] properties] containsObject:key]) {
                id value = [self decodeValue:obj ofType:[[self class] propertyType:key]];
                [self setValue:value forKey:key];
            }
            if ([[[self class] properties] containsObject:property] && ![property isEqualToString: key]) {
                id value = [self decodeValue:obj ofType:[[self class] propertyType:property]];
                [self setValue:value forKey:property];
            }
        }
    }];
    
    ThreadSafe(^{
        [self.internal saveWithContext:false];
    });
}

- (id)propertyValueForKey:(NSString *)key {
    NSString * relationshipKey;
    if ([[self class] isForeignKeyProperty:key forRelationship:&relationshipKey]) {
        id rel = [self valueForKey:relationshipKey];
        if (rel) {
            return [rel valueForKey:[rel class].remoteConfig.remoteIDProperty];
        }
    }
    
    return [self valueForKey:key];
}

@end
