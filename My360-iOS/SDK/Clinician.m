//
//  Clinician.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Clinician.h"
#import "Clinician$AP$.h"
#import "PatientClinician.h"
#import "EducationalReading.h"
#import "AnyPresenceAPI.h"

@interface Clinician ()

@property (nonatomic, strong) Clinician$AP$ * internal;

@end

@implementation Clinician

@synthesize patientClinicians = _patientClinicians;

@synthesize educationalReadings = _educationalReadings;

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

- (NSString *)clinicianType {
    return ThreadSafeReturn(^id{
        return self.internal.clinicianType;
    });
}

- (void)setClinicianType:(NSString *)clinicianType {
    ThreadSafe(^{
        self.internal.clinicianType = clinicianType;
    });
}

- (NSString *)couponCode {
    return ThreadSafeReturn(^id{
        return self.internal.couponCode;
    });
}

- (void)setCouponCode:(NSString *)couponCode {
    ThreadSafe(^{
        self.internal.couponCode = couponCode;
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

- (NSOrderedSet *)patientClinicians {
    if (!_patientClinicians) {
        _patientClinicians = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientClinicians.count];
            for (APInternalObject * internal in self.internal.patientClinicians) {
                PatientClinician * obj = [[PatientClinician alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientClinicians;
}

- (void)setPatientClinicians:(NSOrderedSet *)patientClinicians {
    if (_patientClinicians != patientClinicians) {
        _patientClinicians = patientClinicians;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientClinicians.count];
        for (PatientClinician * obj in patientClinicians) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientClinicians = [set copy];
        });
    }
}

- (NSOrderedSet *)educationalReadings {
    if (!_educationalReadings) {
        _educationalReadings = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.educationalReadings.count];
            for (APInternalObject * internal in self.internal.educationalReadings) {
                EducationalReading * obj = [[EducationalReading alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _educationalReadings;
}

- (void)setEducationalReadings:(NSOrderedSet *)educationalReadings {
    if (_educationalReadings != educationalReadings) {
        _educationalReadings = educationalReadings;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:educationalReadings.count];
        for (EducationalReading * obj in educationalReadings) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.educationalReadings = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientClinicians" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.educationalReadings" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientClinicians"];
    [self removeObserver:self forKeyPath:@"internal.educationalReadings"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientClinicians"]) {
        _patientClinicians = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.educationalReadings"]) {
        _educationalReadings = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
