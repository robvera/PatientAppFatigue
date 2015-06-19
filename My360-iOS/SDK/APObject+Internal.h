//
//  APObject+Internal.h
//  AnyPresence SDK
//

#import "APObject.h"
#import "APObject+Remote.h"
#import "APEndPointConfiguration.h"

@class APInternalObject;

@interface APObject (Internal)

@property (nonatomic, strong) APInternalObject * internal;

void ThreadSafe(void(^block)());
id ThreadSafeReturn(id(^block)());

+ (Class)dataSource;
+ (Class)internalClass;
+ (Class)publicClassForInteralClass:(Class)class;
+ (NSArray *)objectsWithInternals:(NSArray *)objects;
+ (NSArray *)internalsForObjects:(NSArray *)objects;
- (id)initWithInternal:(APInternalObject *)internal;
+ (NSString *)contentType:(enum APSerializationFormat)contentFormat;

#pragma mark - APObject+Remote (Protected Methods)

- (BOOL)createWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error;
- (BOOL)updateWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error;
- (BOOL)destroyWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error;
- (BOOL)refreshWithContext:(id)context config:(APEndPointConfiguration *)config error:(NSError **)error;
- (void)createAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback;
- (void)updateAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback;
- (void)destroyAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback;
- (void)refreshAsyncWithContext:(id)context config:(APEndPointConfiguration *)config async:(APObjectCallback)callback;

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
           context:(id)context
            config:(APEndPointConfiguration *)config
             error:(NSError **)error;

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
           context:(id)context
            config:(APEndPointConfiguration *)config
             error:(NSError **)error;

+ (NSNumber *)aggregateQuery:(NSString *)scope
                      params:(NSDictionary *)params
                     context:(id)context
                      config:(APEndPointConfiguration *)config
                       error:(NSError **)error;

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
           context:(id)context
            config:(APEndPointConfiguration *)config
             async:(APObjectsCallback)callback;

+ (NSArray *)query:(NSString *)scope
            params:(NSDictionary *)params
            offset:(NSUInteger)offset
             limit:(NSUInteger)limit
           context:(id)context
            config:(APEndPointConfiguration *)config
             async:(APObjectsCallback)callback;

+ (void)aggregateQuery:(NSString *)scope
                params:(NSDictionary *)params
               context:(id)context
                config:(APEndPointConfiguration *)config
                 async:(APObjectCallback)callback;

@end
