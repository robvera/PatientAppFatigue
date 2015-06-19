//
//  PatientJournal.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientJournal.h"
#import "PatientJournal$AP$.h"
#import "PatientJournalSymptom.h"
#import "PatientJournalQuestionnaire.h"
#import "Ability.h"
#import "Mood.h"
#import "AnyPresenceAPI.h"

@interface PatientJournal ()

@property (nonatomic, strong) PatientJournal$AP$ * internal;

@end

@implementation PatientJournal

@synthesize patientJournalSymptoms = _patientJournalSymptoms;

@synthesize patientJournalQuestionnaires = _patientJournalQuestionnaires;

@synthesize ability = _ability;

@synthesize mood = _mood;

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

- (NSString *)abilityDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.abilityDenormalized;
    });
}

- (void)setAbilityDenormalized:(NSString *)abilityDenormalized {
    ThreadSafe(^{
        self.internal.abilityDenormalized = abilityDenormalized;
    });
}

- (NSNumber *)abilityId {
    return ThreadSafeReturn(^id{
        return self.internal.abilityId;
    });
}

- (void)setAbilityId:(NSNumber *)abilityId {
    ThreadSafe(^{
        self.internal.abilityId = abilityId;
    });
}

- (NSString *)activity {
    return ThreadSafeReturn(^id{
        return self.internal.activity;
    });
}

- (void)setActivity:(NSString *)activity {
    ThreadSafe(^{
        self.internal.activity = activity;
    });
}

- (NSString *)activityIntensity {
    return ThreadSafeReturn(^id{
        return self.internal.activityIntensity;
    });
}

- (void)setActivityIntensity:(NSString *)activityIntensity {
    ThreadSafe(^{
        self.internal.activityIntensity = activityIntensity;
    });
}

- (NSNumber *)allergensToday {
    return ThreadSafeReturn(^id{
        return self.internal.allergensToday;
    });
}

