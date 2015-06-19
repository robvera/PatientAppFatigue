//
//  Medication.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Medication.h"
#import "Medication$AP$.h"
#import "PatientTreatment.h"
#import "PatientSideEffectMedication.h"
#import "AnyPresenceAPI.h"

@interface Medication ()

@property (nonatomic, strong) Medication$AP$ * internal;

@end

@implementation Medication

@synthesize patientTreatments = _patientTreatments;

@synthesize patientSideEffectMedications = _patientSideEffectMedications;

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

- (NSNumber *)defaultDosage {
    return ThreadSafeReturn(^id{
        return self.internal.defaultDosage;
    });
}

- (void)setDefaultDosage:(NSNumber *)defaultDosage {
    ThreadSafe(^{
        self.internal.defaultDosage = defaultDosage;
    });
}

- (NSNumber *)defaultDosageUomId {
    return ThreadSafeReturn(^id{
        return self.internal.defaultDosageUomId;
    });
}

- (void)setDefaultDosageUomId:(NSNumber *)defaultDosageUomId {
    ThreadSafe(^{
        self.internal.defaultDosageUomId = defaultDosageUomId;
    });
}

- (NSNumber *)defaultIngestionMethodId {
    return ThreadSafeReturn(^id{
        return self.internal.defaultIngestionMethodId;
    });
}

- (void)setDefaultIngestionMethodId:(NSNumber *)defaultIngestionMethodId {
    ThreadSafe(^{
        self.internal.defaultIngestionMethodId = defaultIngestionMethodId;
    });
}

- (NSNumber *)defaultTreatmentScheduleId {
    return ThreadSafeReturn(^id{
        return self.internal.defaultTreatmentScheduleId;
    });
}

- (void)setDefaultTreatmentScheduleId:(NSNumber *)defaultTreatmentScheduleId {
    ThreadSafe(^{
        self.internal.defaultTreatmentScheduleId = defaultTreatmentScheduleId;
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

- (NSString *)medicationCat {
    return ThreadSafeReturn(^id{
        return self.internal.medicationCat;
    });
}

- (void)setMedicationCat:(NSString *)medicationCat {
    ThreadSafe(^{
        self.internal.medicationCat = medicationCat;
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

- (NSString *)subCategory {
    return ThreadSafeReturn(^id{
        return self.internal.subCategory;
    });
}

- (void)setSubCategory:(NSString *)subCategory {
    ThreadSafe(^{
        self.internal.subCategory = subCategory;
    });
}

- (NSOrderedSet *)patientTreatments {
    if (!_patientTreatments) {
        _patientTreatments = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientTreatments.count];
            for (APInternalObject * internal in self.internal.patientTreatments) {
                PatientTreatment * obj = [[PatientTreatment alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientTreatments;
}

- (void)setPatientTreatments:(NSOrderedSet *)patientTreatments {
    if (_patientTreatments != patientTreatments) {
        _patientTreatments = patientTreatments;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientTreatments.count];
        for (PatientTreatment * obj in patientTreatments) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientTreatments = [set copy];
        });
    }
}

- (NSOrderedSet *)patientSideEffectMedications {
    if (!_patientSideEffectMedications) {
        _patientSideEffectMedications = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientSideEffectMedications.count];
            for (APInternalObject * internal in self.internal.patientSideEffectMedications) {
                PatientSideEffectMedication * obj = [[PatientSideEffectMedication alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientSideEffectMedications;
}

- (void)setPatientSideEffectMedications:(NSOrderedSet *)patientSideEffectMedications {
    if (_patientSideEffectMedications != patientSideEffectMedications) {
        _patientSideEffectMedications = patientSideEffectMedications;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientSideEffectMedications.count];
        for (PatientSideEffectMedication * obj in patientSideEffectMedications) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientSideEffectMedications = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientTreatments" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientSideEffectMedications" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientTreatments"];
    [self removeObserver:self forKeyPath:@"internal.patientSideEffectMedications"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientTreatments"]) {
        _patientTreatments = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientSideEffectMedications"]) {
        _patientSideEffectMedications = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
