//
//  DosageUom+Local.h
//  AnyPresence SDK
//

/*!
 @header DosageUom+Local
 @abstract Local category for DosageUom class
 */

#import "DosageUom.h"

/*!
 @category DosageUom (Local)
 @abstract Adds local query capabilities to DosageUom.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface DosageUom (Local)

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
 @method activeDosageUomLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "active_dosage_uom" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)activeDosageUomLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end