- (void)setAllergensToday:(NSNumber *)allergensToday {
    ThreadSafe(^{
        self.internal.allergensToday = allergensToday;
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

- (NSNumber *)bpDiastolic {
    return ThreadSafeReturn(^id{
        return self.internal.bpDiastolic;
    });
}

- (void)setBpDiastolic:(NSNumber *)bpDiastolic {
    ThreadSafe(^{
        self.internal.bpDiastolic = bpDiastolic;
    });
}

- (NSNumber *)bpSystolic {
    return ThreadSafeReturn(^id{
        return self.internal.bpSystolic;
    });
}

- (void)setBpSystolic:(NSNumber *)bpSystolic {
    ThreadSafe(^{
        self.internal.bpSystolic = bpSystolic;
    });
}

- (NSNumber *)carbohydrates {
    return ThreadSafeReturn(^id{
        return self.internal.carbohydrates;
    });
}

- (void)setCarbohydrates:(NSNumber *)carbohydrates {
    ThreadSafe(^{
        self.internal.carbohydrates = carbohydrates;
    });
}

- (NSNumber *)cholesterol {
    return ThreadSafeReturn(^id{
        return self.internal.cholesterol;
    });
}

- (void)setCholesterol:(NSNumber *)cholesterol {
    ThreadSafe(^{
        self.internal.cholesterol = cholesterol;
    });
}

- (NSNumber *)cognitiveDifficulty {
    return ThreadSafeReturn(^id{
        return self.internal.cognitiveDifficulty;
    });
}

- (void)setCognitiveDifficulty:(NSNumber *)cognitiveDifficulty {
    ThreadSafe(^{
        self.internal.cognitiveDifficulty = cognitiveDifficulty;
    });
}

- (NSNumber *)dayRating {
    return ThreadSafeReturn(^id{
        return self.internal.dayRating;
    });
}

- (void)setDayRating:(NSNumber *)dayRating {
    ThreadSafe(^{
        self.internal.dayRating = dayRating;
    });
}

- (NSNumber *)difficultyEverydayActivity {
    return ThreadSafeReturn(^id{
        return self.internal.difficultyEverydayActivity;
    });
}

- (void)setDifficultyEverydayActivity:(NSNumber *)difficultyEverydayActivity {
    ThreadSafe(^{
        self.internal.difficultyEverydayActivity = difficultyEverydayActivity;
    });
}

- (NSNumber *)duration {
    return ThreadSafeReturn(^id{
        return self.internal.duration;
    });
}

- (void)setDuration:(NSNumber *)duration {
    ThreadSafe(^{
        self.internal.duration = duration;
    });
}

- (NSNumber *)dyskinesiaDayPercentage {
    return ThreadSafeReturn(^id{
        return self.internal.dyskinesiaDayPercentage;
    });
}

- (void)setDyskinesiaDayPercentage:(NSNumber *)dyskinesiaDayPercentage {
    ThreadSafe(^{
        self.internal.dyskinesiaDayPercentage = dyskinesiaDayPercentage;
    });
}

- (NSNumber *)dyskinesiaRating {
    return ThreadSafeReturn(^id{
        return self.internal.dyskinesiaRating;
    });
}

- (void)setDyskinesiaRating:(NSNumber *)dyskinesiaRating {
    ThreadSafe(^{
        self.internal.dyskinesiaRating = dyskinesiaRating;
    });
}

- (NSNumber *)dyskinesiaToday {
    return ThreadSafeReturn(^id{
        return self.internal.dyskinesiaToday;
    });
}

- (void)setDyskinesiaToday:(NSNumber *)dyskinesiaToday {
    ThreadSafe(^{
        self.internal.dyskinesiaToday = dyskinesiaToday;
    });
}

- (NSNumber *)fef {
    return ThreadSafeReturn(^id{
        return self.internal.fef;
    });
}

- (void)setFef:(NSNumber *)fef {
    ThreadSafe(^{
        self.internal.fef = fef;
    });
}

- (NSNumber *)fev {
    return ThreadSafeReturn(^id{
        return self.internal.fev;
    });
}

- (void)setFev:(NSNumber *)fev {
    ThreadSafe(^{
        self.internal.fev = fev;
    });
}

- (NSNumber *)fevFvc {
    return ThreadSafeReturn(^id{
        return self.internal.fevFvc;
    });
}

- (void)setFevFvc:(NSNumber *)fevFvc {
    ThreadSafe(^{
        self.internal.fevFvc = fevFvc;
    });
}

- (NSNumber *)fevPercentage {
    return ThreadSafeReturn(^id{
        return self.internal.fevPercentage;
    });
}

- (void)setFevPercentage:(NSNumber *)fevPercentage {
    ThreadSafe(^{
        self.internal.fevPercentage = fevPercentage;
    });
}

- (NSNumber *)fvc {
    return ThreadSafeReturn(^id{
        return self.internal.fvc;
    });
}

- (void)setFvc:(NSNumber *)fvc {
    ThreadSafe(^{
        self.internal.fvc = fvc;
    });
}

- (NSNumber *)fvcPercentage {
    return ThreadSafeReturn(^id{
        return self.internal.fvcPercentage;
    });
}

- (void)setFvcPercentage:(NSNumber *)fvcPercentage {
    ThreadSafe(^{
        self.internal.fvcPercentage = fvcPercentage;
    });
}

- (NSNumber *)inhaler {
    return ThreadSafeReturn(^id{
        return self.internal.inhaler;
    });
}

- (void)setInhaler:(NSNumber *)inhaler {
    ThreadSafe(^{
        self.internal.inhaler = inhaler;
    });
}

- (NSDate *)journalOn {
    return ThreadSafeReturn(^id{
        return self.internal.journalOn;
    });
}

- (void)setJournalOn:(NSDate *)journalOn {
    ThreadSafe(^{
        self.internal.journalOn = journalOn;
    });
}

- (NSNumber *)medicationTakenToday {
    return ThreadSafeReturn(^id{
        return self.internal.medicationTakenToday;
    });
}

- (void)setMedicationTakenToday:(NSNumber *)medicationTakenToday {
    ThreadSafe(^{
        self.internal.medicationTakenToday = medicationTakenToday;
    });
}

- (NSString *)moodDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.moodDenormalized;
    });
}

- (void)setMoodDenormalized:(NSString *)moodDenormalized {
    ThreadSafe(^{
        self.internal.moodDenormalized = moodDenormalized;
    });
}

- (NSNumber *)moodId {
    return ThreadSafeReturn(^id{
        return self.internal.moodId;
    });
}

- (void)setMoodId:(NSNumber *)moodId {
    ThreadSafe(^{
        self.internal.moodId = moodId;
    });
}

- (NSString *)notes {
    return ThreadSafeReturn(^id{
        return self.internal.notes;
    });
}

- (void)setNotes:(NSString *)notes {
    ThreadSafe(^{
        self.internal.notes = notes;
    });
}

- (NSNumber *)painRating {
    return ThreadSafeReturn(^id{
        return self.internal.painRating;
    });
}

