//
//  PatientJournal+Remote.h
//  AnyPresence SDK
//

/*!
 @header PatientJournal+Remote
 @abstract Remote category for PatientJournal class
 */

#import "PatientJournal.h"

/*!
 @category PatientJournal (Remote)
 @abstract Adds remote CRUD capabilities to PatientJournal.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Remote) @/link methods.
 */ 
@interface PatientJournal (Remote)

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
 @method unarchivedPatientJournalsWithPatientId:appId:error:
 @abstract Fetches objects matching query scope "unarchived_patient_journals" from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method unarchivedPatientJournalsWithPatientId:appId:context:error:
 @abstract Fetches objects matching query scope "unarchived_patient_journals" from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method unarchivedPatientJournalsWithPatientId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "unarchived_patient_journals" from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method unarchivedPatientJournalsWithPatientId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "unarchived_patient_journals" from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedJournalsWithId:appId:error:
 @abstract Fetches objects matching query scope "my_unarchived_journals" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myUnarchivedJournalsWithId:appId:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_journals" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedJournalsWithId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_unarchived_journals" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myUnarchivedJournalsWithId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_journals" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method journalDateMatchWithId:date:appId:error:
 @abstract Fetches objects matching query scope "journal_date_match" from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method journalDateMatchWithId:date:appId:context:error:
 @abstract Fetches objects matching query scope "journal_date_match" from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method journalDateMatchWithId:date:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "journal_date_match" from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method journalDateMatchWithId:date:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "journal_date_match" from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

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
 @method unarchivedPatientJournalsWithPatientId:appId:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_journals", then fetches fresh ones from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientJournalsWithPatientId:appId:context:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_journals", then fetches fresh ones from remote server.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientJournalsWithPatientId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_journals", then fetches fresh ones from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method unarchivedPatientJournalsWithPatientId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "unarchived_patient_journals", then fetches fresh ones from remote server, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedJournalsWithId:appId:async:
 @abstract Returns cached objects matching query scope "my_unarchived_journals", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedJournalsWithId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_journals", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedJournalsWithId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_unarchived_journals", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedJournalsWithId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_journals", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method journalDateMatchWithId:date:appId:async:
 @abstract Returns cached objects matching query scope "journal_date_match", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method journalDateMatchWithId:date:appId:context:async:
 @abstract Returns cached objects matching query scope "journal_date_match", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method journalDateMatchWithId:date:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "journal_date_match", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method journalDateMatchWithId:date:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "journal_date_match", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param date Scope parameter - date.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

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
