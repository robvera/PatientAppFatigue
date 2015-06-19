//
//  MissingTreatmentReason.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "MissingTreatmentReason.h"
#import "MissingTreatmentReason$AP$.h"
#import "PatientAdherenceLog.h"
#import "AnyPresenceAPI.h"

@interface MissingTreatmentReason ()

@property (nonatomic, strong) MissingTreatmentReason$AP$ * internal;

@end

@implementation MissingTreatmentReason

@synthesize patientAdherenceLog = _patientAdherenceLog;

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

- (PatientAdherenceLog *)patientAdherenceLog {
    if (!_patientAdherenceLog && self.internal.patientAdherenceLog) {
        _patientAdherenceLog = [[PatientAdherenceLog alloc] initWithInternal:(APInternalObject *)self.internal.patientAdherenceLog];
    }
    
    return _patientAdherenceLog;
}

- (void)setPatientAdherenceLog:(PatientAdherenceLog *)patientAdherenceLog {
    if (_patientAdherenceLog != patientAdherenceLog) {
        _patientAdherenceLog = patientAdherenceLog;
        
        ThreadSafe(^{
            self.internal.patientAdherenceLog = (id)patientAdherenceLog.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientAdherenceLog" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientAdherenceLog"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientAdherenceLog"]) {
        _patientAdherenceLog = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
