//
//  UserProfile+Local.h
//  AnyPresence SDK
//

/*!
 @header UserProfile+Local
 @abstract Local category for UserProfile class
 */

#import "UserProfile.h"

/*!
 @category UserProfile (Local)
 @abstract Adds local query capabilities to UserProfile.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface UserProfile (Local)

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
 @method myProfileLocalWithId:offset:limit:
 @abstract Fetches objects matching query scope "my_profile" from local cache, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myProfileLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end