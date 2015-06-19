//
//  Patient+Local.h
//  AnyPresence SDK
//

/*!
 @header Patient+Local
 @abstract Local category for Patient class
 */

#import "Patient.h"

/*!
 @category Patient (Local)
 @abstract Adds local query capabilities to Patient.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface Patient (Local)

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
 @method clinicianPatientsLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "clinician_patients" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)clinicianPatientsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method clinicianAllPatientsLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "clinician_all_patients" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)clinicianAllPatientsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end