//
//  APObject+Requests.h
//  AnyPresence SDK
//

#import <Foundation/Foundation.h>
#import "APObject.h"
#import "APRequest.h"
#import "APService+Internal.h"
#import "APEndPointConfiguration.h"

@interface APObject (Requests)

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                        object:(APObject *)object
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                         query:(NSDictionary *)query
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                            id:(NSString *)ID
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                            id:(NSString *)ID
                        object:(APObject *)object
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                      resource:(NSString *)resource
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                      resource:(NSString *)resource
                        object:(APObject *)object
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                           URL:(NSURL *)URL
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                           URL:(NSURL *)URL
                        object:(APObject *)object
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

@end
