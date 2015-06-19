//
//  APService+Requests.m
//  AnyPresence SDK
//

#import "APService+Internal.h"
#import "APService+Requests.h"
#import "APObject+Reflection.h"
#import "NSData+Serialization.h"
#import "APStringUtils.h"
#import "NSObject+Reflection.h"

@implementation APService (Requests)

#pragma mark - Public

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                           URL:(NSURL *)URL
                      resource:(NSString *)resource
                            id:(NSString *)ID
                         query:(NSDictionary *)query
                        object:(APObject *)object
                       context:(id)context
                        config:(APEndPointConfiguration *)config {
    
    APRequest *request;
    NSString *requestVerb = config.httpVerb ?: [[self class] verb:verb];
    NSString *incrementalPath = config.incrementalPath ?: resource;
    
    if (URL) {
        assert(!resource && !ID && !query);
        request = [[APRequest alloc] initWithVerb:requestVerb URL:URL dataSource:self];
    } else {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params addEntriesFromDictionary:[[self class] urlParameters]];
        [params addEntriesFromDictionary:config.incrementalURLParameters];
        [params addEntriesFromDictionary:query];

        NSMutableDictionary *interpolatedParams = [NSMutableDictionary dictionaryWithCapacity:[params count]];
        
        for (id key in params) {
            
            id value = [params encodeValue:params[key] ofType:[params[key] class]];
            
            if ([value isKindOfClass:[NSString class]]) {
                value = [APStringUtils interpolateString:value withObject:context];
            }
            
            [interpolatedParams setObject:value forKey:key];
        }
        
        request = [[APRequest alloc] initWithVerb:requestVerb
                                         resource:[incrementalPath stringByAppendingPathComponent:ID]
                                            query:interpolatedParams
                                       dataSource:self];
    }
    
    if (object) {
        [request setBody:[NSData serializedDataFromObject:object withConfig:config] as:config.contentType];
    }

    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers addEntriesFromDictionary:[[self class] httpHeaders]];
    [headers addEntriesFromDictionary:config.incrementalHttpHeaders];
    [request setHttpHeaders:headers];
    
    [request setContext:context];
    
    return request;
}

@end
