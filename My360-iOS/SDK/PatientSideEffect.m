//
//  PatientSideEffect.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientSideEffect.h"
#import "PatientSideEffect$AP$.h"
#import "PatientSideEffectMedication.h"
#import "SideEffect.h"
#import "AnyPresenceAPI.h"

@interface PatientSideEffect ()

@property (nonatomic, strong) PatientSideEffect$AP$ * internal;

@end

@implementation PatientSideEffect

@synthesize patientSideEffectMedications = _patientSideEffectMedications;

@synthesize sideEffect = _sideEffect;

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

- (NSNumber *)archived {
    return ThreadSafeReturn(^id{
        return self.internal.archived;
    });
}

- (void)setArchived:(NSNumber *)archived {
    ThreadSafe(^{
        self.internal.archived = archived;
    });
}

- (NSString *)medicationIds {
    return ThreadSafeReturn(^id{
        return self.internal.medicationIds;
    });
}

- (void)setMedicationIds:(NSString *)medicationIds {
    ThreadSafe(^{
        self.internal.medicationIds = medicationIds;
    });
}

- (NSString *)medicationUnsure {
    return ThreadSafeReturn(^id{
        return self.internal.medicationUnsure;
    });
}

- (void)setMedicationUnsure:(NSString *)medicationUnsure {
    ThreadSafe(^{
        self.internal.medicationUnsure = medicationUnsure;
    });
}

- (NSNumber *)patientId {
    return ThreadSafeReturn(^id{
        return self.internal.patientId;
    });
}

- (void)setPatientId:(NSNumber *)patientId {
    ThreadSafe(^{
        self.internal.patientId = patientId;
    });
}

- (NSString *)sideEffectDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.sideEffectDenormalized;
    });
}

- (void)setSideEffectDenormalized:(NSString *)sideEffectDenormalized {
    ThreadSafe(^{
        self.internal.sideEffectDenormalized = sideEffectDenormalized;
    });
}

- (NSNumber *)sideEffectId {
    return ThreadSafeReturn(^id{
        return self.internal.sideEffectId;
    });
}

- (void)setSideEffectId:(NSNumber *)sideEffectId {
    ThreadSafe(^{
        self.internal.sideEffectId = sideEffectId;
    });
}

- (NSDate *)sideEffectOn {
    return ThreadSafeReturn(^id{
        return self.internal.sideEffectOn;
    });
}

- (void)setSideEffectOn:(NSDate *)sideEffectOn {
    ThreadSafe(^{
        self.internal.sideEffectOn = sideEffectOn;
    });
}

- (NSOrderedSet *)patientSideEffectMedications {
    if (!_patientSideEffectMedications) {
        _patientSideEffectMedications = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientSideEffectMedications.count];
            for (APInternalObject * internal in self.internal.patientSideEffectMedications) {
                PatientSideEffectMedication * obj = [[PatientSideEffectMedication alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientSideEffectMedications;
}

- (void)setPatientSideEffectMedications:(NSOrderedSet *)patientSideEffectMedications {
    if (_patientSideEffectMedications != patientSideEffectMedications) {
        _patientSideEffectMedications = patientSideEffectMedications;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientSideEffectMedications.count];
        for (PatientSideEffectMedication * obj in patientSideEffectMedications) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientSideEffectMedications = [set copy];
        });
    }
}

- (SideEffect *)sideEffect {
    if (!_sideEffect && self.internal.sideEffect) {
        _sideEffect = [[SideEffect alloc] initWithInternal:(APInternalObject *)self.internal.sideEffect];
    }
    
    return _sideEffect;
}

- (void)setSideEffect:(SideEffect *)sideEffect {
    if (_sideEffect != sideEffect) {
        _sideEffect = sideEffect;
        
        ThreadSafe(^{
            self.internal.sideEffect = (id)sideEffect.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientSideEffectMedications" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.sideEffect" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientSideEffectMedications"];
    [self removeObserver:self forKeyPath:@"internal.sideEffect"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientSideEffectMedications"]) {
        _patientSideEffectMedications = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.sideEffect"]) {
        _sideEffect = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
