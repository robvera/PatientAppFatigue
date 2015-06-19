//
//  PatientMedicalCondition+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientMedicalCondition+Local
 @abstract Local category for PatientMedicalCondition class
 */

#import "PatientMedicalCondition.h"

/*!
 @category PatientMedicalCondition (Local)
 @abstract Adds local query capabilities to PatientMedicalCondition.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientMedicalCondition (Local)

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
 @method unarchivedPatientMedCondLocalWithPatientId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_med_cond" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientMedCondLocalWithPatientId:(NSNumber *)patientId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myMedicalConditionsLocalWithId:offset:limit:
 @abstract Fetches objects matching query scope "my_medical_conditions" from local cache, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myMedicalConditionsLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end