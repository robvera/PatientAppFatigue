//
//  PatientReminder+Remote.h
//  AnyPresence SDK
//

/*!
 @header PatientReminder+Remote
 @abstract Remote category for PatientReminder class
 */

#import "PatientReminder.h"

/*!
 @category PatientReminder (Remote)
 @abstract Adds remote CRUD capabilities to PatientReminder.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Remote) @/link methods.
 */ 
@interface PatientReminder (Remote)

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
 @method myUnarchivedAlertsWithId:appId:error:
 @abstract Fetches objects matching query scope "my_unarchived_alerts" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error;

/*!
 @method myUnarchivedAlertsWithId:appId:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_alerts" from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error;

/*!
 @method myUnarchivedAlertsWithId:appId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_unarchived_alerts" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myUnarchivedAlertsWithId:appId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_unarchived_alerts" from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method processAllError:
 @abstract Fetches objects matching query scope "process_all" from remote server.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processAllError:(NSError **)error;

/*!
 @method processAllWithContext:error:
 @abstract Fetches objects matching query scope "process_all" from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processAllWithContext:(id)context error:(NSError **)error;

/*!
 @method processAllWithOffset:limit:error:
 @abstract Fetches objects matching query scope "process_all" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processAllWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method processAllWithOffset:limit:context:error:
 @abstract Fetches objects matching query scope "process_all" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processAllWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method setReadError:
 @abstract Fetches objects matching query scope "set_read" from remote server.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)setReadError:(NSError **)error;

/*!
 @method setReadWithContext:error:
 @abstract Fetches objects matching query scope "set_read" from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)setReadWithContext:(id)context error:(NSError **)error;

/*!
 @method setReadWithOffset:limit:error:
 @abstract Fetches objects matching query scope "set_read" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)setReadWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method setReadWithOffset:limit:context:error:
 @abstract Fetches objects matching query scope "set_read" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)setReadWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method processOneError:
 @abstract Fetches objects matching query scope "process_one" from remote server.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processOneError:(NSError **)error;

/*!
 @method processOneWithContext:error:
 @abstract Fetches objects matching query scope "process_one" from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processOneWithContext:(id)context error:(NSError **)error;

/*!
 @method processOneWithOffset:limit:error:
 @abstract Fetches objects matching query scope "process_one" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processOneWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method processOneWithOffset:limit:context:error:
 @abstract Fetches objects matching query scope "process_one" from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)processOneWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

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
 @method myUnarchivedAlertsWithId:appId:async:
 @abstract Returns cached objects matching query scope "my_unarchived_alerts", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedAlertsWithId:appId:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_alerts", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedAlertsWithId:appId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_unarchived_alerts", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myUnarchivedAlertsWithId:appId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_unarchived_alerts", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myUnarchivedAlertsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method processAllAsync:
 @abstract Returns cached objects matching query scope "process_all", then fetches fresh ones from remote server.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processAllAsync:(APObjectsCallback)callback;

/*!
 @method processAllWithContext:async:
 @abstract Returns cached objects matching query scope "process_all", then fetches fresh ones from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processAllWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method processAllWithOffset:limit:async:
 @abstract Returns cached objects matching query scope "process_all", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processAllWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method processAllWithOffset:limit:context:async:
 @abstract Returns cached objects matching query scope "process_all", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processAllWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method setReadAsync:
 @abstract Returns cached objects matching query scope "set_read", then fetches fresh ones from remote server.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)setReadAsync:(APObjectsCallback)callback;

/*!
 @method setReadWithContext:async:
 @abstract Returns cached objects matching query scope "set_read", then fetches fresh ones from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)setReadWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method setReadWithOffset:limit:async:
 @abstract Returns cached objects matching query scope "set_read", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)setReadWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method setReadWithOffset:limit:context:async:
 @abstract Returns cached objects matching query scope "set_read", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)setReadWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method processOneAsync:
 @abstract Returns cached objects matching query scope "process_one", then fetches fresh ones from remote server.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processOneAsync:(APObjectsCallback)callback;

/*!
 @method processOneWithContext:async:
 @abstract Returns cached objects matching query scope "process_one", then fetches fresh ones from remote server.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processOneWithContext:(id)context async:(APObjectsCallback)callback;

/*!
 @method processOneWithOffset:limit:async:
 @abstract Returns cached objects matching query scope "process_one", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processOneWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method processOneWithOffset:limit:context:async:
 @abstract Returns cached objects matching query scope "process_one", then fetches fresh ones from remote server, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)processOneWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

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
