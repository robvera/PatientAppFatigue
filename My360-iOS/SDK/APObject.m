//
//  APObject.m
//  AnyPresence SDK
//

#import "APDataManager.h"
#import "APInternalObject.h"
#import "APObject.h"
#import "APObject+Internal.h"
#import "APObject+Reflection.h"
#import "APObject+RemoteConfig.h"
#import "APObject+RemoteID.h"
#import "APObjectRemoteConfig.h"
#import "APManagedDataObject+Protected.h"
#import "NSObject+Reflection.h"
#import "AnyPresenceAPI.h"

@interface APObject ()

@end

@implementation APObject

const NSString * kAPObjectInternalClassSuffix = @"$AP$";

#pragma mark - Data Source

+ (Class)dataSource {
    return [AnyPresenceAPI class];
}

#pragma mark - Internal

void ThreadSafe(void(^block)()) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            block();
        });
    }
}

id ThreadSafeReturn(id(^block)()) {
    if ([NSThread isMainThread]) {
        return block();
    } else {
        __block id result;
        dispatch_sync(dispatch_get_main_queue(), ^{
            result = block();
        });
        return result;
    }
}

+ (Class)internalClass {
    return NSClassFromString([NSString stringWithFormat:@"%@%@", self.class, kAPObjectInternalClassSuffix]);
}

+ (Class)publicClassForInteralClass:(Class)class {
    NSString * name = NSStringFromClass(class);
    return (name.length > kAPObjectInternalClassSuffix.length ?
            NSClassFromString([name substringToIndex:name.length - kAPObjectInternalClassSuffix.length]) : nil);
}

+ (NSArray *)objectsWithInternals:(NSArray *)internals {
    NSMutableArray * array = [[NSMutableArray alloc] initWithCapacity:internals.count];
    for (APInternalObject * internal in internals) {
        APObject * object = [[[APObject publicClassForInteralClass:internal.class] alloc] initWithInternal:internal];
        [array addObject:object];
    }
    
    return [array copy];
}

+ (NSArray *)internalsForObjects:(NSArray *)objects {
    NSMutableArray * array = [[NSMutableArray alloc] initWithCapacity:objects.count];
    for (APObject * object in objects) {
        [array addObject:object.internal];
    }
    
    return [array copy];
}

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super init])) {
        ThreadSafe(^{
            self.internal = internal ?: [self.class.internalClass new];
            [self.internal saveWithContext:NO];
        });
    }
    return self;
}

#pragma - RemoteID

- (id)initWithRemoteID:(id)remoteID {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"%K == %@",
                               [self class].remoteConfig.remoteIDProperty,
                               remoteID];
    
    id cached = ThreadSafeReturn(^id{
        return [[[[self class] internalClass] fetchWithPredicate:predicate] lastObject];
    });
    
    if ((self = [self initWithInternal:cached])) {
        if (remoteID) {
            ThreadSafe(^{
                [self.internal setValue:remoteID forKey:[self.class remoteConfig].remoteIDProperty];
                [self.internal saveWithContext:NO];
            });
        }
    }
    return self;
}

- (id)remoteID {
    NSString * prop = [[self class] remoteConfig].remoteIDProperty;
    id value = [self valueForKey:prop];
    value = [self encodeValue:value ofType:[NSString class]];
    
    return !value || [value isKindOfClass:[NSString class]] ? value : [NSString stringWithFormat:@"%@", value];
}

- (void)setRemoteID:(id)remoteID {
    NSString * prop = [[self class] remoteConfig].remoteIDProperty;
    id value = [self decodeValue:remoteID ofType:[NSString class]];
    
    [self setValue:value forKey:prop];
}

#pragma mark - NSObject

- (id)init {
    if ((self = [self initWithInternal:nil])) {
    }
    return self;
}

@end
