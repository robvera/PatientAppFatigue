//
//  PatientEducation+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientEducation+Local
 @abstract Local category for PatientEducation class
 */

#import "PatientEducation.h"

/*!
 @category PatientEducation (Local)
 @abstract Adds local query capabilities to PatientEducation.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientEducation (Local)

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
 @method myUnarchivedEducationsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_educations" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedEducationsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method unarchivedPatientEducationsLocalWithPatientId:appId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_educations" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientEducationsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method setReadLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "set_read" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)setReadLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method setOneReadLocalWithPatientEducationId:offset:limit:
 @abstract Fetches objects matching query scope "set_one_read" from local cache, with pagination.
 @param patientEducationId Scope parameter - patientEducationId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)setOneReadLocalWithPatientEducationId:(NSNumber *)patientEducationId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end