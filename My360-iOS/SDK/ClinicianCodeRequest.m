//
//  ClinicianCodeRequest.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "ClinicianCodeRequest.h"
#import "ClinicianCodeRequest$AP$.h"
#import "Patient.h"
#import "AnyPresenceAPI.h"

@interface ClinicianCodeRequest ()

@property (nonatomic, strong) ClinicianCodeRequest$AP$ * internal;

@end

@implementation ClinicianCodeRequest

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

- (NSDate *)dateRequested {
    return ThreadSafeReturn(^id{
        return self.internal.dateRequested;
    });
}

- (void)setDateRequested:(NSDate *)dateRequested {
    ThreadSafe(^{
        self.internal.dateRequested = dateRequested;
    });
}

- (NSString *)emailAddress {
    return ThreadSafeReturn(^id{
        return self.internal.emailAddress;
    });
}

- (void)setEmailAddress:(NSString *)emailAddress {
    ThreadSafe(^{
        self.internal.emailAddress = emailAddress;
    });
}

- (NSString *)fax {
    return ThreadSafeReturn(^id{
        return self.internal.fax;
    });
}

- (void)setFax:(NSString *)fax {
    ThreadSafe(^{
        self.internal.fax = fax;
    });
}

- (NSString *)firstName {
    return ThreadSafeReturn(^id{
        return self.internal.firstName;
    });
}

- (void)setFirstName:(NSString *)firstName {
    ThreadSafe(^{
        self.internal.firstName = firstName;
    });
}

- (NSString *)lastName {
    return ThreadSafeReturn(^id{
        return self.internal.lastName;
    });
}

- (void)setLastName:(NSString *)lastName {
    ThreadSafe(^{
        self.internal.lastName = lastName;
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

- (NSNumber *)sendEmailFlag {
    return ThreadSafeReturn(^id{
        return self.internal.sendEmailFlag;
    });
}

- (void)setSendEmailFlag:(NSNumber *)sendEmailFlag {
    ThreadSafe(^{
        self.internal.sendEmailFlag = sendEmailFlag;
    });
}

- (NSString *)statusFlag {
    return ThreadSafeReturn(^id{
        return self.internal.statusFlag;
    });
}

- (void)setStatusFlag:(NSString *)statusFlag {
    ThreadSafe(^{
        self.internal.statusFlag = statusFlag;
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
