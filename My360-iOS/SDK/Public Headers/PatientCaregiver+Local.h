//
//  PatientCaregiver+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientCaregiver+Local
 @abstract Local category for PatientCaregiver class
 */

#import "PatientCaregiver.h"

/*!
 @category PatientCaregiver (Local)
 @abstract Adds local query capabilities to PatientCaregiver.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientCaregiver (Local)

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
 @method myCaregiverLocalWithId:offset:limit:
 @abstract Fetches objects matching query scope "my_caregiver" from local cache, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myCaregiverLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end