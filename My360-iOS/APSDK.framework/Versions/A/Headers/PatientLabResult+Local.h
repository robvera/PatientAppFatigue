//
//  PatientLabResult+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientLabResult+Local
 @abstract Local category for PatientLabResult class
 */

#import "PatientLabResult.h"

/*!
 @category PatientLabResult (Local)
 @abstract Adds local query capabilities to PatientLabResult.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientLabResult (Local)

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
 @method unarchivedPatientLabresultsLocalWithPatientId:appId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_labresults" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientLabresultsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myUnarchivedLabResultsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_lab_results" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedLabResultsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end