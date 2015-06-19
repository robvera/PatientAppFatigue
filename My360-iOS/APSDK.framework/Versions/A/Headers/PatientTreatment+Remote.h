//
//  PatientTreatment+Remote.h
//  AnyPresence SDK
//

/*!
 @header PatientTreatment+Remote
 @abstract Remote category for PatientTreatment class
 */

#import "PatientTreatment.h"

/*!
 @category PatientTreatment (Remote)
 @abstract Adds remote CRUD capabilities to PatientTreatment.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Remote) @/link methods.
 */ 
@interface PatientTreatment (Remote)

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
 @method unarchivedPatientTreatmentsWithPatientId:appId:error:
 @abstract Fetches objects matching query scope "unarchived_patient_treatments" from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method unarchivedPatientTreatmentsWithPatientId:appId:context:error:
 @abstract Fetches objects matching query scope "unarchived_patient_treatments" from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method unarchivedPatientTreatmentsWithPatientId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "unarchived_patient_treatments" from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method unarchivedPatientTreatmentsWithPatientId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "unarchived_patient_treatments" from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedTreatmentsWithId:appId:error:
 @abstract Fetches objects matching query scope "my_unarchived_treatments" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myUnarchivedTreatmentsWithId:appId:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_treatments" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedTreatmentsWithId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_unarchived_treatments" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myUnarchivedTreatmentsWithId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_treatments" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedMedicationsWithId:appId:error:
 @abstract Fetches objects matching query scope "my_unarchived_medications" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myUnarchivedMedicationsWithId:appId:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_medications" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedMedicationsWithId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_unarchived_medications" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myUnarchivedMedicationsWithId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_medications" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method adherenceTreatmentsError:
 @abstract Fetches objects matching query scope "adherence_treatments" from remote server.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceTreatmentsError:(NSError **)error;

/*!
 @method adherenceTreatmentsWithContext:error:
 @abstract Fetches objects matching query scope "adherence_treatments" from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceTreatmentsWithContext:(id)context error:(NSError **)error;

/*!
 @method adherenceTreatmentsWithOffset:limit:error:
 @abstract Fetches objects matching query scope "adherence_treatments" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method adherenceTreatmentsWithOffset:limit:context:error:
 @abstract Fetches objects matching query scope "adherence_treatments" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myTreatmentsWithId:appId:error:
 @abstract Fetches objects matching query scope "my_treatments" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myTreatmentsWithId:appId:context:error:
 @abstract Fetches objects matching query scope "my_treatments" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myTreatmentsWithId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_treatments" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myTreatmentsWithId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_treatments" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myMedicationsWithId:medicationId:appId:error:
 @abstract Fetches objects matching query scope "my_medications" from remote server.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myMedicationsWithId:medicationId:appId:context:error:
 @abstract Fetches objects matching query scope "my_medications" from remote server.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myMedicationsWithId:medicationId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_medications" from remote server, with pagination.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myMedicationsWithId:medicationId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_medications" from remote server, with pagination.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

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
 @method unarchivedPatientTreatmentsWithPatientId:appId:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_treatments", then fetches fresh ones from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientTreatmentsWithPatientId:appId:context:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_treatments", then fetches fresh ones from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientTreatmentsWithPatientId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_treatments", then fetches fresh ones from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientTreatmentsWithPatientId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_treatments", then fetches fresh ones from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedTreatmentsWithId:appId:async:
 @abstract Returns cached objects matching query scope "my_unarchived_treatments", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedTreatmentsWithId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_treatments", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedTreatmentsWithId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_unarchived_treatments", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedTreatmentsWithId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_treatments", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedMedicationsWithId:appId:async:
 @abstract Returns cached objects matching query scope "my_unarchived_medications", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedMedicationsWithId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_medications", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedMedicationsWithId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_unarchived_medications", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedMedicationsWithId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_medications", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method adherenceTreatmentsAsync:
 @abstract Returns cached objects matching query scope "adherence_treatments", then fetches fresh ones from remote server.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceTreatmentsAsync:(APObjectsCallback)callback;

/*!
 @method adherenceTreatmentsWithContext:async:
 @abstract Returns cached objects matching query scope "adherence_treatments", then fetches fresh ones from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceTreatmentsWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method adherenceTreatmentsWithOffset:limit:async:
 @abstract Returns cached objects matching query scope "adherence_treatments", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method adherenceTreatmentsWithOffset:limit:context:async:
 @abstract Returns cached objects matching query scope "adherence_treatments", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myTreatmentsWithId:appId:async:
 @abstract Returns cached objects matching query scope "my_treatments", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myTreatmentsWithId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_treatments", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myTreatmentsWithId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_treatments", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myTreatmentsWithId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_treatments", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myMedicationsWithId:medicationId:appId:async:
 @abstract Returns cached objects matching query scope "my_medications", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myMedicationsWithId:medicationId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_medications", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myMedicationsWithId:medicationId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_medications", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myMedicationsWithId:medicationId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_medications", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

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
