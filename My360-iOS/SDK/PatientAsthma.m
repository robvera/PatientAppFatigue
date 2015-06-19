//
//  PatientAsthma.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientAsthma.h"
#import "PatientAsthma$AP$.h"
#import "PatientAsthmaActionMedication.h"
#import "AnyPresenceAPI.h"

@interface PatientAsthma ()

@property (nonatomic, strong) PatientAsthma$AP$ * internal;

@end

@implementation PatientAsthma

@synthesize patientAsthmaActionMedications = _patientAsthmaActionMedications;

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

- (NSNumber *)assistwithmedication {
    return ThreadSafeReturn(^id{
        return self.internal.assistwithmedication;
    });
}

- (void)setAssistwithmedication:(NSNumber *)assistwithmedication {
    ThreadSafe(^{
        self.internal.assistwithmedication = assistwithmedication;
    });
}

- (NSDate *)asthmaActionDate {
    return ThreadSafeReturn(^id{
        return self.internal.asthmaActionDate;
    });
}

- (void)setAsthmaActionDate:(NSDate *)asthmaActionDate {
    ThreadSafe(^{
        self.internal.asthmaActionDate = asthmaActionDate;
    });
}

- (NSNumber *)asthmaSeverity {
    return ThreadSafeReturn(^id{
        return self.internal.asthmaSeverity;
    });
}

- (void)setAsthmaSeverity:(NSNumber *)asthmaSeverity {
    ThreadSafe(^{
        self.internal.asthmaSeverity = asthmaSeverity;
    });
}

- (NSNumber *)carrymedication {
    return ThreadSafeReturn(^id{
        return self.internal.carrymedication;
    });
}

- (void)setCarrymedication:(NSNumber *)carrymedication {
    ThreadSafe(^{
        self.internal.carrymedication = carrymedication;
    });
}

- (NSString *)instructionsAwfulCall {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsAwfulCall;
    });
}

- (void)setInstructionsAwfulCall:(NSString *)instructionsAwfulCall {
    ThreadSafe(^{
        self.internal.instructionsAwfulCall = instructionsAwfulCall;
    });
}

- (NSString *)instructionsAwfulMedicationOne {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsAwfulMedicationOne;
    });
}

- (void)setInstructionsAwfulMedicationOne:(NSString *)instructionsAwfulMedicationOne {
    ThreadSafe(^{
        self.internal.instructionsAwfulMedicationOne = instructionsAwfulMedicationOne;
    });
}

- (NSString *)instructionsAwfulMedicationTwo {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsAwfulMedicationTwo;
    });
}

- (void)setInstructionsAwfulMedicationTwo:(NSString *)instructionsAwfulMedicationTwo {
    ThreadSafe(^{
        self.internal.instructionsAwfulMedicationTwo = instructionsAwfulMedicationTwo;
    });
}

- (NSString *)instructionsFeelGoodDose {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsFeelGoodDose;
    });
}

- (void)setInstructionsFeelGoodDose:(NSString *)instructionsFeelGoodDose {
    ThreadSafe(^{
        self.internal.instructionsFeelGoodDose = instructionsFeelGoodDose;
    });
}

- (NSString *)instructionsFeelGoodMedication {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsFeelGoodMedication;
    });
}

- (void)setInstructionsFeelGoodMedication:(NSString *)instructionsFeelGoodMedication {
    ThreadSafe(^{
        self.internal.instructionsFeelGoodMedication = instructionsFeelGoodMedication;
    });
}

- (NSString *)instructionsFeelGoodTrigger {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsFeelGoodTrigger;
    });
}

- (void)setInstructionsFeelGoodTrigger:(NSString *)instructionsFeelGoodTrigger {
    ThreadSafe(^{
        self.internal.instructionsFeelGoodTrigger = instructionsFeelGoodTrigger;
    });
}

- (NSString *)instructionsNotFeelGoodMedication {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsNotFeelGoodMedication;
    });
}

- (void)setInstructionsNotFeelGoodMedication:(NSString *)instructionsNotFeelGoodMedication {
    ThreadSafe(^{
        self.internal.instructionsNotFeelGoodMedication = instructionsNotFeelGoodMedication;
    });
}

- (NSString *)instructionsNotFeelGoodSymptom {
    return ThreadSafeReturn(^id{
        return self.internal.instructionsNotFeelGoodSymptom;
    });
}

