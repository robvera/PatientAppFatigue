//
//  PatientSideEffectMedication+Local.h
//  AnyPresence SDK
//

/*!
 @header PatientSideEffectMedication+Local
 @abstract Local category for PatientSideEffectMedication class
 */

#import "PatientSideEffectMedication.h"

/*!
 @category PatientSideEffectMedication (Local)
 @abstract Adds local query capabilities to PatientSideEffectMedication.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface PatientSideEffectMedication (Local)

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
 @method unarchivedSideeffectMedsLocalWithPatientSideEffectId:offset:limit:
 @abstract Fetches objects matching query scope "unarchived_sideeffect_meds" from local cache, with pagination.
 @param patientSideEffectId Scope parameter - patientSideEffectId.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)unarchivedSideeffectMedsLocalWithPatientSideEffectId:(NSNumber *)patientSideEffectId offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end