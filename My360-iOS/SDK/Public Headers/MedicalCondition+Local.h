//
//  MedicalCondition+Local.h
//  AnyPresence SDK
//

/*!
 @header MedicalCondition+Local
 @abstract Local category for MedicalCondition class
 */

#import "MedicalCondition.h"

/*!
 @category MedicalCondition (Local)
 @abstract Adds local query capabilities to MedicalCondition.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface MedicalCondition (Local)

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
 @method activeMedicalConditionLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "active_medical_condition" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)activeMedicalConditionLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end