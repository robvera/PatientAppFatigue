//
//  EducationalReading.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "EducationalReading.h"
#import "EducationalReading$AP$.h"
#import "PatientEducation.h"
#import "Clinician.h"
#import "AnyPresenceAPI.h"

@interface EducationalReading ()

@property (nonatomic, strong) EducationalReading$AP$ * internal;

@end

@implementation EducationalReading

@synthesize patientEducations = _patientEducations;

@synthesize clinician = _clinician;

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

- (NSDate *)addedOn {
    return ThreadSafeReturn(^id{
        return self.internal.addedOn;
    });
}

- (void)setAddedOn:(NSDate *)addedOn {
    ThreadSafe(^{
        self.internal.addedOn = addedOn;
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

- (NSNumber *)defaultEducation {
    return ThreadSafeReturn(^id{
        return self.internal.defaultEducation;
    });
}

- (void)setDefaultEducation:(NSNumber *)defaultEducation {
    ThreadSafe(^{
        self.internal.defaultEducation = defaultEducation;
    });
}

- (NSString *)desc {
    return ThreadSafeReturn(^id{
        return self.internal.desc;
    });
}

- (void)setDesc:(NSString *)desc {
    ThreadSafe(^{
        self.internal.desc = desc;
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

- (NSString *)url {
    return ThreadSafeReturn(^id{
        return self.internal.url;
    });
}

- (void)setUrl:(NSString *)url {
    ThreadSafe(^{
        self.internal.url = url;
    });
}

- (NSOrderedSet *)patientEducations {
    if (!_patientEducations) {
        _patientEducations = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientEducations.count];
            for (APInternalObject * internal in self.internal.patientEducations) {
                PatientEducation * obj = [[PatientEducation alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientEducations;
}

- (void)setPatientEducations:(NSOrderedSet *)patientEducations {
    if (_patientEducations != patientEducations) {
        _patientEducations = patientEducations;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientEducations.count];
        for (PatientEducation * obj in patientEducations) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientEducations = [set copy];
        });
    }
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

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientEducations" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.clinician" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientEducations"];
    [self removeObserver:self forKeyPath:@"internal.clinician"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientEducations"]) {
        _patientEducations = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.clinician"]) {
        _clinician = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
