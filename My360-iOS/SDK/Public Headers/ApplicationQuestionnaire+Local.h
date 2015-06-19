//
//  ApplicationQuestionnaire+Local.h
//  AnyPresence SDK
//

/*!
 @header ApplicationQuestionnaire+Local
 @abstract Local category for ApplicationQuestionnaire class
 */

#import "ApplicationQuestionnaire.h"

/*!
 @category ApplicationQuestionnaire (Local)
 @abstract Adds local query capabilities to ApplicationQuestionnaire.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface ApplicationQuestionnaire (Local)

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
 @method myAppQuestionsLocalWithAppId:offset:limit:
 @abstract Fetches objects matching query scope "my_app_questions" from local cache, with pagination.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myAppQuestionsLocalWithAppId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end