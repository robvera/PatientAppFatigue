//
//  APQuery.h
//  AnyPresence SDK
//

#import <Foundation/Foundation.h>

@class APEndPointConfiguration;

@interface APQuery : NSObject

+ (NSDictionary *)query:(NSString *)scope params:(NSDictionary *)params dataSource:(id)dataSource;
+ (NSDictionary *)query:(NSString *)scope params:(NSDictionary *)params context:(id)context dataSource:(id)dataSource;
+ (NSDictionary *)pagination:(NSUInteger)offset limit:(NSUInteger)limit;
+ (NSDictionary *)pagination:(NSUInteger)offset limit:(NSUInteger)limit config:(APEndPointConfiguration *)config;

@end
