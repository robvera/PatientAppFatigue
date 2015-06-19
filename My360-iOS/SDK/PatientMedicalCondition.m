//
//  PatientMedicalCondition.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientMedicalCondition.h"
#import "PatientMedicalCondition$AP$.h"
#import "MedicalCondition.h"
#import "AnyPresenceAPI.h"

@interface PatientMedicalCondition ()

@property (nonatomic, strong) PatientMedicalCondition$AP$ * internal;

@end

@implementation PatientMedicalCondition

@synthesize medicalCondition = _medicalCondition;

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

- (NSString *)medicalConditionDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.medicalConditionDenormalized;
    });
}

- (void)setMedicalConditionDenormalized:(NSString *)medicalConditionDenormalized {
    ThreadSafe(^{
        self.internal.medicalConditionDenormalized = medicalConditionDenormalized;
    });
}

- (NSNumber *)medicalConditionId {
    return ThreadSafeReturn(^id{
        return self.internal.medicalConditionId;
    });
}

- (void)setMedicalConditionId:(NSNumber *)medicalConditionId {
    ThreadSafe(^{
        self.internal.medicalConditionId = medicalConditionId;
    });
}

- (NSString *)medicalConditionIds {
    return ThreadSafeReturn(^id{
        return self.internal.medicalConditionIds;
    });
}

- (void)setMedicalConditionIds:(NSString *)medicalConditionIds {
    ThreadSafe(^{
        self.internal.medicalConditionIds = medicalConditionIds;
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

- (MedicalCondition *)medicalCondition {
    if (!_medicalCondition && self.internal.medicalCondition) {
        _medicalCondition = [[MedicalCondition alloc] initWithInternal:(APInternalObject *)self.internal.medicalCondition];
    }
    
    return _medicalCondition;
}

- (void)setMedicalCondition:(MedicalCondition *)medicalCondition {
    if (_medicalCondition != medicalCondition) {
        _medicalCondition = medicalCondition;
        
        ThreadSafe(^{
            self.internal.medicalCondition = (id)medicalCondition.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.medicalCondition" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.medicalCondition"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.medicalCondition"]) {
        _medicalCondition = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