- (void)setInstructionsNotFeelGoodSymptom:(NSString *)instructionsNotFeelGoodSymptom {
    ThreadSafe(^{
        self.internal.instructionsNotFeelGoodSymptom = instructionsNotFeelGoodSymptom;
    });
}

- (NSString *)longTermDose {
    return ThreadSafeReturn(^id{
        return self.internal.longTermDose;
    });
}

- (void)setLongTermDose:(NSString *)longTermDose {
    ThreadSafe(^{
        self.internal.longTermDose = longTermDose;
    });
}

- (NSString *)longTermFrequency {
    return ThreadSafeReturn(^id{
        return self.internal.longTermFrequency;
    });
}

- (void)setLongTermFrequency:(NSString *)longTermFrequency {
    ThreadSafe(^{
        self.internal.longTermFrequency = longTermFrequency;
    });
}

- (NSString *)longTermMedication {
    return ThreadSafeReturn(^id{
        return self.internal.longTermMedication;
    });
}

- (void)setLongTermMedication:(NSString *)longTermMedication {
    ThreadSafe(^{
        self.internal.longTermMedication = longTermMedication;
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

- (NSNumber *)peakFlowPersonalBest {
    return ThreadSafeReturn(^id{
        return self.internal.peakFlowPersonalBest;
    });
}

- (void)setPeakFlowPersonalBest:(NSNumber *)peakFlowPersonalBest {
    ThreadSafe(^{
        self.internal.peakFlowPersonalBest = peakFlowPersonalBest;
    });
}

- (NSString *)peDose {
    return ThreadSafeReturn(^id{
        return self.internal.peDose;
    });
}

- (void)setPeDose:(NSString *)peDose {
    ThreadSafe(^{
        self.internal.peDose = peDose;
    });
}

- (NSString *)peFrequency {
    return ThreadSafeReturn(^id{
        return self.internal.peFrequency;
    });
}

- (void)setPeFrequency:(NSString *)peFrequency {
    ThreadSafe(^{
        self.internal.peFrequency = peFrequency;
    });
}

- (NSString *)peMedication {
    return ThreadSafeReturn(^id{
        return self.internal.peMedication;
    });
}

- (void)setPeMedication:(NSString *)peMedication {
    ThreadSafe(^{
        self.internal.peMedication = peMedication;
    });
}

- (NSDate *)postedDate {
    return ThreadSafeReturn(^id{
        return self.internal.postedDate;
    });
}

- (void)setPostedDate:(NSDate *)postedDate {
    ThreadSafe(^{
        self.internal.postedDate = postedDate;
    });
}

- (NSString *)quickDose {
    return ThreadSafeReturn(^id{
        return self.internal.quickDose;
    });
}

- (void)setQuickDose:(NSString *)quickDose {
    ThreadSafe(^{
        self.internal.quickDose = quickDose;
    });
}

- (NSString *)quickFrequency {
    return ThreadSafeReturn(^id{
        return self.internal.quickFrequency;
    });
}

- (void)setQuickFrequency:(NSString *)quickFrequency {
    ThreadSafe(^{
        self.internal.quickFrequency = quickFrequency;
    });
}

- (NSString *)quickMedication {
    return ThreadSafeReturn(^id{
        return self.internal.quickMedication;
    });
}

- (void)setQuickMedication:(NSString *)quickMedication {
    ThreadSafe(^{
        self.internal.quickMedication = quickMedication;
    });
}

- (NSNumber *)reminderToTakeMedicine {
    return ThreadSafeReturn(^id{
        return self.internal.reminderToTakeMedicine;
    });
}

- (void)setReminderToTakeMedicine:(NSNumber *)reminderToTakeMedicine {
    ThreadSafe(^{
        self.internal.reminderToTakeMedicine = reminderToTakeMedicine;
    });
}

- (NSNumber *)triggerAnimals {
    return ThreadSafeReturn(^id{
        return self.internal.triggerAnimals;
    });
}

- (void)setTriggerAnimals:(NSNumber *)triggerAnimals {
    ThreadSafe(^{
        self.internal.triggerAnimals = triggerAnimals;
    });
}

- (NSNumber *)triggerBirds {
    return ThreadSafeReturn(^id{
        return self.internal.triggerBirds;
    });
}

- (void)setTriggerBirds:(NSNumber *)triggerBirds {
    ThreadSafe(^{
        self.internal.triggerBirds = triggerBirds;
    });
}

- (NSNumber *)triggerCarExhaust {
    return ThreadSafeReturn(^id{
        return self.internal.triggerCarExhaust;
    });
}

- (void)setTriggerCarExhaust:(NSNumber *)triggerCarExhaust {
    ThreadSafe(^{
        self.internal.triggerCarExhaust = triggerCarExhaust;
    });
}

- (NSNumber *)triggerCleansers {
    return ThreadSafeReturn(^id{
        return self.internal.triggerCleansers;
    });
}

- (void)setTriggerCleansers:(NSNumber *)triggerCleansers {
    ThreadSafe(^{
        self.internal.triggerCleansers = triggerCleansers;
    });
}

- (NSNumber *)triggerCockroach {
    return ThreadSafeReturn(^id{
        return self.internal.triggerCockroach;
    });
}

- (void)setTriggerCockroach:(NSNumber *)triggerCockroach {
    ThreadSafe(^{
        self.internal.triggerCockroach = triggerCockroach;
    });
}

- (NSNumber *)triggerColdair {
    return ThreadSafeReturn(^id{
        return self.internal.triggerColdair;
    });
}

- (void)setTriggerColdair:(NSNumber *)triggerColdair {
    ThreadSafe(^{
        self.internal.triggerColdair = triggerColdair;
    });
}

- (NSNumber *)triggerDust {
    return ThreadSafeReturn(^id{
        return self.internal.triggerDust;
    });
}

- (void)setTriggerDust:(NSNumber *)triggerDust {
    ThreadSafe(^{
        self.internal.triggerDust = triggerDust;
    });
}

- (NSNumber *)triggerExcercise {
    return ThreadSafeReturn(^id{
        return self.internal.triggerExcercise;
    });
}

- (void)setTriggerExcercise:(NSNumber *)triggerExcercise {
    ThreadSafe(^{
        self.internal.triggerExcercise = triggerExcercise;
    });
}

- (NSNumber *)triggerMold {
    return ThreadSafeReturn(^id{
        return self.internal.triggerMold;
    });
}

- (void)setTriggerMold:(NSNumber *)triggerMold {
    ThreadSafe(^{
        self.internal.triggerMold = triggerMold;
    });
}

- (NSString *)triggerOther {
    return ThreadSafeReturn(^id{
        return self.internal.triggerOther;
    });
}

- (void)setTriggerOther:(NSString *)triggerOther {
    ThreadSafe(^{
        self.internal.triggerOther = triggerOther;
    });
}

- (NSNumber *)triggerPerfume {
    return ThreadSafeReturn(^id{
        return self.internal.triggerPerfume;
    });
}

- (void)setTriggerPerfume:(NSNumber *)triggerPerfume {
    ThreadSafe(^{
        self.internal.triggerPerfume = triggerPerfume;
    });
}

- (NSNumber *)triggerPesticide {
    return ThreadSafeReturn(^id{
        return self.internal.triggerPesticide;
    });
}

- (void)setTriggerPesticide:(NSNumber *)triggerPesticide {
    ThreadSafe(^{
        self.internal.triggerPesticide = triggerPesticide;
    });
}

- (NSNumber *)triggerTobacco {
    return ThreadSafeReturn(^id{
        return self.internal.triggerTobacco;
    });
}

- (void)setTriggerTobacco:(NSNumber *)triggerTobacco {
    ThreadSafe(^{
        self.internal.triggerTobacco = triggerTobacco;
    });
}

- (NSOrderedSet *)patientAsthmaActionMedications {
    if (!_patientAsthmaActionMedications) {
        _patientAsthmaActionMedications = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientAsthmaActionMedications.count];
            for (APInternalObject * internal in self.internal.patientAsthmaActionMedications) {
                PatientAsthmaActionMedication * obj = [[PatientAsthmaActionMedication alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientAsthmaActionMedications;
}

- (void)setPatientAsthmaActionMedications:(NSOrderedSet *)patientAsthmaActionMedications {
    if (_patientAsthmaActionMedications != patientAsthmaActionMedications) {
        _patientAsthmaActionMedications = patientAsthmaActionMedications;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientAsthmaActionMedications.count];
        for (PatientAsthmaActionMedication * obj in patientAsthmaActionMedications) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientAsthmaActionMedications = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientAsthmaActionMedications" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientAsthmaActionMedications"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientAsthmaActionMedications"]) {
        _patientAsthmaActionMedications = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
