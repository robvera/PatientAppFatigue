//
//  PatientTreatment+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientTreatment+Local
 @abstract Local category for PatientTreatment class
 */

#import "PatientTreatment.h"

/*!
 @category PatientTreatment (Local)
 @abstract Adds local query capabilities to PatientTreatment.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientTreatment (Local)

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
 @method unarchivedPatientTreatmentsLocalWithPatientId:appId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_patient_treatments" from local cache, with pagination.
 @param patientId Scope parameter - patientId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedPatientTreatmentsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myUnarchivedTreatmentsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_treatments" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedTreatmentsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myUnarchivedMedicationsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_unarchived_medications" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myUnarchivedMedicationsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method adherenceTreatmentsLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "adherence_treatments" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)adherenceTreatmentsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myTreatmentsLocalWithId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_treatments" from local cache, with pagination.
 @param id Scope parameter - id.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myTreatmentsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method myMedicationsLocalWithId:medicationId:appId:offset:limit:
 @abstract Fetches objects matching query scope "my_medications" from local cache, with pagination.
 @param id Scope parameter - id.
 @param medicationId Scope parameter - medicationId.
 @param appId Scope parameter - appId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)myMedicationsLocalWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end