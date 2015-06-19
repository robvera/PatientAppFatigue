//
//  PatientAdherenceLog.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientAdherenceLog.h"
#import "PatientAdherenceLog$AP$.h"
#import "MissingTreatmentReason.h"
#import "Patient.h"
#import "PatientTreatment.h"
#import "AnyPresenceAPI.h"

@interface PatientAdherenceLog ()

@property (nonatomic, strong) PatientAdherenceLog$AP$ * internal;

@end

@implementation PatientAdherenceLog

@synthesize missingTreatmentReason = _missingTreatmentReason;

@synthesize patient = _patient;

@synthesize patientTreatment = _patientTreatment;

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

- (NSDate *)logOn {
    return ThreadSafeReturn(^id{
        return self.internal.logOn;
    });
}

- (void)setLogOn:(NSDate *)logOn {
    ThreadSafe(^{
        self.internal.logOn = logOn;
    });
}

- (NSString *)medicationDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.medicationDenormalized;
    });
}

- (void)setMedicationDenormalized:(NSString *)medicationDenormalized {
    ThreadSafe(^{
        self.internal.medicationDenormalized = medicationDenormalized;
    });
}

- (NSString *)missingTreatmentReasonDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.missingTreatmentReasonDenormalized;
    });
}

- (void)setMissingTreatmentReasonDenormalized:(NSString *)missingTreatmentReasonDenormalized {
    ThreadSafe(^{
        self.internal.missingTreatmentReasonDenormalized = missingTreatmentReasonDenormalized;
    });
}

- (NSNumber *)missingTreatmentReasonId {
    return ThreadSafeReturn(^id{
        return self.internal.missingTreatmentReasonId;
    });
}

- (void)setMissingTreatmentReasonId:(NSNumber *)missingTreatmentReasonId {
    ThreadSafe(^{
        self.internal.missingTreatmentReasonId = missingTreatmentReasonId;
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

- (NSNumber *)patientTreatmentId {
    return ThreadSafeReturn(^id{
        return self.internal.patientTreatmentId;
    });
}

- (void)setPatientTreatmentId:(NSNumber *)patientTreatmentId {
    ThreadSafe(^{
        self.internal.patientTreatmentId = patientTreatmentId;
    });
}

- (NSNumber *)timesMissedPerDay {
    return ThreadSafeReturn(^id{
        return self.internal.timesMissedPerDay;
    });
}

- (void)setTimesMissedPerDay:(NSNumber *)timesMissedPerDay {
    ThreadSafe(^{
        self.internal.timesMissedPerDay = timesMissedPerDay;
    });
}

- (NSNumber *)tookMedication {
    return ThreadSafeReturn(^id{
        return self.internal.tookMedication;
    });
}

- (void)setTookMedication:(NSNumber *)tookMedication {
    ThreadSafe(^{
        self.internal.tookMedication = tookMedication;
    });
}

- (NSNumber *)treatmentScheduleDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentScheduleDenormalized;
    });
}

- (void)setTreatmentScheduleDenormalized:(NSNumber *)treatmentScheduleDenormalized {
    ThreadSafe(^{
        self.internal.treatmentScheduleDenormalized = treatmentScheduleDenormalized;
    });
}

- (NSString *)treatmentTypeDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentTypeDenormalized;
    });
}

- (void)setTreatmentTypeDenormalized:(NSString *)treatmentTypeDenormalized {
    ThreadSafe(^{
        self.internal.treatmentTypeDenormalized = treatmentTypeDenormalized;
    });
}

- (MissingTreatmentReason *)missingTreatmentReason {
    if (!_missingTreatmentReason && self.internal.missingTreatmentReason) {
        _missingTreatmentReason = [[MissingTreatmentReason alloc] initWithInternal:(APInternalObject *)self.internal.missingTreatmentReason];
    }
    
    return _missingTreatmentReason;
}

- (void)setMissingTreatmentReason:(MissingTreatmentReason *)missingTreatmentReason {
    if (_missingTreatmentReason != missingTreatmentReason) {
        _missingTreatmentReason = missingTreatmentReason;
        
        ThreadSafe(^{
            self.internal.missingTreatmentReason = (id)missingTreatmentReason.internal;
        });
    }
}

- (Patient *)patient {
    if (!_patient && self.internal.patient) {
        _patient = [[Patient alloc] initWithInternal:(APInternalObject *)self.internal.patient];
    }
    
    return _patient;
}

- (void)setPatient:(Patient *)patient {
    if (_patient != patient) {
        _patient = patient;
        
        ThreadSafe(^{
            self.internal.patient = (id)patient.internal;
        });
    }
}

- (PatientTreatment *)patientTreatment {
    if (!_patientTreatment && self.internal.patientTreatment) {
        _patientTreatment = [[PatientTreatment alloc] initWithInternal:(APInternalObject *)self.internal.patientTreatment];
    }
    
    return _patientTreatment;
}

- (void)setPatientTreatment:(PatientTreatment *)patientTreatment {
    if (_patientTreatment != patientTreatment) {
        _patientTreatment = patientTreatment;
        
        ThreadSafe(^{
            self.internal.patientTreatment = (id)patientTreatment.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.missingTreatmentReason" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patient" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientTreatment" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.missingTreatmentReason"];
    [self removeObserver:self forKeyPath:@"internal.patient"];
    [self removeObserver:self forKeyPath:@"internal.patientTreatment"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.missingTreatmentReason"]) {
        _missingTreatmentReason = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patient"]) {
        _patient = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientTreatment"]) {
        _patientTreatment = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
