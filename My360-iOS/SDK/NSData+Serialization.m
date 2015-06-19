//
//  NSData+Serialization.m
//  AnyPresence SDK
//

#import "NSData+Serialization.h"
#import "NSData+JSON.h"
#import "APObject.h"
#import "APObject+Reflection.h"
#import "NSObjects+APLACJSONPath.h"
#import "APEndPointConfiguration.h"
#import "APStringUtils.h"
#import "APOno.h"

@implementation NSData (Serialization)

#pragma mark - General Serialization

- (id)objectFromSerializationWithConfig:(APEndPointConfiguration *)config {
    NSError *error = nil;
    return [self objectFromSerializationWithConfig:config error:&error];
}

- (id)objectFromSerializationWithConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    
    switch (config.serializationFormat) {
        case APSerializationFormatJSON:
            return [self objectFromJSONWithConfig:config error:error];
        case APSerializationFormatXML:
            return [self objectFromXMLWithConfig:config error:error];
        case APSerializationFormatURLEncoded:
            return nil;
    }
    return nil;
}

+ (NSData *)serializedDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config {
    NSError *error = nil;
    return [self serializedDataFromObject:object withConfig:config error:&error];
}

+ (NSData *)serializedDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    
    id objectData = [object isKindOfClass:[APObject class]] ? [object data] : object;

    if (config.bodyTemplate) {
        return [[self class] templatizedBodyData:object withConfig:config error:error];
    }

    switch (config.serializationFormat) {
        case APSerializationFormatJSON:
            return [self jsonDataFromObject:objectData withConfig:config error:error];
        case APSerializationFormatXML:
            return [self xmlDataFromObject:objectData withConfig:config error:error];
        case APSerializationFormatURLEncoded:
            return [self urlEncodedDataFromObject:objectData withConfig:config error:error];
    }

    return nil;
}


#pragma mark - JSON Serialization

- (id)objectFromJSONWithConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:error];
    if (*error) return nil;
    
    if (config) {
        NSString *objectsPath = [config.objectsPath isEqualToString:@"$"] ? @"" : config.objectsPath;
        id objectsNode = [jsonObject parseWithJSONPath:objectsPath];
        if (objectsNode && [objectsNode isKindOfClass:[NSArray class]]) {
            NSMutableArray *objectsArray = [NSMutableArray array];
            for (id objectNode in objectsNode) {
                NSMutableDictionary *objectDictionary = [NSMutableDictionary dictionary];
                for (NSString *key in config.localToRemoteFieldPathsDictionary) {
                    id elementNode = [objectNode parseWithJSONPath:[config.localToRemoteFieldPathsDictionary valueForKey:key]];
                    if ([elementNode isKindOfClass:[NSArray class]] && [elementNode count]) {
                        [objectDictionary setValue:[elementNode objectAtIndex:0] forKey:key];
                    }
                }
                [objectsArray addObject:objectDictionary];
            }
            return objectsArray;
        }
    }
    
    return jsonObject;
}

+ (NSData *)jsonDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject:object options:0 error:error];
}

#pragma mark - XML Serialization

- (id)objectFromXMLWithConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    
    APONOXMLDocument *document = [APONOXMLDocument XMLDocumentWithData:self error:error];
    if (*error) return nil;
    
    NSMutableArray *objectsArray = [NSMutableArray array];
    
    [document enumerateElementsWithXPath:config.objectsPath usingBlock:^(APONOXMLElement *element, __unused NSUInteger idx, __unused BOOL *stop) {
        NSMutableDictionary *objectDictionary = [NSMutableDictionary dictionary];
        for (NSString *key in config.localToRemoteFieldPathsDictionary) {
            [element enumerateElementsWithXPath:[config.localToRemoteFieldPathsDictionary valueForKey:key] usingBlock:^(APONOXMLElement *element, __unused NSUInteger idx, __unused BOOL *stop) {
                [objectDictionary setValue:[element stringValue] forKey:key];
            }];
        }
        [objectsArray addObject:objectDictionary];
    }];
    
    return objectsArray;
}

+ (NSData *)xmlDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    return nil;
}

#pragma mark - Protected

+ (NSData *)urlEncodedDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    return [[[self class] urlEncodeDictionary:(object)] dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSData *)templatizedBodyData:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error {
    return [[APStringUtils interpolateString:config.bodyTemplate withObject:object] dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)urlEncodeDictionary:(NSDictionary *)dictionary {
    
    NSMutableArray *pairs = [NSMutableArray array];

    for (NSString *key in [dictionary keyEnumerator]) {
        
        id value = dictionary[key];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            for (NSString *subkey in value) {
                [pairs addObject:[NSString stringWithFormat:@"%@[%@]=%@", key, subkey, [APStringUtils urlEncodeString:[value objectForKey:subkey]]]];
            }
        } else if ([value isKindOfClass:[NSArray class]]) {
            for (NSString *subValue in value) {
                [pairs addObject:[NSString stringWithFormat:@"%@[]=%@", key, [APStringUtils urlEncodeString:subValue]]];
            }
        } else if ([value isKindOfClass:[NSString class]]) {
            [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, [APStringUtils urlEncodeString:value]]];
        } else {
            [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
        }
    }

    return [pairs componentsJoinedByString:@"&"];
}

@end
