//
//  APService+Internal.h
//  AnyPresence SDK
//

#import "APService.h"
#import "APService+Requests.h"

@interface APService (Internal)

+ (NSURL *)baseURL;
+ (NSData *)certificatePathToData:(NSString *)path dataSource:(id)sender;
+ (void)resetSSLPinning;
+ (NSString *)verb:(APRequestVerb)verb;
+ (NSDictionary *)httpHeaders;
+ (NSDictionary *)urlParameters;

@end
