//
//  APQuery.m
//  AnyPresence SDK
//

#import "APQuery.h"
#import "NSObject+Reflection.h"
#import "NSData+Serialization.m"
#import "APEndPointConfiguration.h"
#import "APStringUtils.h"
#import "AnyPresenceAPI.h"

@interface APQuery ()

NSString * UrlEscape(NSString * unescaped);

@end

@implementation APQuery

#pragma mark - Public

+ (NSDictionary *)query:(NSString *)scope params:(NSDictionary *)params dataSource:(id)dataSource {
    return [self query:scope params:params context:nil dataSource:dataSource];
}

+ (NSDictionary *)query:(NSString *)scope params:(NSDictionary *)params context:(id)context dataSource:(id)dataSource {
    
    NSMutableDictionary * serialized = [[NSMutableDictionary alloc] initWithCapacity:params.count];
    
    for (id key in params) {
        
        id value = [params encodeValue:params[key] ofType:[params[key] class]];
        
        if ([value isKindOfClass:[NSString class]]) {
            value = [APStringUtils interpolateString:value withObject:context];
        }
        
        [serialized setObject:value forKey:key];
    }
    
    if ([[dataSource class] isSubclassOfClass:[AnyPresenceAPI class]]) {
        return @{ @"scope" : scope,
                  @"query" : serialized };
    }
    
    return serialized;
}

+ (NSDictionary *)pagination:(NSUInteger)offset limit:(NSUInteger)limit {
    return @{ @"offset": [NSString stringWithFormat:@"%lu", (unsigned long)offset],
              @"limit" : [NSString stringWithFormat:@"%lu", (unsigned long)limit] };
}

+ (NSDictionary *)pagination:(NSUInteger)offset limit:(NSUInteger)limit config:(APEndPointConfiguration *)config {
    return @{ (config.offset ?: @"offset") : [NSString stringWithFormat:@"%lu", (unsigned long)offset],
              (config.limit ?: @"limit") : [NSString stringWithFormat:@"%lu", (unsigned long)limit] };
}

@end
