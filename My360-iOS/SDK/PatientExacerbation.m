//
//  PatientExacerbation.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientExacerbation.h"
#import "PatientExacerbation$AP$.h"
#import "Symptom.h"
#import "AnyPresenceAPI.h"

@interface PatientExacerbation ()

@property (nonatomic, strong) PatientExacerbation$AP$ * internal;

@end

@implementation PatientExacerbation

@synthesize symptom = _symptom;

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

- (NSNumber *)concurrentInfection {
    return ThreadSafeReturn(^id{
        return self.internal.concurrentInfection;
    });
}

- (void)setConcurrentInfection:(NSNumber *)concurrentInfection {
    ThreadSafe(^{
        self.internal.concurrentInfection = concurrentInfection;
    });
}

- (NSDate *)endOn {
    return ThreadSafeReturn(^id{
        return self.internal.endOn;
    });
}

- (void)setEndOn:(NSDate *)endOn {
    ThreadSafe(^{
        self.internal.endOn = endOn;
    });
}

- (NSNumber *)fatigability {
    return ThreadSafeReturn(^id{
        return self.internal.fatigability;
    });
}

- (void)setFatigability:(NSNumber *)fatigability {
    ThreadSafe(^{
        self.internal.fatigability = fatigability;
    });
}

- (NSNumber *)heatExposure {
    return ThreadSafeReturn(^id{
        return self.internal.heatExposure;
    });
}

- (void)setHeatExposure:(NSNumber *)heatExposure {
    ThreadSafe(^{
        self.internal.heatExposure = heatExposure;
    });
}

- (NSNumber *)intensity {
    return ThreadSafeReturn(^id{
        return self.internal.intensity;
    });
}

- (void)setIntensity:(NSNumber *)intensity {
    ThreadSafe(^{
        self.internal.intensity = intensity;
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

- (NSDate *)startOn {
    return ThreadSafeReturn(^id{
        return self.internal.startOn;
    });
}

- (void)setStartOn:(NSDate *)startOn {
    ThreadSafe(^{
        self.internal.startOn = startOn;
    });
}

- (NSNumber *)stress {
    return ThreadSafeReturn(^id{
        return self.internal.stress;
    });
}

- (void)setStress:(NSNumber *)stress {
    ThreadSafe(^{
        self.internal.stress = stress;
    });
}

- (NSString *)symptomDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.symptomDenormalized;
    });
}

- (void)setSymptomDenormalized:(NSString *)symptomDenormalized {
    ThreadSafe(^{
        self.internal.symptomDenormalized = symptomDenormalized;
    });
}

- (NSNumber *)symptomId {
    return ThreadSafeReturn(^id{
        return self.internal.symptomId;
    });
}

- (void)setSymptomId:(NSNumber *)symptomId {
    ThreadSafe(^{
        self.internal.symptomId = symptomId;
    });
}

- (Symptom *)symptom {
    if (!_symptom && self.internal.symptom) {
        _symptom = [[Symptom alloc] initWithInternal:(APInternalObject *)self.internal.symptom];
    }
    
    return _symptom;
}

- (void)setSymptom:(Symptom *)symptom {
    if (_symptom != symptom) {
        _symptom = symptom;
        
        ThreadSafe(^{
            self.internal.symptom = (id)symptom.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.symptom" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.symptom"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.symptom"]) {
        _symptom = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
