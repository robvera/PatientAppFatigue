//
//  PatientSideEffectMedication.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientSideEffectMedication.h"
#import "PatientSideEffectMedication$AP$.h"
#import "Medication.h"
#import "PatientSideEffect.h"
#import "AnyPresenceAPI.h"

@interface PatientSideEffectMedication ()

@property (nonatomic, strong) PatientSideEffectMedication$AP$ * internal;

@end

@implementation PatientSideEffectMedication

@synthesize medication = _medication;

@synthesize patientSideEffect = _patientSideEffect;

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

- (NSNumber *)medicationId {
    return ThreadSafeReturn(^id{
        return self.internal.medicationId;
    });
}

- (void)setMedicationId:(NSNumber *)medicationId {
    ThreadSafe(^{
        self.internal.medicationId = medicationId;
    });
}

- (NSNumber *)patientSideEffectId {
    return ThreadSafeReturn(^id{
        return self.internal.patientSideEffectId;
    });
}

- (void)setPatientSideEffectId:(NSNumber *)patientSideEffectId {
    ThreadSafe(^{
        self.internal.patientSideEffectId = patientSideEffectId;
    });
}

- (Medication *)medication {
    if (!_medication && self.internal.medication) {
        _medication = [[Medication alloc] initWithInternal:(APInternalObject *)self.internal.medication];
    }
    
    return _medication;
}

- (void)setMedication:(Medication *)medication {
    if (_medication != medication) {
        _medication = medication;
        
        ThreadSafe(^{
            self.internal.medication = (id)medication.internal;
        });
    }
}

- (PatientSideEffect *)patientSideEffect {
    if (!_patientSideEffect && self.internal.patientSideEffect) {
        _patientSideEffect = [[PatientSideEffect alloc] initWithInternal:(APInternalObject *)self.internal.patientSideEffect];
    }
    
    return _patientSideEffect;
}

- (void)setPatientSideEffect:(PatientSideEffect *)patientSideEffect {
    if (_patientSideEffect != patientSideEffect) {
        _patientSideEffect = patientSideEffect;
        
        ThreadSafe(^{
            self.internal.patientSideEffect = (id)patientSideEffect.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.medication" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientSideEffect" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.medication"];
    [self removeObserver:self forKeyPath:@"internal.patientSideEffect"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.medication"]) {
        _medication = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientSideEffect"]) {
        _patientSideEffect = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
