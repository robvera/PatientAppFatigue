//
//  PatientExacerbation+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientExacerbation+Local
 @abstract Local category for PatientExacerbation class
 */

#import "PatientExacerbation.h"

/*!
 @category PatientExacerbation (Local)
 @abstract Adds local query capabilities to PatientExacerbation.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientExacerbation (Local)

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
 @method unarchivedPatientExacerbationsLocalWithPatientId:appId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_exacerbations" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientExacerbationsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myUnarchivedExacerbationsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_exacerbations" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedExacerbationsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method chartExacerbationReasonsLocalWithStartDate:endDate:patientId:appId:offset:limit:
 @abstract Fetches objects matching query scope "chart_exacerbation_reasons" from local cache, with pagination.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)chartExacerbationReasonsLocalWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate patientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end