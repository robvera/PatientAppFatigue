//
//  Patient.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Patient.h"
#import "Patient$AP$.h"
#import "PatientClinician.h"
#import "PatientCaregiver.h"
#import "PatientAdherenceLog.h"
#import "ClinicianCodeRequest.h"
#import "PatientApp.h"
#import "AnyPresenceAPI.h"

@interface Patient ()

@property (nonatomic, strong) Patient$AP$ * internal;

@end

@implementation Patient

@synthesize patientClinicians = _patientClinicians;

@synthesize patientCaregivers = _patientCaregivers;

@synthesize patientAdherenceLogs = _patientAdherenceLogs;

@synthesize clinicianCodeRequests = _clinicianCodeRequests;

@synthesize patientApps = _patientApps;

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

- (NSNumber *)allergiesSet {
    return ThreadSafeReturn(^id{
        return self.internal.allergiesSet;
    });
}

- (void)setAllergiesSet:(NSNumber *)allergiesSet {
    ThreadSafe(^{
        self.internal.allergiesSet = allergiesSet;
    });
}

- (NSString *)city {
    return ThreadSafeReturn(^id{
        return self.internal.city;
    });
}

- (void)setCity:(NSString *)city {
    ThreadSafe(^{
        self.internal.city = city;
    });
}

- (NSDate *)dob {
    return ThreadSafeReturn(^id{
        return self.internal.dob;
    });
}

