//
//  PatientJournal.h
//  AnyPresence SDK
//

/*!
 @header PatientJournal
 @abstract PatientJournal class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Ability;

@class Mood;

/*!
 @class PatientJournal
 @abstract Generated model object: PatientJournal.
 @discussion Use @link //apple_ref/occ/cat/PatientJournal(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientJournal/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientJournal : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientJournal.
 @result Class representing the data source associated with a PatientJournal.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var abilityDenormalized
 @abstract Generated model property: ability_denormalized.
 */
@property (nonatomic, strong) NSString * abilityDenormalized;

/*!
 @var abilityId
 @abstract Generated model property: ability_id.
 */
@property (nonatomic, strong) NSNumber * abilityId;

/*!
 @var activity
 @abstract Generated model property: activity.
 */
@property (nonatomic, strong) NSString * activity;

/*!
 @var activityIntensity
 @abstract Generated model property: activity_intensity.
 */
@property (nonatomic, strong) NSString * activityIntensity;

/*!
 @var allergensToday
 @abstract Generated model property: allergens_today.
 */
@property (nonatomic, strong) NSNumber * allergensToday;

/*!
 @var appId
 @abstract Generated model property: app_id.
 */
@property (nonatomic, strong) NSNumber * appId;

/*!
 @var archived
 @abstract Generated model property: archived.
 */
@property (nonatomic, strong) NSNumber * archived;

/*!
 @var bpDiastolic
 @abstract Generated model property: bp_diastolic.
 */
@property (nonatomic, strong) NSNumber * bpDiastolic;

/*!
 @var bpSystolic
 @abstract Generated model property: bp_systolic.
 */
@property (nonatomic, strong) NSNumber * bpSystolic;

/*!
 @var carbohydrates
 @abstract Generated model property: carbohydrates.
 */
@property (nonatomic, strong) NSNumber * carbohydrates;

/*!
 @var cholesterol
 @abstract Generated model property: cholesterol.
 */
@property (nonatomic, strong) NSNumber * cholesterol;

/*!
 @var cognitiveDifficulty
 @abstract Generated model property: cognitive_difficulty.
 */
@property (nonatomic, strong) NSNumber * cognitiveDifficulty;

/*!
 @var dayRating
 @abstract Generated model property: day_rating.
 */
@property (nonatomic, strong) NSNumber * dayRating;

/*!
 @var difficultyEverydayActivity
 @abstract Generated model property: difficulty_everyday_activity.
 */
@property (nonatomic, strong) NSNumber * difficultyEverydayActivity;

/*!
 @var duration
 @abstract Generated model property: duration.
 */
@property (nonatomic, strong) NSNumber * duration;

/*!
 @var dyskinesiaDayPercentage
 @abstract Generated model property: dyskinesia_day_percentage.
 */
@property (nonatomic, strong) NSNumber * dyskinesiaDayPercentage;

/*!
 @var dyskinesiaRating
 @abstract Generated model property: dyskinesia_rating.
 */
@property (nonatomic, strong) NSNumber * dyskinesiaRating;

/*!
 @var dyskinesiaToday
 @abstract Generated model property: dyskinesia_today.
 */
@property (nonatomic, strong) NSNumber * dyskinesiaToday;

/*!
 @var fef
 @abstract Generated model property: fef.
 */
@property (nonatomic, strong) NSNumber * fef;

/*!
 @var fev
 @abstract Generated model property: fev.
 */
@property (nonatomic, strong) NSNumber * fev;

/*!
 @var fevFvc
 @abstract Generated model property: fev_fvc.
 */
@property (nonatomic, strong) NSNumber * fevFvc;

/*!
 @var fevPercentage
 @abstract Generated model property: fev_percentage.
 */
@property (nonatomic, strong) NSNumber * fevPercentage;

/*!
 @var fvc
 @abstract Generated model property: fvc.
 */
@property (nonatomic, strong) NSNumber * fvc;

/*!
 @var fvcPercentage
 @abstract Generated model property: fvc_percentage.
 */
@property (nonatomic, strong) NSNumber * fvcPercentage;

/*!
 @var inhaler
 @abstract Generated model property: inhaler.
 */
@property (nonatomic, strong) NSNumber * inhaler;

/*!
 @var journalOn
 @abstract Generated model property: journal_on.
 */
@property (nonatomic, strong) NSDate * journalOn;

/*!
 @var medicationTakenToday
 @abstract Generated model property: medication_taken_today.
 */
@property (nonatomic, strong) NSNumber * medicationTakenToday;

/*!
 @var moodDenormalized
 @abstract Generated model property: mood_denormalized.
 */
@property (nonatomic, strong) NSString * moodDenormalized;

/*!
 @var moodId
 @abstract Generated model property: mood_id.
 */
@property (nonatomic, strong) NSNumber * moodId;

/*!
 @var notes
 @abstract Generated model property: notes.
 */
@property (nonatomic, strong) NSString * notes;

/*!
 @var painRating
 @abstract Generated model property: pain_rating.
 */
@property (nonatomic, strong) NSNumber * painRating;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var peakFlow
 @abstract Generated model property: peak_flow.
 */
@property (nonatomic, strong) NSNumber * peakFlow;

/*!
 @var physicalActivityToday
 @abstract Generated model property: physical_activity_today.
 */
@property (nonatomic, strong) NSNumber * physicalActivityToday;

/*!
 @var shortnessBreath
 @abstract Generated model property: shortness_breath.
 */
@property (nonatomic, strong) NSNumber * shortnessBreath;

/*!
 @var symptomIds
 @abstract Generated model property: symptom_ids.
 */
@property (nonatomic, strong) NSString * symptomIds;

/*!
 @var symptomToday
 @abstract Generated model property: symptom_today.
 */
@property (nonatomic, strong) NSNumber * symptomToday;

/*!
 @var weight
 @abstract Generated model property: weight.
 */
@property (nonatomic, strong) NSNumber * weight;

/*!
 @var patientJournalSymptoms
 @abstract Generated property for has-many relationship to patientJournalSymptoms.
 */
@property (nonatomic, strong) NSOrderedSet * patientJournalSymptoms;
/*!
 @var patientJournalQuestionnaires
 @abstract Generated property for has-many relationship to patientJournalQuestionnaires.
 */
@property (nonatomic, strong) NSOrderedSet * patientJournalQuestionnaires;
/*!
 @var ability
 @abstract Generated property for belongs-to relationship to ability.
 */
@property (nonatomic, strong) Ability * ability;
/*!
 @var mood
 @abstract Generated property for belongs-to relationship to mood.
 */
@property (nonatomic, strong) Mood * mood;
@end
