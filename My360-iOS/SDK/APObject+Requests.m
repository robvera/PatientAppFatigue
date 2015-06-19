//
//  APObject+Requests.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Requests.h"
#import "APService+Requests.h"
#import "APObject+Reflection.h"
#import "NSObject+Reflection.h"

@implementation APObject (Requests)

+ (APRequest *)requestWithVerb:(APRequestVerb)verb context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:[[self class] controller] id:nil query:nil object:nil context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb object:(APObject *)object context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:[[self class] controller] id:nil query:nil object:object context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb query:(NSDictionary *)query context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:[[self class] controller] id:nil query:query object:nil context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb id:(NSString *)ID context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:[[self class] controller] id:ID query:nil object:nil context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb id:(NSString *)ID object:(APObject *)object context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:[[self class] controller] id:ID query:nil object:object context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb resource:(NSString *)resource context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:resource id:nil query:nil object:nil context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb resource:(NSString *)resource object:(APObject *)object context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:nil resource:resource id:nil query:nil object:object context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb URL:(NSURL *)URL context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:URL resource:nil id:nil query:nil object:nil context:context config:config];
}

+ (APRequest *)requestWithVerb:(APRequestVerb)verb URL:(NSURL *)URL object:(APObject *)object context:(id)context config:(APEndPointConfiguration *)config {
    return [[self dataSource] requestWithVerb:verb URL:URL resource:nil id:nil query:nil object:object context:context config:config];
}

@end
