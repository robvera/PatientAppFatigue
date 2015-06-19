//
//  PatientTreatment.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientTreatment.h"
#import "PatientTreatment$AP$.h"
#import "PatientAdherenceLog.h"
#import "DosageUom.h"
#import "IngestionMethod.h"
#import "Medication.h"
#import "TreatmentSchedule.h"
#import "TreatmentType.h"
#import "AnyPresenceAPI.h"

@interface PatientTreatment ()

@property (nonatomic, strong) PatientTreatment$AP$ * internal;

@end

@implementation PatientTreatment

@synthesize patientAdherenceLogs = _patientAdherenceLogs;

@synthesize dosageUom = _dosageUom;

@synthesize ingestionMethod = _ingestionMethod;

@synthesize medication = _medication;

@synthesize treatmentSchedule = _treatmentSchedule;

@synthesize treatmentType = _treatmentType;

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

- (NSDate *)currentScheduleOn {
    return ThreadSafeReturn(^id{
        return self.internal.currentScheduleOn;
    });
}

- (void)setCurrentScheduleOn:(NSDate *)currentScheduleOn {
    ThreadSafe(^{
        self.internal.currentScheduleOn = currentScheduleOn;
    });
}

- (NSNumber *)dosage {
    return ThreadSafeReturn(^id{
        return self.internal.dosage;
    });
}

- (void)setDosage:(NSNumber *)dosage {
    ThreadSafe(^{
        self.internal.dosage = dosage;
    });
}

- (NSString *)dosageUomDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.dosageUomDenormalized;
    });
}

- (void)setDosageUomDenormalized:(NSString *)dosageUomDenormalized {
    ThreadSafe(^{
        self.internal.dosageUomDenormalized = dosageUomDenormalized;
    });
}

- (NSNumber *)dosageUomId {
    return ThreadSafeReturn(^id{
        return self.internal.dosageUomId;
    });
}

- (void)setDosageUomId:(NSNumber *)dosageUomId {
    ThreadSafe(^{
        self.internal.dosageUomId = dosageUomId;
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

- (NSString *)ingestionMethodDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.ingestionMethodDenormalized;
    });
}

- (void)setIngestionMethodDenormalized:(NSString *)ingestionMethodDenormalized {
    ThreadSafe(^{
        self.internal.ingestionMethodDenormalized = ingestionMethodDenormalized;
    });
}

- (NSNumber *)ingestionMethodId {
    return ThreadSafeReturn(^id{
        return self.internal.ingestionMethodId;
    });
}

- (void)setIngestionMethodId:(NSNumber *)ingestionMethodId {
    ThreadSafe(^{
        self.internal.ingestionMethodId = ingestionMethodId;
    });
}

- (NSString *)medicationDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.medicationDenormalized;
    });
}

- (void)setMedicationDenormalized:(NSString *)medicationDenormalized {
    ThreadSafe(^{
        self.internal.medicationDenormalized = medicationDenormalized;
    });
}

- (NSNumber *)medicationId {
    return ThreadSafeReturn(^id{
        return self.internal.medicationId;
    });
}

- (void)setMedicationId:(NSNumber *)medicationId {
    ThreadSafe(^{
        self.internal.medicationId = medicationId;
    });
}

- (NSDate *)nextScheduleOn {
    return ThreadSafeReturn(^id{
        return self.internal.nextScheduleOn;
    });
}

- (void)setNextScheduleOn:(NSDate *)nextScheduleOn {
    ThreadSafe(^{
        self.internal.nextScheduleOn = nextScheduleOn;
    });
}

- (NSNumber *)numberHrsPerDay {
    return ThreadSafeReturn(^id{
        return self.internal.numberHrsPerDay;
    });
}

- (void)setNumberHrsPerDay:(NSNumber *)numberHrsPerDay {
    ThreadSafe(^{
        self.internal.numberHrsPerDay = numberHrsPerDay;
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

- (NSString *)timeOfUse {
    return ThreadSafeReturn(^id{
        return self.internal.timeOfUse;
    });
}

- (void)setTimeOfUse:(NSString *)timeOfUse {
    ThreadSafe(^{
        self.internal.timeOfUse = timeOfUse;
    });
}

- (NSString *)treatmentScheduleDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentScheduleDenormalized;
    });
}

- (void)setTreatmentScheduleDenormalized:(NSString *)treatmentScheduleDenormalized {
    ThreadSafe(^{
        self.internal.treatmentScheduleDenormalized = treatmentScheduleDenormalized;
    });
}

