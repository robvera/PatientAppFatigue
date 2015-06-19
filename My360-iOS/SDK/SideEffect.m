//
//  SideEffect.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "SideEffect.h"
#import "SideEffect$AP$.h"
#import "PatientSideEffect.h"
#import "AnyPresenceAPI.h"

@interface SideEffect ()

@property (nonatomic, strong) SideEffect$AP$ * internal;

@end

@implementation SideEffect

@synthesize patientSideEffects = _patientSideEffects;

#pragma mark - Data Source

+ (Class)dataSource {
    return [AnyPresenceAPI class];
}

#pragma mark - Public

- (NSNumber *)id {
    return ThreadSafeReturn(^id{
        return self.internal.id;
    });
}

- (void)setId:(NSNumber *)id {
    ThreadSafe(^{
        self.internal.id = id;
    });
}

- (NSNumber *)appId {
    return ThreadSafeReturn(^id{
        return self.internal.appId;
    });
}

- (void)setAppId:(NSNumber *)appId {
    ThreadSafe(^{
        self.internal.appId = appId;
    });
}

- (NSNumber *)inactive {
    return ThreadSafeReturn(^id{
        return self.internal.inactive;
    });
}

- (void)setInactive:(NSNumber *)inactive {
    ThreadSafe(^{
        self.internal.inactive = inactive;
    });
}

- (NSString *)name {
    return ThreadSafeReturn(^id{
        return self.internal.name;
    });
}

- (void)setName:(NSString *)name {
    ThreadSafe(^{
        self.internal.name = name;
    });
}

- (NSOrderedSet *)patientSideEffects {
    if (!_patientSideEffects) {
        _patientSideEffects = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientSideEffects.count];
            for (APInternalObject * internal in self.internal.patientSideEffects) {
                PatientSideEffect * obj = [[PatientSideEffect alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientSideEffects;
}

- (void)setPatientSideEffects:(NSOrderedSet *)patientSideEffects {
    if (_patientSideEffects != patientSideEffects) {
        _patientSideEffects = patientSideEffects;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientSideEffects.count];
        for (PatientSideEffect * obj in patientSideEffects) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientSideEffects = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientSideEffects" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientSideEffects"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientSideEffects"]) {
        _patientSideEffects = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
