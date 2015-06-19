//
//  PatientTreatment.h
//  AnyPresence SDK
//

/*!
 @header PatientTreatment
 @abstract PatientTreatment class
 */

#import "APObject.h"
#import "Typedefs.h"

@class DosageUom;

@class IngestionMethod;

@class Medication;

@class TreatmentSchedule;

@class TreatmentType;

/*!
 @class PatientTreatment
 @abstract Generated model object: PatientTreatment.
 @discussion Use @link //apple_ref/occ/cat/PatientTreatment(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientTreatment/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientTreatment : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientTreatment.
 @result Class representing the data source associated with a PatientTreatment.
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
 @var currentScheduleOn
 @abstract Generated model property: current_schedule_on.
 */
@property (nonatomic, strong) NSDate * currentScheduleOn;

/*!
 @var dosage
 @abstract Generated model property: dosage.
 */
@property (nonatomic, strong) NSNumber * dosage;

/*!
 @var dosageUomDenormalized
 @abstract Generated model property: dosage_uom_denormalized.
 */
@property (nonatomic, strong) NSString * dosageUomDenormalized;

/*!
 @var dosageUomId
 @abstract Generated model property: dosage_uom_id.
 */
@property (nonatomic, strong) NSNumber * dosageUomId;

/*!
 @var endOn
 @abstract Generated model property: end_on.
 */
@property (nonatomic, strong) NSDate * endOn;

/*!
 @var ingestionMethodDenormalized
 @abstract Generated model property: ingestion_method_denormalized.
 */
@property (nonatomic, strong) NSString * ingestionMethodDenormalized;

/*!
 @var ingestionMethodId
 @abstract Generated model property: ingestion_method_id.
 */
@property (nonatomic, strong) NSNumber * ingestionMethodId;

/*!
 @var medicationDenormalized
 @abstract Generated model property: medication_denormalized.
 */
@property (nonatomic, strong) NSString * medicationDenormalized;

/*!
 @var medicationId
 @abstract Generated model property: medication_id.
 */
@property (nonatomic, strong) NSNumber * medicationId;

/*!
 @var nextScheduleOn
 @abstract Generated model property: next_schedule_on.
 */
@property (nonatomic, strong) NSDate * nextScheduleOn;

/*!
 @var numberHrsPerDay
 @abstract Generated model property: number_hrs_per_day.
 */
@property (nonatomic, strong) NSNumber * numberHrsPerDay;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var startOn
 @abstract Generated model property: start_on.
 */
@property (nonatomic, strong) NSDate * startOn;

/*!
 @var timeOfUse
 @abstract Generated model property: time_of_use.
 */
@property (nonatomic, strong) NSString * timeOfUse;

/*!
 @var treatmentScheduleDenormalized
 @abstract Generated model property: treatment_schedule_denormalized.
 */
@property (nonatomic, strong) NSString * treatmentScheduleDenormalized;

/*!
 @var treatmentScheduleId
 @abstract Generated model property: treatment_schedule_id.
 */
@property (nonatomic, strong) NSNumber * treatmentScheduleId;

/*!
 @var treatmentTypeDenormalized
 @abstract Generated model property: treatment_type_denormalized.
 */
@property (nonatomic, strong) NSString * treatmentTypeDenormalized;

/*!
 @var treatmentTypeId
 @abstract Generated model property: treatment_type_id.
 */
@property (nonatomic, strong) NSNumber * treatmentTypeId;

/*!
 @var patientAdherenceLogs
 @abstract Generated property for has-many relationship to patientAdherenceLogs.
 */
@property (nonatomic, strong) NSOrderedSet * patientAdherenceLogs;
/*!
 @var dosageUom
 @abstract Generated property for belongs-to relationship to dosageUom.
 */
@property (nonatomic, strong) DosageUom * dosageUom;
/*!
 @var ingestionMethod
 @abstract Generated property for belongs-to relationship to ingestionMethod.
 */
@property (nonatomic, strong) IngestionMethod * ingestionMethod;
/*!
 @var medication
 @abstract Generated property for belongs-to relationship to medication.
 */
@property (nonatomic, strong) Medication * medication;
/*!
 @var treatmentSchedule
 @abstract Generated property for belongs-to relationship to treatmentSchedule.
 */
@property (nonatomic, strong) TreatmentSchedule * treatmentSchedule;
/*!
 @var treatmentType
 @abstract Generated property for belongs-to relationship to treatmentType.
 */
@property (nonatomic, strong) TreatmentType * treatmentType;
@end
