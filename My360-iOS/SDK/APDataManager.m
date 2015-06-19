//
//  APDataManager.m
//  AnyPresence SDK
//

#import "APDataManager.h"
#import "APDataManager+Protected.h"
#import "APKeyedArchiverTransformer.h"

NSString * const kAPDataManagerDataDidChangeNotification = @"kAPDataManagerDataDidChangeNotification";
NSString * const kDefaultBundleName = @"APResources";

@interface APDataManager ()

@property (nonatomic, strong) NSManagedObjectModel * objectModel;
@property (nonatomic, assign) APDataManagerStore store;

- (void)addStore:(NSPersistentStoreCoordinator *)coordinator ofType:(APDataManagerStore)store;
- (void)objectsDidChange:(NSNotification *)notification;

@end

@implementation APDataManager

static APDataManager * __dataManager = nil;

#pragma mark - Public

+ (void)setDataManager:(APDataManager *)dataManager {
    @synchronized(self) {
        __dataManager = dataManager;
    }
}

+ (APDataManager *)dataManager {
    return __dataManager;
}

- (id)initWithStore:(APDataManagerStore)store {
    if ((self = [super init])) {
        self.store = store;
    }
    
    return self;
}

- (NSManagedObjectModel *)objectModel {
    if (!_objectModel) {
        NSString * path = [[NSBundle mainBundle] pathForResource:kDefaultBundleName ofType:@"bundle"];
        NSURL * url = [[NSBundle bundleWithPath:path] URLForResource:@"Model" withExtension:@"momd"];
        NSManagedObjectModel * mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
        
        _objectModel = mom;
    }
    
    return _objectModel;
}

- (NSManagedObjectContext *)objectContext {
    if (!_objectContext) {
        _objectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        NSPersistentStoreCoordinator * coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.objectModel];
        [self addStore:coordinator ofType:self.store];
        _objectContext.persistentStoreCoordinator = coordinator;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(objectsDidChange:) name:NSManagedObjectContextObjectsDidChangeNotification object:_objectContext];
    }
    
    return _objectContext;
}

#pragma mark - Private

- (void)addStore:(NSPersistentStoreCoordinator *)coordinator ofType:(APDataManagerStore)store {
    switch (store) {
        case kAPDataManagerStoreInMemory: {
#ifdef __VERBOSE
            NSError * error = nil;
#endif
            [coordinator addPersistentStoreWithType:NSInMemoryStoreType
                                      configuration:nil
                                                URL:nil
                                            options:@{ NSInferMappingModelAutomaticallyOption: @(YES) }
#ifdef __VERBOSE
                                              error:&error];
            if (error)
                break;
#else
        error:nil];
#endif
            
        }   break;
            
        case kAPDataManagerStorePersistent: {
            NSURL * url = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]
                           URLByAppendingPathComponent:@"APSDK.sqlite"];
#ifdef __VERBOSE
            NSLog(@"%@", url);
#endif
            
            for (int i = 0; i < 2; i++) {
                NSError * error = nil;
                if ([coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                              configuration:nil
                                                        URL:url
                                                    options:@{ NSInferMappingModelAutomaticallyOption: @(YES) }
                                                      error:&error])
                    break;
                else {
#ifdef __VERBOSE
                    NSLog(@"%@", error);
#endif
                    
                    error = nil;
                    [[NSFileManager defaultManager] removeItemAtURL:url error:&error];
                    if (error) {
#ifdef __VERBOSE
                        NSLog(@"%@", error);
#endif
                        break;
                    }
                }
            }
        }   break;
            
        default:
            break;
    }
}

- (void)objectsDidChange:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] postNotificationName:kAPDataManagerDataDidChangeNotification object:self];
}

#pragma mark NSObject

- (id)init {
    if ((self = [super init])) {
        
    }
    
    return self;
}

- (void)dealloc {
    if (_objectContext) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextObjectsDidChangeNotification object:_objectContext];
    }
}

#pragma mark Obj-C

+ (void)initialize {
    [NSValueTransformer setValueTransformer:[APKeyedArchiverTransformer new]
                                    forName:NSStringFromClass([APKeyedArchiverTransformer class])];
}

@end
