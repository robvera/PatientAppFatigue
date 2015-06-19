//
//  PatientClinician+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientClinician+Local
 @abstract Local category for PatientClinician class
 */

#import "PatientClinician.h"

/*!
 @category PatientClinician (Local)
 @abstract Adds local query capabilities to PatientClinician.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientClinician (Local)

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
 @method myCliniciansLocalWithId:offset:limit:
 @abstract Fetches objects matching query scope "my_clinicians" from local cache, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myCliniciansLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myPatientsLocalWithClinicianId:offset:limit:
 @abstract Fetches objects matching query scope "my_patients" from local cache, with pagination.
 @param clinicianId Scope parameter - clinicianId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myPatientsLocalWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end