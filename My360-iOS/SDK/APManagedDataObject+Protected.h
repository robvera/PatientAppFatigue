//
//  APManagedDataObject+Protected.h
//  AnyPresence SDK
//

#import "APManagedDataObject.h"

@interface APManagedDataObject (Protected)

+ (NSEntityDescription *)entity;
+ (Class)classFor:(NSEntityDescription *)entity;
+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate;
+ (NSArray *)fetchAll;
+ (void)saveContext;
- (void)save;
- (void)saveWithContext:(BOOL)saveContext;
- (void)deleteWithContext:(BOOL)saveContext;

@end
