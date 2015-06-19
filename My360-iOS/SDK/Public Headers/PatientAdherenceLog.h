//
//  PatientAdherenceLog.h
//  AnyPresence SDK
//

/*!
 @header PatientAdherenceLog
 @abstract PatientAdherenceLog class
 */

#import "APObject.h"
#import "Typedefs.h"

@class MissingTreatmentReason;

@class Patient;

@class PatientTreatment;

/*!
 @class PatientAdherenceLog
 @abstract Generated model object: PatientAdherenceLog.
 @discussion Use @link //apple_ref/occ/cat/PatientAdherenceLog(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientAdherenceLog/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientAdherenceLog : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientAdherenceLog.
 @result Class representing the data source associated with a PatientAdherenceLog.
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
 @var archived
 @abstract Generated model property: archived.
 */
@property (nonatomic, strong) NSNumber * archived;

/*!
 @var logOn
 @abstract Generated model property: log_on.
 */
@property (nonatomic, strong) NSDate * logOn;

/*!
 @var medicationDenormalized
 @abstract Generated model property: medication_denormalized.
 */
@property (nonatomic, strong) NSString * medicationDenormalized;

/*!
 @var missingTreatmentReasonDenormalized
 @abstract Generated model property: missing_treatment_reason_denormalized.
 */
@property (nonatomic, strong) NSString * missingTreatmentReasonDenormalized;

/*!
 @var missingTreatmentReasonId
 @abstract Generated model property: missing_treatment_reason_id.
 */
@property (nonatomic, strong) NSNumber * missingTreatmentReasonId;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var patientTreatmentId
 @abstract Generated model property: patient_treatment_id.
 */
@property (nonatomic, strong) NSNumber * patientTreatmentId;

/*!
 @var timesMissedPerDay
 @abstract Generated model property: times_missed_per_day.
 */
@property (nonatomic, strong) NSNumber * timesMissedPerDay;

/*!
 @var tookMedication
 @abstract Generated model property: took_medication.
 */
@property (nonatomic, strong) NSNumber * tookMedication;

/*!
 @var treatmentScheduleDenormalized
 @abstract Generated model property: treatment_schedule_denormalized.
 */
@property (nonatomic, strong) NSNumber * treatmentScheduleDenormalized;

/*!
 @var treatmentTypeDenormalized
 @abstract Generated model property: treatment_type_denormalized.
 */
@property (nonatomic, strong) NSString * treatmentTypeDenormalized;

/*!
 @var missingTreatmentReason
 @abstract Generated property for belongs-to relationship to missingTreatmentReason.
 */
@property (nonatomic, strong) MissingTreatmentReason * missingTreatmentReason;
/*!
 @var patient
 @abstract Generated property for belongs-to relationship to patient.
 */
@property (nonatomic, strong) Patient * patient;
/*!
 @var patientTreatment
 @abstract Generated property for belongs-to relationship to patientTreatment.
 */
@property (nonatomic, strong) PatientTreatment * patientTreatment;
@end