- (void)setPainRating:(NSNumber *)painRating {
    ThreadSafe(^{
        self.internal.painRating = painRating;
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

- (NSNumber *)peakFlow {
    return ThreadSafeReturn(^id{
        return self.internal.peakFlow;
    });
}

- (void)setPeakFlow:(NSNumber *)peakFlow {
    ThreadSafe(^{
        self.internal.peakFlow = peakFlow;
    });
}

- (NSNumber *)physicalActivityToday {
    return ThreadSafeReturn(^id{
        return self.internal.physicalActivityToday;
    });
}

- (void)setPhysicalActivityToday:(NSNumber *)physicalActivityToday {
    ThreadSafe(^{
        self.internal.physicalActivityToday = physicalActivityToday;
    });
}

- (NSNumber *)shortnessBreath {
    return ThreadSafeReturn(^id{
        return self.internal.shortnessBreath;
    });
}

- (void)setShortnessBreath:(NSNumber *)shortnessBreath {
    ThreadSafe(^{
        self.internal.shortnessBreath = shortnessBreath;
    });
}

- (NSString *)symptomIds {
    return ThreadSafeReturn(^id{
        return self.internal.symptomIds;
    });
}

- (void)setSymptomIds:(NSString *)symptomIds {
    ThreadSafe(^{
        self.internal.symptomIds = symptomIds;
    });
}

- (NSNumber *)symptomToday {
    return ThreadSafeReturn(^id{
        return self.internal.symptomToday;
    });
}

- (void)setSymptomToday:(NSNumber *)symptomToday {
    ThreadSafe(^{
        self.internal.symptomToday = symptomToday;
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

- (NSOrderedSet *)patientJournalSymptoms {
    if (!_patientJournalSymptoms) {
        _patientJournalSymptoms = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientJournalSymptoms.count];
            for (APInternalObject * internal in self.internal.patientJournalSymptoms) {
                PatientJournalSymptom * obj = [[PatientJournalSymptom alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientJournalSymptoms;
}

- (void)setPatientJournalSymptoms:(NSOrderedSet *)patientJournalSymptoms {
    if (_patientJournalSymptoms != patientJournalSymptoms) {
        _patientJournalSymptoms = patientJournalSymptoms;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientJournalSymptoms.count];
        for (PatientJournalSymptom * obj in patientJournalSymptoms) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientJournalSymptoms = [set copy];
        });
    }
}

- (NSOrderedSet *)patientJournalQuestionnaires {
    if (!_patientJournalQuestionnaires) {
        _patientJournalQuestionnaires = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientJournalQuestionnaires.count];
            for (APInternalObject * internal in self.internal.patientJournalQuestionnaires) {
                PatientJournalQuestionnaire * obj = [[PatientJournalQuestionnaire alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientJournalQuestionnaires;
}

- (void)setPatientJournalQuestionnaires:(NSOrderedSet *)patientJournalQuestionnaires {
    if (_patientJournalQuestionnaires != patientJournalQuestionnaires) {
        _patientJournalQuestionnaires = patientJournalQuestionnaires;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientJournalQuestionnaires.count];
        for (PatientJournalQuestionnaire * obj in patientJournalQuestionnaires) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientJournalQuestionnaires = [set copy];
        });
    }
}

- (Ability *)ability {
    if (!_ability && self.internal.ability) {
        _ability = [[Ability alloc] initWithInternal:(APInternalObject *)self.internal.ability];
    }
    
    return _ability;
}

- (void)setAbility:(Ability *)ability {
    if (_ability != ability) {
        _ability = ability;
        
        ThreadSafe(^{
            self.internal.ability = (id)ability.internal;
        });
    }
}

- (Mood *)mood {
    if (!_mood && self.internal.mood) {
        _mood = [[Mood alloc] initWithInternal:(APInternalObject *)self.internal.mood];
    }
    
    return _mood;
}

- (void)setMood:(Mood *)mood {
    if (_mood != mood) {
        _mood = mood;
        
        ThreadSafe(^{
            self.internal.mood = (id)mood.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientJournalSymptoms" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientJournalQuestionnaires" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.ability" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.mood" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientJournalSymptoms"];
    [self removeObserver:self forKeyPath:@"internal.patientJournalQuestionnaires"];
    [self removeObserver:self forKeyPath:@"internal.ability"];
    [self removeObserver:self forKeyPath:@"internal.mood"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientJournalSymptoms"]) {
        _patientJournalSymptoms = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientJournalQuestionnaires"]) {
        _patientJournalQuestionnaires = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.ability"]) {
        _ability = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.mood"]) {
        _mood = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
