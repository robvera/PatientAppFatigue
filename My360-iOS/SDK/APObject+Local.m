//
//  APObject+Local.m
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "APObject+Internal.h"
#import "APObject+Local.h"
#import "APCachedRequest.h"
#import "APManagedDataObject+Protected.h"
#import "APQuery.h"

@implementation APObject (Local)

#pragma mark - Public

+ (NSArray *)queryLocal:(NSString *)scope params:(NSDictionary *)params {
    return [self queryLocal:scope params:params offset:NSNotFound limit:NSNotFound];
}

+ (NSArray *)queryLocal:(NSString *)scope params:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * query = [[NSMutableDictionary alloc] initWithDictionary:[APQuery query:scope
                                                                                          params:params
                                                                                      dataSource:[self dataSource]]];
    if (offset != NSNotFound && limit != NSNotFound) {
        [query addEntriesFromDictionary:[APQuery pagination:offset limit:limit]];
    }
    
    return ThreadSafeReturn(^id{
        APCachedRequest * request = [APCachedRequest requestWithResource:[[self internalClass] entity].name scope:scope params:query];
        return [self objectsWithInternals:[request.objects array] ?: @[ ]];
    });
}

+ (void)deleteAllLocal {
    ThreadSafe(^{
        NSArray * objects = [[self internalClass] fetchAll];
        for (id object in objects) {
            [object deleteWithContext:false];
        }
        
        [[self internalClass] saveContext];
    });
}

+ (NSArray *)fetchLocalWithPredicate:(NSPredicate *)predicate {
    return ThreadSafeReturn(^id{
        return [self objectsWithInternals:[[self internalClass] fetchWithPredicate:predicate]];
    });
}

- (void)saveLocal {
    ThreadSafe(^{
        [self.internal save];
    });
}

- (void)deleteLocal {
    ThreadSafe(^{
        [self.internal deleteWithContext:true];
    });
}

@end
