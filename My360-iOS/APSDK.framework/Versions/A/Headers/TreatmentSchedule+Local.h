//
//  TreatmentSchedule+Local.h
//  AnyPresence SDK
//

/*!
 @header TreatmentSchedule+Local
 @abstract Local category for TreatmentSchedule class
 */

#import "TreatmentSchedule.h"

/*!
 @category TreatmentSchedule (Local)
 @abstract Adds local query capabilities to TreatmentSchedule.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface TreatmentSchedule (Local)

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
 @method activeTreatmentSchedulesLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "active_treatment_schedules" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)activeTreatmentSchedulesLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end