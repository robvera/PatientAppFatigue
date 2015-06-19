//
//  Setting+Local.h
//  AnyPresence SDK
//

/*!
 @header Setting+Local
 @abstract Local category for Setting class
 */

#import "Setting.h"

/*!
 @category Setting (Local)
 @abstract Adds local query capabilities to Setting.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface Setting (Local)

/*!
 @method allLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "all" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method exactMatchLocalWithParams:offset:limit:
 @abstract Fetches objects matching query scope "exact_match" from local cache, with pagination.
 @param params Scope parameter - params.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myAppSettingLocalWithAppId:offset:limit:
 @abstract Fetches objects matching query scope "my_app_setting" from local cache, with pagination.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myAppSettingLocalWithAppId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end