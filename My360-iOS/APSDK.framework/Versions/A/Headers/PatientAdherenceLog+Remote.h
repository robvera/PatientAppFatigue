//
//  PatientAdherenceLog+Remote.h
//  AnyPresence SDK
//

/*!
 @header PatientAdherenceLog+Remote
 @abstract Remote category for PatientAdherenceLog class
 */

#import "PatientAdherenceLog.h"

/*!
 @category PatientAdherenceLog (Remote)
 @abstract Adds remote CRUD capabilities to PatientAdherenceLog.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Remote) @/link methods.
 */ 
@interface PatientAdherenceLog (Remote)

/*!
 @method allError:
 @abstract Fetches objects matching query scope "all" from remote server.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)allError:(NSError **)error;

/*!
 @method allWithContext:error:
 @abstract Fetches objects matching query scope "all" from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)allWithContext:(id)context error:(NSError **)error;

/*!
 @method allWithOffset:limit:error:
 @abstract Fetches objects matching query scope "all" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method allWithOffset:limit:context:error:
 @abstract Fetches objects matching query scope "all" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method exactMatchWithParams:error:
 @abstract Fetches objects matching query scope "exact_match" from remote server.
 @param params Scope parameter - params.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params error:(NSError **)error;

/*!
 @method exactMatchWithParams:context:error:
 @abstract Fetches objects matching query scope "exact_match" from remote server.
 @param params Scope parameter - params.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params context:(id)context error:(NSError **)error;

/*!
 @method exactMatchWithParams:offset:limit:error:
 @abstract Fetches objects matching query scope "exact_match" from remote server, with pagination.
 @param params Scope parameter - params.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method exactMatchWithParams:offset:limit:context:error:
 @abstract Fetches objects matching query scope "exact_match" from remote server, with pagination.
 @param params Scope parameter - params.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:error:
 @abstract Fetches objects matching query scope "unarchived_patient_adhere_logs" from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:context:error:
 @abstract Fetches objects matching query scope "unarchived_patient_adhere_logs" from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "unarchived_patient_adhere_logs" from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "unarchived_patient_adhere_logs" from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:error:
 @abstract Fetches objects matching query scope "treatment_adherence_for_dates" from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate error:(NSError **)error;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:context:error:
 @abstract Fetches objects matching query scope "treatment_adherence_for_dates" from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context error:(NSError **)error;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:offset:limit:error:
 @abstract Fetches objects matching query scope "treatment_adherence_for_dates" from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:offset:limit:context:error:
 @abstract Fetches objects matching query scope "treatment_adherence_for_dates" from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:error:
 @abstract Fetches objects matching query scope "chart_missing_doses" from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate error:(NSError **)error;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:context:error:
 @abstract Fetches objects matching query scope "chart_missing_doses" from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context error:(NSError **)error;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:offset:limit:error:
 @abstract Fetches objects matching query scope "chart_missing_doses" from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:offset:limit:context:error:
 @abstract Fetches objects matching query scope "chart_missing_doses" from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myAdherenceLogsWithId:appId:error:
 @abstract Fetches objects matching query scope "my_adherence_logs" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myAdherenceLogsWithId:appId:context:error:
 @abstract Fetches objects matching query scope "my_adherence_logs" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myAdherenceLogsWithId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_adherence_logs" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myAdherenceLogsWithId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_adherence_logs" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method filterScopeError:
 @abstract Fetches objects matching query scope "filter_scope" from remote server.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)filterScopeError:(NSError **)error;

/*!
 @method filterScopeWithContext:error:
 @abstract Fetches objects matching query scope "filter_scope" from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)filterScopeWithContext:(id)context error:(NSError **)error;

/*!
 @method filterScopeWithOffset:limit:error:
 @abstract Fetches objects matching query scope "filter_scope" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method filterScopeWithOffset:limit:context:error:
 @abstract Fetches objects matching query scope "filter_scope" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:error:
 @abstract Fetches objects matching query scope "adherence_for_date_treatment" from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:context:error:
 @abstract Fetches objects matching query scope "adherence_for_date_treatment" from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "adherence_for_date_treatment" from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "adherence_for_date_treatment" from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method countError:
 @abstract Executes aggregate query "count" on remote server.
 @param error Error that has occured while executing the request, if any.
 @result Result of aggregate query.
 */
+ (NSNumber *)countError:(NSError **)error;

/*!
 @method countWithContext:error:
 @abstract Executes aggregate query "count" on remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Result of aggregate query.
 */
+ (NSNumber *)countWithContext:(id)context error:(NSError **)error;

/*!
 @method countExactMatchWithParams:error:
 @abstract Executes aggregate query "count_exact_match" on remote server.
 @param params Scope parameter - params.
 @param error Error that has occured while executing the request, if any.
 @result Result of aggregate query.
 */
+ (NSNumber *)countExactMatchWithParams:(NSDictionary *)params error:(NSError **)error;

/*!
 @method countExactMatchWithParams:context:error:
 @abstract Executes aggregate query "count_exact_match" on remote server.
 @param params Scope parameter - params.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Result of aggregate query.
 */
