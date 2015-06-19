//
//  APDataManager+Protected.h
//  AnyPresence SDK
//

#import "APDataManager.h"

@interface APDataManager (Protected)

@property (nonatomic, strong) NSManagedObjectContext * objectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel * objectModel;

+ (APDataManager *)dataManager;

@end