- (NSNumber *)treatmentScheduleId {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentScheduleId;
    });
}

- (void)setTreatmentScheduleId:(NSNumber *)treatmentScheduleId {
    ThreadSafe(^{
        self.internal.treatmentScheduleId = treatmentScheduleId;
    });
}

- (NSString *)treatmentTypeDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentTypeDenormalized;
    });
}

- (void)setTreatmentTypeDenormalized:(NSString *)treatmentTypeDenormalized {
    ThreadSafe(^{
        self.internal.treatmentTypeDenormalized = treatmentTypeDenormalized;
    });
}

- (NSNumber *)treatmentTypeId {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentTypeId;
    });
}

- (void)setTreatmentTypeId:(NSNumber *)treatmentTypeId {
    ThreadSafe(^{
        self.internal.treatmentTypeId = treatmentTypeId;
    });
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

- (DosageUom *)dosageUom {
    if (!_dosageUom && self.internal.dosageUom) {
        _dosageUom = [[DosageUom alloc] initWithInternal:(APInternalObject *)self.internal.dosageUom];
    }
    
    return _dosageUom;
}

- (void)setDosageUom:(DosageUom *)dosageUom {
    if (_dosageUom != dosageUom) {
        _dosageUom = dosageUom;
        
        ThreadSafe(^{
            self.internal.dosageUom = (id)dosageUom.internal;
        });
    }
}

- (IngestionMethod *)ingestionMethod {
    if (!_ingestionMethod && self.internal.ingestionMethod) {
        _ingestionMethod = [[IngestionMethod alloc] initWithInternal:(APInternalObject *)self.internal.ingestionMethod];
    }
    
    return _ingestionMethod;
}

- (void)setIngestionMethod:(IngestionMethod *)ingestionMethod {
    if (_ingestionMethod != ingestionMethod) {
        _ingestionMethod = ingestionMethod;
        
        ThreadSafe(^{
            self.internal.ingestionMethod = (id)ingestionMethod.internal;
        });
    }
}

- (Medication *)medication {
    if (!_medication && self.internal.medication) {
        _medication = [[Medication alloc] initWithInternal:(APInternalObject *)self.internal.medication];
    }
    
    return _medication;
}

- (void)setMedication:(Medication *)medication {
    if (_medication != medication) {
        _medication = medication;
        
        ThreadSafe(^{
            self.internal.medication = (id)medication.internal;
        });
    }
}

- (TreatmentSchedule *)treatmentSchedule {
    if (!_treatmentSchedule && self.internal.treatmentSchedule) {
        _treatmentSchedule = [[TreatmentSchedule alloc] initWithInternal:(APInternalObject *)self.internal.treatmentSchedule];
    }
    
    return _treatmentSchedule;
}

- (void)setTreatmentSchedule:(TreatmentSchedule *)treatmentSchedule {
    if (_treatmentSchedule != treatmentSchedule) {
        _treatmentSchedule = treatmentSchedule;
        
        ThreadSafe(^{
            self.internal.treatmentSchedule = (id)treatmentSchedule.internal;
        });
    }
}

- (TreatmentType *)treatmentType {
    if (!_treatmentType && self.internal.treatmentType) {
        _treatmentType = [[TreatmentType alloc] initWithInternal:(APInternalObject *)self.internal.treatmentType];
    }
    
    return _treatmentType;
}

- (void)setTreatmentType:(TreatmentType *)treatmentType {
    if (_treatmentType != treatmentType) {
        _treatmentType = treatmentType;
        
        ThreadSafe(^{
            self.internal.treatmentType = (id)treatmentType.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientAdherenceLogs" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.dosageUom" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.ingestionMethod" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.medication" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.treatmentSchedule" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.treatmentType" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientAdherenceLogs"];
    [self removeObserver:self forKeyPath:@"internal.dosageUom"];
    [self removeObserver:self forKeyPath:@"internal.ingestionMethod"];
    [self removeObserver:self forKeyPath:@"internal.medication"];
    [self removeObserver:self forKeyPath:@"internal.treatmentSchedule"];
    [self removeObserver:self forKeyPath:@"internal.treatmentType"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientAdherenceLogs"]) {
        _patientAdherenceLogs = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.dosageUom"]) {
        _dosageUom = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.ingestionMethod"]) {
        _ingestionMethod = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.medication"]) {
        _medication = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.treatmentSchedule"]) {
        _treatmentSchedule = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.treatmentType"]) {
        _treatmentType = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
