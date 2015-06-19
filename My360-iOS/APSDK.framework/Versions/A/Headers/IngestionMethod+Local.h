//
//  IngestionMethod+Local.h
//  AnyPresence SDK
//

/*!
 @header IngestionMethod+Local
 @abstract Local category for IngestionMethod class
 */

#import "IngestionMethod.h"

/*!
 @category IngestionMethod (Local)
 @abstract Adds local query capabilities to IngestionMethod.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface IngestionMethod (Local)

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
 @method activeIngestionMethodsLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "active_ingestion_methods" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)activeIngestionMethodsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end