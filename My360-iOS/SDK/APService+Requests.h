//
//  APService+Requests.h
//  AnyPresence SDK
//

#import "APObject.h"
#import "APService.h"
#import "APRequest.h"
#import "APEndPointConfiguration.h"

@interface APService (Requests)

+ (APRequest *)requestWithVerb:(APRequestVerb)verb
                           URL:(NSURL *)URL
                      resource:(NSString *)resource
                            id:(NSString *)ID
                         query:(NSDictionary *)query
                        object:(APObject *)object
                       context:(id)context
                        config:(APEndPointConfiguration *)config;

@end
