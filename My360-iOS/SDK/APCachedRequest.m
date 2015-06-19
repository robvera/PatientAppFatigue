//
//  APCachedRequest.m
//  AnyPresence SDK
//

#import "APObject.h"
#import "APManagedDataObject+Protected.h"
#import "APCachedRequest.h"

@interface APCachedRequest ()

@property (nonatomic, retain, readwrite) NSString * resource;
@property (nonatomic, retain, readwrite) NSString * scope;
@property (nonatomic, retain, readwrite) NSDictionary * parameters;

@end

@interface APCachedRequest (CoreDataGeneratedAccessors)

- (void)insertObject:(APObject *)value inObjectsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromObjectsAtIndex:(NSUInteger)idx;
- (void)insertObjects:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInObjectsAtIndex:(NSUInteger)idx withObject:(APObject *)value;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)values;
- (void)addObjectsObject:(APObject *)value;
- (void)removeObjectsObject:(APObject *)value;
- (void)addObjects:(NSOrderedSet *)values;
- (void)removeObjects:(NSOrderedSet *)values;

@end

@implementation APCachedRequest

@dynamic resource;
@dynamic scope;
@dynamic parameters;
@dynamic objects;

#pragma mark - Public

+ (APCachedRequest *)requestWithResource:(NSString *)resource scope:(NSString *)scope params:(NSDictionary *)parameters {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"resource == %@ AND scope == %@", resource, scope];
    for (APCachedRequest * request in [self fetchWithPredicate:predicate]) {

        // TODO: Expressions.
        if ([request.parameters isEqualToDictionary:parameters])
            return request;
    }

    APCachedRequest * request = [APCachedRequest new];
    request.resource = resource;
    request.scope = scope;
    request.parameters = parameters;
    [request save];

    return request;
}

@end
