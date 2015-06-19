//
//  PatientGlucose+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientGlucose+Local
 @abstract Local category for PatientGlucose class
 */

#import "PatientGlucose.h"

/*!
 @category PatientGlucose (Local)
 @abstract Adds local query capabilities to PatientGlucose.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientGlucose (Local)

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
 @method myUnarchivedGlucoseLocalWithId:appId:fromDate:toDate:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_glucose" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param fromDate Scope parameter - fromDate.
 @param toDate Scope parameter - toDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedGlucoseLocalWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method unarchivedPatientGlucoseLocalWithPatientId:appId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_glucose" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientGlucoseLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end