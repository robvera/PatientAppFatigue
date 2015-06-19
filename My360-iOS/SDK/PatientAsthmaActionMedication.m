//
//  PatientAsthmaActionMedication.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientAsthmaActionMedication.h"
#import "PatientAsthmaActionMedication$AP$.h"
#import "PatientAsthma.h"
#import "AnyPresenceAPI.h"

@interface PatientAsthmaActionMedication ()

@property (nonatomic, strong) PatientAsthmaActionMedication$AP$ * internal;

@end

@implementation PatientAsthmaActionMedication

@synthesize patientAsthma = _patientAsthma;

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

- (NSString *)dose {
    return ThreadSafeReturn(^id{
        return self.internal.dose;
    });
}

- (void)setDose:(NSString *)dose {
    ThreadSafe(^{
        self.internal.dose = dose;
    });
}

- (NSString *)frequency {
    return ThreadSafeReturn(^id{
        return self.internal.frequency;
    });
}

- (void)setFrequency:(NSString *)frequency {
    ThreadSafe(^{
        self.internal.frequency = frequency;
    });
}

- (NSString *)medication {
    return ThreadSafeReturn(^id{
        return self.internal.medication;
    });
}

- (void)setMedication:(NSString *)medication {
    ThreadSafe(^{
        self.internal.medication = medication;
    });
}

- (NSString *)medicationType {
    return ThreadSafeReturn(^id{
        return self.internal.medicationType;
    });
}

- (void)setMedicationType:(NSString *)medicationType {
    ThreadSafe(^{
        self.internal.medicationType = medicationType;
    });
}

- (NSNumber *)patientAsthmaActionIdSeq {
    return ThreadSafeReturn(^id{
        return self.internal.patientAsthmaActionIdSeq;
    });
}

- (void)setPatientAsthmaActionIdSeq:(NSNumber *)patientAsthmaActionIdSeq {
    ThreadSafe(^{
        self.internal.patientAsthmaActionIdSeq = patientAsthmaActionIdSeq;
    });
}

- (NSNumber *)patientAsthmaId {
    return ThreadSafeReturn(^id{
        return self.internal.patientAsthmaId;
    });
}

- (void)setPatientAsthmaId:(NSNumber *)patientAsthmaId {
    ThreadSafe(^{
        self.internal.patientAsthmaId = patientAsthmaId;
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

- (NSDate *)postedDate {
    return ThreadSafeReturn(^id{
        return self.internal.postedDate;
    });
}

- (void)setPostedDate:(NSDate *)postedDate {
    ThreadSafe(^{
        self.internal.postedDate = postedDate;
    });
}

- (PatientAsthma *)patientAsthma {
    if (!_patientAsthma && self.internal.patientAsthma) {
        _patientAsthma = [[PatientAsthma alloc] initWithInternal:(APInternalObject *)self.internal.patientAsthma];
    }
    
    return _patientAsthma;
}

- (void)setPatientAsthma:(PatientAsthma *)patientAsthma {
    if (_patientAsthma != patientAsthma) {
        _patientAsthma = patientAsthma;
        
        ThreadSafe(^{
            self.internal.patientAsthma = (id)patientAsthma.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientAsthma" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientAsthma"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientAsthma"]) {
        _patientAsthma = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
