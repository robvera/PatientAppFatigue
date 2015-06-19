//
//  ClinicianCodeRequest+Local.h
//  AnyPresence SDK
//

/*!
 @header ClinicianCodeRequest+Local
 @abstract Local category for ClinicianCodeRequest class
 */

#import "ClinicianCodeRequest.h"

/*!
 @category ClinicianCodeRequest (Local)
 @abstract Adds local query capabilities to ClinicianCodeRequest.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface ClinicianCodeRequest (Local)

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
 @method matchByPatientIdLocalWithPatientId:offset:limit:
 @abstract Fetches objects matching query scope "match_by_patient_id" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)matchByPatientIdLocalWithPatientId:(NSNumber *)patientId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end