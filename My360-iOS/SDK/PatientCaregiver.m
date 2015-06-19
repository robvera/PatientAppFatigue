//
//  PatientCaregiver.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientCaregiver.h"
#import "PatientCaregiver$AP$.h"
#import "Patient.h"
#import "AnyPresenceAPI.h"

@interface PatientCaregiver ()

@property (nonatomic, strong) PatientCaregiver$AP$ * internal;

@end

@implementation PatientCaregiver

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

- (NSString *)email {
    return ThreadSafeReturn(^id{
        return self.internal.email;
    });
}

- (void)setEmail:(NSString *)email {
    ThreadSafe(^{
        self.internal.email = email;
    });
}

- (NSNumber *)emailNotifications {
    return ThreadSafeReturn(^id{
        return self.internal.emailNotifications;
    });
}

- (void)setEmailNotifications:(NSNumber *)emailNotifications {
    ThreadSafe(^{
        self.internal.emailNotifications = emailNotifications;
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

- (NSString *)phone {
    return ThreadSafeReturn(^id{
        return self.internal.phone;
    });
}

- (void)setPhone:(NSString *)phone {
    ThreadSafe(^{
        self.internal.phone = phone;
    });
}

- (NSNumber *)smsNotifications {
    return ThreadSafeReturn(^id{
        return self.internal.smsNotifications;
    });
}

- (void)setSmsNotifications:(NSNumber *)smsNotifications {
    ThreadSafe(^{
        self.internal.smsNotifications = smsNotifications;
    });
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
        [self addObserver:self forKeyPath:@"internal.patient" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patient"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patient"]) {
        _patient = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
