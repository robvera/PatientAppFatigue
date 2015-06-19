//
//  PatientAdherenceLog+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientAdherenceLog+Local
 @abstract Local category for PatientAdherenceLog class
 */

#import "PatientAdherenceLog.h"

/*!
 @category PatientAdherenceLog (Local)
 @abstract Adds local query capabilities to PatientAdherenceLog.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientAdherenceLog (Local)

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
 @method unarchivedPatientAdhereLogsLocalWithPatientTreatmentId:appId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_adhere_logs" from local cache, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsLocalWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method treatmentAdherenceForDatesLocalWithPatientTreatmentId:startDate:endDate:offset:limit:
 @abstract Fetches objects matching query scope "treatment_adherence_for_dates" from local cache, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)treatmentAdherenceForDatesLocalWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method chartMissingDosesLocalWithPatientTreatmentId:startDate:endDate:offset:limit:
 @abstract Fetches objects matching query scope "chart_missing_doses" from local cache, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)chartMissingDosesLocalWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myAdherenceLogsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_adherence_logs" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myAdherenceLogsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method filterScopeLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "filter_scope" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)filterScopeLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method adherenceForDateTreatmentLocalWithId:date:patientTreatmentId:appId:offset:limit:
 @abstract Fetches objects matching query scope "adherence_for_date_treatment" from local cache, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)adherenceForDateTreatmentLocalWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end