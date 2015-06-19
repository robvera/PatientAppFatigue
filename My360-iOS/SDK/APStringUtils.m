//
//  APStringUtils.m
//  AnyPresence SDK
//

#import "AuthManager.h"
#import "APStringUtils.h"
#import "APObject+Reflection.h"

NSString * const kAPInterpolationErrorDomain = @"APInterpolationError";
NSInteger  const kAPInterpolationErrorCodeInvalidKeyPath = 1;
NSString * const kAPInterpolationDefaultKey = @":";
NSString * const kAPInterpolationUserKey = @"user";
NSString * const kAPInterpolationRelationKey = @".";

@implementation APStringUtils

#pragma mark - Context

+ (NSDictionary *)context:(id)context withInstanceOfSelf:(APObject *)object {
    
    if (!object && !context) {
        return @{};
    }
    
    if (!context) {
        return @{kAPInterpolationDefaultKey: object};
    }
    
    NSMutableDictionary *fullContext;
    if ([context isKindOfClass:[NSDictionary class]]) {
        fullContext = [context mutableCopy];
        if (object) {
            fullContext[kAPInterpolationDefaultKey] = object;
        }
    } else {
        if (object && [object respondsToSelector:@selector(data)]) {
            fullContext = [[object data] mutableCopy];
        } else {
            fullContext = [NSMutableDictionary dictionary];
        }

        fullContext[kAPInterpolationDefaultKey] = context;
    }
    return fullContext;
}

#pragma mark - String Interpolation

+ (NSString *)interpolateString:(id)string withObject:(id)obj {
    
    id object = [self dictionaryWithObject:obj user:[AuthManager defaultManager].currentCredentials];

    NSDictionary * objects;
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        objects = object;
    } else {
        objects = [[NSDictionary alloc] initWithObjectsAndKeys:object, kAPInterpolationDefaultKey, nil];
    }
    
    NSString * pattern = @"\\{\\{(?:(\\w+)\\:)?([\\.\\w]+)\\}\\}";
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    __block NSMutableDictionary * values = [[NSMutableDictionary alloc] initWithCapacity:matches.count];
    
    void (^addMatch)(NSString *, id, BOOL, NSMutableDictionary *) =
    ^(NSString * original, id object, BOOL didError, NSMutableDictionary * values) {
        
        if (original) {
            
            id value;
            
            if (didError) {
                value = original;
            } else {
                value = object ? : original;
            }
            
            [values setObject:value ? : @"" forKey:original];
        }
    };
    
    NSString * (^replaceMatches)(NSString *, NSDictionary *, Update callback) =
    ^(NSString * string, NSDictionary * values, Update callback) {
        
        NSMutableString * result = [string mutableCopy];
        
        for (NSString * key in values) {
            id value = [values objectForKey:key];
            [result replaceOccurrencesOfString:key withString:[value description] options:0 range:NSMakeRange(0, result.length)];
        }
        
        if (callback) {
            callback([result copy]);
        }
        
        return result;
    };
    
    for (NSTextCheckingResult * match in matches) {
        
        id object = [objects objectForKey:kAPInterpolationDefaultKey];
        NSRange prefix = [match rangeAtIndex:1];
        
        if (prefix.location != NSNotFound) {
            NSString * key = [string substringWithRange:prefix];
            object = [objects objectForKey:key];
        }
        
        NSRange value = [match rangeAtIndex:2];
        
        if (value.location != NSNotFound) {
            NSString * original = [string substringWithRange:[match rangeAtIndex:0]];
            
            if (![values objectForKey:original]) {
                
                NSString * path = [string substringWithRange:value];
                
                if ([path containsString:kAPInterpolationRelationKey]) {
                    
                    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:kAPInterpolationRelationKey];
                    NSMutableArray *relation = [[path componentsSeparatedByCharactersInSet:charSet] mutableCopy];
                    
                    if (![relation.firstObject isKindOfClass:[NSString class]]) {
                        object = [objects objectForKey:relation.firstObject];
                        [relation removeObjectAtIndex:0];
                        path = [relation componentsJoinedByString:@"."];
                    }
                }
                
                id current;
                BOOL didError = NO;
                
                current = [self object:object valueForKeyPath:path didError:nil];
                
                if (!current) {
                    current = [self object:objects valueForKeyPath:path didError:&didError];
                }
                
                addMatch(original, current, didError, values);
            }
        }
    }
    
    return replaceMatches(string, values, nil);
}

#pragma mark - Private Helpers

+ (id)object:(id)object valueForKeyPath:(NSString *)keyPath didError:(BOOL *)didError {
    
    @try {
        return [object valueForKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        
        if (didError) {
            *didError = YES;
        }
        
        return nil;
    }
}

+ (NSDictionary *)dictionaryWithObject:(id)object user:(APObject<Authorizable> *)credentials {
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    if (object) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            [dict addEntriesFromDictionary:object];
        } else {
            [dict setObject:object forKey:kAPInterpolationDefaultKey];
        }
    }

    if (credentials) {
        [dict setObject:credentials forKey:kAPInterpolationUserKey];
    }
    
    return dict;
}

+ (NSString *)urlEncodeString:(NSString *)string {
    return (__bridge_transfer NSString *) CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                  (__bridge CFStringRef)string,
                                                                                  NULL,
                                                                                  (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                  kCFStringEncodingUTF8);
}

@end