+ (NSNumber *)countExactMatchWithParams:(NSDictionary *)params context:(id)context error:(NSError **)error;

/*!
 @method allAsync:
 @abstract Returns cached objects matching query scope "all", then fetches fresh ones from remote server.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)allAsync:(APObjectsCallback)callback;

/*!
 @method allWithContext:async:
 @abstract Returns cached objects matching query scope "all", then fetches fresh ones from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)allWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method allWithOffset:limit:async:
 @abstract Returns cached objects matching query scope "all", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method allWithOffset:limit:context:async:
 @abstract Returns cached objects matching query scope "all", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method exactMatchWithParams:async:
 @abstract Returns cached objects matching query scope "exact_match", then fetches fresh ones from remote server.
 @param params Scope parameter - params.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params async:(APObjectsCallback)callback;

/*!
 @method exactMatchWithParams:context:async:
 @abstract Returns cached objects matching query scope "exact_match", then fetches fresh ones from remote server.
 @param params Scope parameter - params.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params context:(id)context async:(APObjectsCallback)callback;

/*!
 @method exactMatchWithParams:offset:limit:async:
 @abstract Returns cached objects matching query scope "exact_match", then fetches fresh ones from remote server, with pagination.
 @param params Scope parameter - params.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method exactMatchWithParams:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "exact_match", then fetches fresh ones from remote server, with pagination.
 @param params Scope parameter - params.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_adhere_logs", then fetches fresh ones from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:context:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_adhere_logs", then fetches fresh ones from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_adhere_logs", then fetches fresh ones from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientAdhereLogsWithPatientTreatmentId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_adhere_logs", then fetches fresh ones from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:async:
 @abstract Returns cached objects matching query scope "treatment_adherence_for_dates", then fetches fresh ones from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate async:(APObjectsCallback)callback;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:context:async:
 @abstract Returns cached objects matching query scope "treatment_adherence_for_dates", then fetches fresh ones from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context async:(APObjectsCallback)callback;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:offset:limit:async:
 @abstract Returns cached objects matching query scope "treatment_adherence_for_dates", then fetches fresh ones from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method treatmentAdherenceForDatesWithPatientTreatmentId:startDate:endDate:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "treatment_adherence_for_dates", then fetches fresh ones from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:async:
 @abstract Returns cached objects matching query scope "chart_missing_doses", then fetches fresh ones from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate async:(APObjectsCallback)callback;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:context:async:
 @abstract Returns cached objects matching query scope "chart_missing_doses", then fetches fresh ones from remote server.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context async:(APObjectsCallback)callback;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:offset:limit:async:
 @abstract Returns cached objects matching query scope "chart_missing_doses", then fetches fresh ones from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method chartMissingDosesWithPatientTreatmentId:startDate:endDate:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "chart_missing_doses", then fetches fresh ones from remote server, with pagination.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param startDate Scope parameter - startDate.
 @param endDate Scope parameter - endDate.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myAdherenceLogsWithId:appId:async:
 @abstract Returns cached objects matching query scope "my_adherence_logs", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myAdherenceLogsWithId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_adherence_logs", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myAdherenceLogsWithId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_adherence_logs", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myAdherenceLogsWithId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_adherence_logs", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method filterScopeAsync:
 @abstract Returns cached objects matching query scope "filter_scope", then fetches fresh ones from remote server.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)filterScopeAsync:(APObjectsCallback)callback;

/*!
 @method filterScopeWithContext:async:
 @abstract Returns cached objects matching query scope "filter_scope", then fetches fresh ones from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)filterScopeWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method filterScopeWithOffset:limit:async:
 @abstract Returns cached objects matching query scope "filter_scope", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method filterScopeWithOffset:limit:context:async:
 @abstract Returns cached objects matching query scope "filter_scope", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:async:
 @abstract Returns cached objects matching query scope "adherence_for_date_treatment", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:context:async:
 @abstract Returns cached objects matching query scope "adherence_for_date_treatment", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "adherence_for_date_treatment", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method adherenceForDateTreatmentWithId:date:patientTreatmentId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "adherence_for_date_treatment", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param patientTreatmentId Scope parameter - patientTreatmentId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method countAsync:
 @abstract Executes aggregate query "count" on remote server.
 @param callback Callback to be executed when operation completes.
 */
+ (void)countAsync:(APObjectsCallback)callback;

/*!
 @method countWithContext:async:
 @abstract Executes aggregate query "count" on remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 */
+ (void)countWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method countExactMatchWithParams:async:
 @abstract Executes aggregate query "count_exact_match" on remote server.
 @param params Scope parameter - params.
 @param callback Callback to be executed when operation completes.
 */
+ (void)countExactMatchWithParams:(NSDictionary *)params async:(APObjectsCallback)callback;

/*!
 @method countExactMatchWithParams:context:async:
 @abstract Executes aggregate query "count_exact_match" on remote server.
 @param params Scope parameter - params.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 */
+ (void)countExactMatchWithParams:(NSDictionary *)params context:(id)context async:(APObjectsCallback)callback;

@end
