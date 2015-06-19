//
//  APCachedRequest.h
//  AnyPresence SDK
//

#import <Foundation/Foundation.h>
#import "APManagedDataObject.h"

@interface APCachedRequest : APManagedDataObject

@property (nonatomic, retain, readonly) NSString * resource;
@property (nonatomic, retain, readonly) NSString * scope;
@property (nonatomic, retain, readonly) NSDictionary * parameters;
@property (nonatomic, retain) NSOrderedSet * objects;

+ (APCachedRequest *)requestWithResource:(NSString *)resource scope:(NSString *)scope params:(NSDictionary *)parameters;

@end