- (void)setDob:(NSDate *)dob {
    ThreadSafe(^{
        self.internal.dob = dob;
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

- (NSNumber *)foodAllergies {
    return ThreadSafeReturn(^id{
        return self.internal.foodAllergies;
    });
}

- (void)setFoodAllergies:(NSNumber *)foodAllergies {
    ThreadSafe(^{
        self.internal.foodAllergies = foodAllergies;
    });
}

- (NSString *)gender {
    return ThreadSafeReturn(^id{
        return self.internal.gender;
    });
}

- (void)setGender:(NSString *)gender {
    ThreadSafe(^{
        self.internal.gender = gender;
    });
}

- (NSNumber *)height {
    return ThreadSafeReturn(^id{
        return self.internal.height;
    });
}

- (void)setHeight:(NSNumber *)height {
    ThreadSafe(^{
        self.internal.height = height;
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

- (NSDate *)lastLoginTimestamp {
    return ThreadSafeReturn(^id{
        return self.internal.lastLoginTimestamp;
    });
}

- (void)setLastLoginTimestamp:(NSDate *)lastLoginTimestamp {
    ThreadSafe(^{
        self.internal.lastLoginTimestamp = lastLoginTimestamp;
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

- (NSNumber *)logInCounter {
    return ThreadSafeReturn(^id{
        return self.internal.logInCounter;
    });
}

- (void)setLogInCounter:(NSNumber *)logInCounter {
    ThreadSafe(^{
        self.internal.logInCounter = logInCounter;
    });
}

- (NSNumber *)medicationAllergies {
    return ThreadSafeReturn(^id{
        return self.internal.medicationAllergies;
    });
}

- (void)setMedicationAllergies:(NSNumber *)medicationAllergies {
    ThreadSafe(^{
        self.internal.medicationAllergies = medicationAllergies;
    });
}

- (NSNumber *)patientAsthmaActionId {
    return ThreadSafeReturn(^id{
        return self.internal.patientAsthmaActionId;
    });
}

- (void)setPatientAsthmaActionId:(NSNumber *)patientAsthmaActionId {
    ThreadSafe(^{
        self.internal.patientAsthmaActionId = patientAsthmaActionId;
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

- (NSNumber *)seasonalAllergies {
    return ThreadSafeReturn(^id{
        return self.internal.seasonalAllergies;
    });
}

- (void)setSeasonalAllergies:(NSNumber *)seasonalAllergies {
    ThreadSafe(^{
        self.internal.seasonalAllergies = seasonalAllergies;
    });
}

- (NSString *)state {
    return ThreadSafeReturn(^id{
        return self.internal.state;
    });
}

- (void)setState:(NSString *)state {
    ThreadSafe(^{
        self.internal.state = state;
    });
}

- (NSNumber *)weight {
    return ThreadSafeReturn(^id{
        return self.internal.weight;
    });
}

- (void)setWeight:(NSNumber *)weight {
    ThreadSafe(^{
        self.internal.weight = weight;
    });
}

- (NSString *)zipcode {
    return ThreadSafeReturn(^id{
        return self.internal.zipcode;
    });
}

- (void)setZipcode:(NSString *)zipcode {
    ThreadSafe(^{
        self.internal.zipcode = zipcode;
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

- (NSOrderedSet *)patientCaregivers {
    if (!_patientCaregivers) {
        _patientCaregivers = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientCaregivers.count];
            for (APInternalObject * internal in self.internal.patientCaregivers) {
                PatientCaregiver * obj = [[PatientCaregiver alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientCaregivers;
}

- (void)setPatientCaregivers:(NSOrderedSet *)patientCaregivers {
    if (_patientCaregivers != patientCaregivers) {
        _patientCaregivers = patientCaregivers;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientCaregivers.count];
        for (PatientCaregiver * obj in patientCaregivers) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientCaregivers = [set copy];
        });
    }
}

- (NSOrderedSet *)patientAdherenceLogs {
    if (!_patientAdherenceLogs) {
        _patientAdherenceLogs = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientAdherenceLogs.count];
            for (APInternalObject * internal in self.internal.patientAdherenceLogs) {
                PatientAdherenceLog * obj = [[PatientAdherenceLog alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientAdherenceLogs;
}

- (void)setPatientAdherenceLogs:(NSOrderedSet *)patientAdherenceLogs {
    if (_patientAdherenceLogs != patientAdherenceLogs) {
        _patientAdherenceLogs = patientAdherenceLogs;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientAdherenceLogs.count];
        for (PatientAdherenceLog * obj in patientAdherenceLogs) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientAdherenceLogs = [set copy];
        });
    }
}

- (NSOrderedSet *)clinicianCodeRequests {
    if (!_clinicianCodeRequests) {
        _clinicianCodeRequests = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.clinicianCodeRequests.count];
            for (APInternalObject * internal in self.internal.clinicianCodeRequests) {
                ClinicianCodeRequest * obj = [[ClinicianCodeRequest alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _clinicianCodeRequests;
}

- (void)setClinicianCodeRequests:(NSOrderedSet *)clinicianCodeRequests {
    if (_clinicianCodeRequests != clinicianCodeRequests) {
        _clinicianCodeRequests = clinicianCodeRequests;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:clinicianCodeRequests.count];
        for (ClinicianCodeRequest * obj in clinicianCodeRequests) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.clinicianCodeRequests = [set copy];
        });
    }
}

- (NSOrderedSet *)patientApps {
    if (!_patientApps) {
        _patientApps = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientApps.count];
            for (APInternalObject * internal in self.internal.patientApps) {
                PatientApp * obj = [[PatientApp alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientApps;
}

- (void)setPatientApps:(NSOrderedSet *)patientApps {
    if (_patientApps != patientApps) {
        _patientApps = patientApps;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientApps.count];
        for (PatientApp * obj in patientApps) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientApps = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientClinicians" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientCaregivers" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientAdherenceLogs" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.clinicianCodeRequests" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientApps" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientClinicians"];
    [self removeObserver:self forKeyPath:@"internal.patientCaregivers"];
    [self removeObserver:self forKeyPath:@"internal.patientAdherenceLogs"];
    [self removeObserver:self forKeyPath:@"internal.clinicianCodeRequests"];
    [self removeObserver:self forKeyPath:@"internal.patientApps"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientClinicians"]) {
        _patientClinicians = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientCaregivers"]) {
        _patientCaregivers = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientAdherenceLogs"]) {
        _patientAdherenceLogs = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.clinicianCodeRequests"]) {
        _clinicianCodeRequests = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientApps"]) {
        _patientApps = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
