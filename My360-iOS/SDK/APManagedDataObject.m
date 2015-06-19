//
//  APManagedDataObject.m
//  AnyPresence SDK
//

#import "APManagedDataObject.h"
#import "APManagedDataObject+Protected.h"
#import "APDataManager.h"
#import "APDataManager+Protected.h"

@interface APManagedDataObject ()

+ (NSManagedObjectContext *)dataContext;
+ (NSString *)entityName;

@end

@implementation APManagedDataObject

#pragma mark - Protected

+ (NSEntityDescription *)entity {
    NSDictionary * entities = [[self dataContext].persistentStoreCoordinator.managedObjectModel entitiesByName];
    return [entities objectForKey:[self entityName]];
}

+ (Class)classFor:(NSEntityDescription *)entity {
    return NSClassFromString(entity.name);
}

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate {
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    if (predicate)
        request.predicate = predicate;
    
    NSError * error = nil;
    id results = [[[self class] dataContext] executeFetchRequest:request error:&error];
#ifdef __VERBOSE
    if (error)
        NSLog(@"Error fetching %@ for %@: %@", predicate, self, error);
#endif
    
    return results;
}

+ (NSArray *)fetchAll {
    return [self fetchWithPredicate:nil];
}

+ (void)saveContext {
    NSError * error = nil;
    [[[self class] dataContext] save:&error];
#ifdef __VERBOSE
    if (error)
        NSLog(@"Error saving context: %@", error);
#endif
}

- (void)save {
    [self saveWithContext:true];
}

- (void)saveWithContext:(BOOL)saveContext {
    if (!self.managedObjectContext) {
        [[[self class] dataContext] insertObject:self];
    }
    
    if (saveContext) {
        [[self class] saveContext];
    }
}

- (void)deleteWithContext:(BOOL)saveContext {
    [[[self class] dataContext] deleteObject:self];
    
    if (saveContext){
        NSError * error = nil;
        [[[self class] dataContext] save:&error];
#ifdef __VERBOSE
        if (error)
            NSLog(@"Error deleting object %@: %@", self, error);
#endif
    }
}

#pragma mark - Private

+ (NSManagedObjectContext *)dataContext {
    return [APDataManager dataManager].objectContext;
}

+ (NSString *)entityName {
    return NSStringFromClass([self class]);
}

#pragma mark - NSObject

- (id)init {
    self = [super initWithEntity:[[self class] entity] insertIntoManagedObjectContext:[[self class] dataContext]];
    return self;
}

#pragma mark - Obj-C

+ (void)initialize {
    if (![APDataManager dataManager]) {
        [APDataManager setDataManager:[[APDataManager alloc] initWithStore:kAPDataManagerStorePersistent]];
    }
}

@end
