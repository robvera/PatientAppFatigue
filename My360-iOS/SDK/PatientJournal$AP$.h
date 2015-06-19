//
//  PatientJournal$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Ability$AP$;

@class Mood$AP$;

@interface PatientJournal$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSString * abilityDenormalized;
@property (nonatomic, strong) NSNumber * abilityId;
@property (nonatomic, strong) NSString * activity;
@property (nonatomic, strong) NSString * activityIntensity;
@property (nonatomic, strong) NSNumber * allergensToday;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSNumber * bpDiastolic;
@property (nonatomic, strong) NSNumber * bpSystolic;
@property (nonatomic, strong) NSNumber * carbohydrates;
@property (nonatomic, strong) NSNumber * cholesterol;
@property (nonatomic, strong) NSNumber * cognitiveDifficulty;
@property (nonatomic, strong) NSNumber * dayRating;
@property (nonatomic, strong) NSNumber * difficultyEverydayActivity;
@property (nonatomic, strong) NSNumber * duration;
@property (nonatomic, strong) NSNumber * dyskinesiaDayPercentage;
@property (nonatomic, strong) NSNumber * dyskinesiaRating;
@property (nonatomic, strong) NSNumber * dyskinesiaToday;
@property (nonatomic, strong) NSNumber * fef;
@property (nonatomic, strong) NSNumber * fev;
@property (nonatomic, strong) NSNumber * fevFvc;
@property (nonatomic, strong) NSNumber * fevPercentage;
@property (nonatomic, strong) NSNumber * fvc;
@property (nonatomic, strong) NSNumber * fvcPercentage;
@property (nonatomic, strong) NSNumber * inhaler;
@property (nonatomic, strong) NSDate * journalOn;
@property (nonatomic, strong) NSNumber * medicationTakenToday;
@property (nonatomic, strong) NSString * moodDenormalized;
@property (nonatomic, strong) NSNumber * moodId;
@property (nonatomic, strong) NSString * notes;
@property (nonatomic, strong) NSNumber * painRating;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * peakFlow;
@property (nonatomic, strong) NSNumber * physicalActivityToday;
@property (nonatomic, strong) NSNumber * shortnessBreath;
@property (nonatomic, strong) NSString * symptomIds;
@property (nonatomic, strong) NSNumber * symptomToday;
@property (nonatomic, strong) NSNumber * weight;
@property (nonatomic, strong) NSOrderedSet * patientJournalSymptoms;
@property (nonatomic, strong) NSOrderedSet * patientJournalQuestionnaires;
@property (nonatomic, strong) Ability$AP$ * ability;
@property (nonatomic, strong) Mood$AP$ * mood;

@end
