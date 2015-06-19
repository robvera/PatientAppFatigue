//
//  PatientReminder+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientReminder+Local
 @abstract Local category for PatientReminder class
 */

#import "PatientReminder.h"

/*!
 @category PatientReminder (Local)
 @abstract Adds local query capabilities to PatientReminder.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientReminder (Local)

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
 @method myUnarchivedAlertsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_alerts" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedAlertsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method processAllLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "process_all" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)processAllLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method setReadLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "set_read" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)setReadLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method processOneLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "process_one" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)processOneLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end