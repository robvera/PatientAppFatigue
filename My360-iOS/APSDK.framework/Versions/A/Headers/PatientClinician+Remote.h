//
//  PatientClinician+Remote.h
//  AnyPresence SDK
//

/*!
 @header PatientClinician+Remote
 @abstract Remote category for PatientClinician class
 */

#import "PatientClinician.h"

/*!
 @category PatientClinician (Remote)
 @abstract Adds remote CRUD capabilities to PatientClinician.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Remote) @/link methods.
 */ 
@interface PatientClinician (Remote)

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
 @method myCliniciansWithId:error:
 @abstract Fetches objects matching query scope "my_clinicians" from remote server.
 @param id Scope parameter - id.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id error:(NSError **)error;

/*!
 @method myCliniciansWithId:context:error:
 @abstract Fetches objects matching query scope "my_clinicians" from remote server.
 @param id Scope parameter - id.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id context:(id)context error:(NSError **)error;

/*!
 @method myCliniciansWithId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_clinicians" from remote server, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myCliniciansWithId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_clinicians" from remote server, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

/*!
 @method myPatientsWithClinicianId:error:
 @abstract Fetches objects matching query scope "my_patients" from remote server.
 @param clinicianId Scope parameter - clinicianId.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId error:(NSError **)error;

/*!
 @method myPatientsWithClinicianId:context:error:
 @abstract Fetches objects matching query scope "my_patients" from remote server.
 @param clinicianId Scope parameter - clinicianId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId context:(id)context error:(NSError **)error;

/*!
 @method myPatientsWithClinicianId:offset:limit:error:
 @abstract Fetches objects matching query scope "my_patients" from remote server, with pagination.
 @param clinicianId Scope parameter - clinicianId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error;

/*!
 @method myPatientsWithClinicianId:offset:limit:context:error:
 @abstract Fetches objects matching query scope "my_patients" from remote server, with pagination.
 @param clinicianId Scope parameter - clinicianId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param error Error that has occured while executing the request, if any.
 @result Array of objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error;

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
 @method myCliniciansWithId:async:
 @abstract Returns cached objects matching query scope "my_clinicians", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id async:(APObjectsCallback)callback;

/*!
 @method myCliniciansWithId:context:async:
 @abstract Returns cached objects matching query scope "my_clinicians", then fetches fresh ones from remote server.
 @param id Scope parameter - id.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myCliniciansWithId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_clinicians", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myCliniciansWithId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_clinicians", then fetches fresh ones from remote server, with pagination.
 @param id Scope parameter - id.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myPatientsWithClinicianId:async:
 @abstract Returns cached objects matching query scope "my_patients", then fetches fresh ones from remote server.
 @param clinicianId Scope parameter - clinicianId.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId async:(APObjectsCallback)callback;

/*!
 @method myPatientsWithClinicianId:context:async:
 @abstract Returns cached objects matching query scope "my_patients", then fetches fresh ones from remote server.
 @param clinicianId Scope parameter - clinicianId.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId context:(id)context async:(APObjectsCallback)callback;

/*!
 @method myPatientsWithClinicianId:offset:limit:async:
 @abstract Returns cached objects matching query scope "my_patients", then fetches fresh ones from remote server, with pagination.
 @param clinicianId Scope parameter - clinicianId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback;

/*!
 @method myPatientsWithClinicianId:offset:limit:context:async:
 @abstract Returns cached objects matching query scope "my_patients", then fetches fresh ones from remote server, with pagination.
 @param clinicianId Scope parameter - clinicianId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @param context Object instance or NSDictionary of ‘string’ to ‘object instance’ mapping for use with interpolation of headers, request URL, or previously defined variable at SDK creation.  For more details on the use of contexts, see the discussion section in @link //apple_ref/occ/cat/APObject(Remote) @/link.
 @param callback Callback to be executed when operation completes.
 @result Array of cached objects.
 */
+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback;

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
