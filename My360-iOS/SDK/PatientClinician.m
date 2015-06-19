//
//  PatientClinician.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientClinician.h"
#import "PatientClinician$AP$.h"
#import "Clinician.h"
#import "Patient.h"
#import "AnyPresenceAPI.h"

@interface PatientClinician ()

@property (nonatomic, strong) PatientClinician$AP$ * internal;

@end

@implementation PatientClinician

@synthesize clinician = _clinician;

@synthesize patient = _patient;

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

- (NSNumber *)approved {
    return ThreadSafeReturn(^id{
        return self.internal.approved;
    });
}

- (void)setApproved:(NSNumber *)approved {
    ThreadSafe(^{
        self.internal.approved = approved;
    });
}

- (NSDate *)approvedAt {
    return ThreadSafeReturn(^id{
        return self.internal.approvedAt;
    });
}

- (void)setApprovedAt:(NSDate *)approvedAt {
    ThreadSafe(^{
        self.internal.approvedAt = approvedAt;
    });
}

- (NSNumber *)canClinicianRead {
    return ThreadSafeReturn(^id{
        return self.internal.canClinicianRead;
    });
}

- (void)setCanClinicianRead:(NSNumber *)canClinicianRead {
    ThreadSafe(^{
        self.internal.canClinicianRead = canClinicianRead;
    });
}

- (NSNumber *)clinicianId {
    return ThreadSafeReturn(^id{
        return self.internal.clinicianId;
    });
}

- (void)setClinicianId:(NSNumber *)clinicianId {
    ThreadSafe(^{
        self.internal.clinicianId = clinicianId;
    });
}

- (NSString *)clinicianNameDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.clinicianNameDenormalized;
    });
}

- (void)setClinicianNameDenormalized:(NSString *)clinicianNameDenormalized {
    ThreadSafe(^{
        self.internal.clinicianNameDenormalized = clinicianNameDenormalized;
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

- (NSDate *)requestedAt {
    return ThreadSafeReturn(^id{
        return self.internal.requestedAt;
    });
}

- (void)setRequestedAt:(NSDate *)requestedAt {
    ThreadSafe(^{
        self.internal.requestedAt = requestedAt;
    });
}

- (Clinician *)clinician {
    if (!_clinician && self.internal.clinician) {
        _clinician = [[Clinician alloc] initWithInternal:(APInternalObject *)self.internal.clinician];
    }
    
    return _clinician;
}

- (void)setClinician:(Clinician *)clinician {
    if (_clinician != clinician) {
        _clinician = clinician;
        
        ThreadSafe(^{
            self.internal.clinician = (id)clinician.internal;
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

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.clinician" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patient" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.clinician"];
    [self removeObserver:self forKeyPath:@"internal.patient"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.clinician"]) {
        _clinician = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patient"]) {
        _patient = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
