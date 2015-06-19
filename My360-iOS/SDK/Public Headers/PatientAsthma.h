//
//  PatientAsthma.h
//  AnyPresence SDK
//

/*!
 @header PatientAsthma
 @abstract PatientAsthma class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class PatientAsthma
 @abstract Generated model object: PatientAsthma.
 @discussion Use @link //apple_ref/occ/cat/PatientAsthma(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientAsthma/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientAsthma : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientAsthma.
 @result Class representing the data source associated with a PatientAsthma.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var appId
 @abstract Generated model property: app_id.
 */
@property (nonatomic, strong) NSNumber * appId;

/*!
 @var assistwithmedication
 @abstract Generated model property: assistwithmedication.
 */
@property (nonatomic, strong) NSNumber * assistwithmedication;

/*!
 @var asthmaActionDate
 @abstract Generated model property: asthma_action_date.
 */
@property (nonatomic, strong) NSDate * asthmaActionDate;

/*!
 @var asthmaSeverity
 @abstract Generated model property: asthma_severity.
 */
@property (nonatomic, strong) NSNumber * asthmaSeverity;

/*!
 @var carrymedication
 @abstract Generated model property: carrymedication.
 */
@property (nonatomic, strong) NSNumber * carrymedication;

/*!
 @var instructionsAwfulCall
 @abstract Generated model property: instructions_awful_call.
 */
@property (nonatomic, strong) NSString * instructionsAwfulCall;

/*!
 @var instructionsAwfulMedicationOne
 @abstract Generated model property: instructions_awful_medication_one.
 */
@property (nonatomic, strong) NSString * instructionsAwfulMedicationOne;

/*!
 @var instructionsAwfulMedicationTwo
 @abstract Generated model property: instructions_awful_medication_two.
 */
@property (nonatomic, strong) NSString * instructionsAwfulMedicationTwo;

/*!
 @var instructionsFeelGoodDose
 @abstract Generated model property: instructions_feel_good_dose.
 */
@property (nonatomic, strong) NSString * instructionsFeelGoodDose;

/*!
 @var instructionsFeelGoodMedication
 @abstract Generated model property: instructions_feel_good_medication.
 */
@property (nonatomic, strong) NSString * instructionsFeelGoodMedication;

/*!
 @var instructionsFeelGoodTrigger
 @abstract Generated model property: instructions_feel_good_trigger.
 */
@property (nonatomic, strong) NSString * instructionsFeelGoodTrigger;

/*!
 @var instructionsNotFeelGoodMedication
 @abstract Generated model property: instructions_not_feel_good_medication.
 */
@property (nonatomic, strong) NSString * instructionsNotFeelGoodMedication;

/*!
 @var instructionsNotFeelGoodSymptom
 @abstract Generated model property: instructions_not_feel_good_symptom.
 */
@property (nonatomic, strong) NSString * instructionsNotFeelGoodSymptom;

/*!
 @var longTermDose
 @abstract Generated model property: long_term_dose.
 */
@property (nonatomic, strong) NSString * longTermDose;

/*!
 @var longTermFrequency
 @abstract Generated model property: long_term_frequency.
 */
@property (nonatomic, strong) NSString * longTermFrequency;

/*!
 @var longTermMedication
 @abstract Generated model property: long_term_medication.
 */
@property (nonatomic, strong) NSString * longTermMedication;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var peakFlowPersonalBest
 @abstract Generated model property: peak_flow_personal_best.
 */
@property (nonatomic, strong) NSNumber * peakFlowPersonalBest;

/*!
 @var peDose
 @abstract Generated model property: pe_dose.
 */
@property (nonatomic, strong) NSString * peDose;

/*!
 @var peFrequency
 @abstract Generated model property: pe_frequency.
 */
@property (nonatomic, strong) NSString * peFrequency;

/*!
 @var peMedication
 @abstract Generated model property: pe_medication.
 */
@property (nonatomic, strong) NSString * peMedication;

/*!
 @var postedDate
 @abstract Generated model property: posted_date.
 */
@property (nonatomic, strong) NSDate * postedDate;

/*!
 @var quickDose
 @abstract Generated model property: quick_dose.
 */
@property (nonatomic, strong) NSString * quickDose;

/*!
 @var quickFrequency
 @abstract Generated model property: quick_frequency.
 */
@property (nonatomic, strong) NSString * quickFrequency;

/*!
 @var quickMedication
 @abstract Generated model property: quick_medication.
 */
@property (nonatomic, strong) NSString * quickMedication;

/*!
 @var reminderToTakeMedicine
 @abstract Generated model property: reminder_to_take_medicine.
 */
@property (nonatomic, strong) NSNumber * reminderToTakeMedicine;

/*!
 @var triggerAnimals
 @abstract Generated model property: trigger_animals.
 */
@property (nonatomic, strong) NSNumber * triggerAnimals;

/*!
 @var triggerBirds
 @abstract Generated model property: trigger_birds.
 */
@property (nonatomic, strong) NSNumber * triggerBirds;

/*!
 @var triggerCarExhaust
 @abstract Generated model property: trigger_car_exhaust.
 */
@property (nonatomic, strong) NSNumber * triggerCarExhaust;

/*!
 @var triggerCleansers
 @abstract Generated model property: trigger_cleansers.
 */
@property (nonatomic, strong) NSNumber * triggerCleansers;

/*!
 @var triggerCockroach
 @abstract Generated model property: trigger_cockroach.
 */
@property (nonatomic, strong) NSNumber * triggerCockroach;

/*!
 @var triggerColdair
 @abstract Generated model property: trigger_coldair.
 */
@property (nonatomic, strong) NSNumber * triggerColdair;

/*!
 @var triggerDust
 @abstract Generated model property: trigger_dust.
 */
@property (nonatomic, strong) NSNumber * triggerDust;

/*!
 @var triggerExcercise
 @abstract Generated model property: trigger_excercise.
 */
@property (nonatomic, strong) NSNumber * triggerExcercise;

/*!
 @var triggerMold
 @abstract Generated model property: trigger_mold.
 */
@property (nonatomic, strong) NSNumber * triggerMold;

/*!
 @var triggerOther
 @abstract Generated model property: trigger_other.
 */
@property (nonatomic, strong) NSString * triggerOther;

/*!
 @var triggerPerfume
 @abstract Generated model property: trigger_perfume.
 */
@property (nonatomic, strong) NSNumber * triggerPerfume;

/*!
 @var triggerPesticide
 @abstract Generated model property: trigger_pesticide.
 */
@property (nonatomic, strong) NSNumber * triggerPesticide;

/*!
 @var triggerTobacco
 @abstract Generated model property: trigger_tobacco.
 */
@property (nonatomic, strong) NSNumber * triggerTobacco;

/*!
 @var patientAsthmaActionMedications
 @abstract Generated property for has-many relationship to patientAsthmaActionMedications.
 */
@property (nonatomic, strong) NSOrderedSet * patientAsthmaActionMedications;
@end
