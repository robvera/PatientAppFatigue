//
//  Medication.h
//  AnyPresence SDK
//

/*!
 @header Medication
 @abstract Medication class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Medication
 @abstract Generated model object: Medication.
 @discussion Use @link //apple_ref/occ/cat/Medication(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Medication/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Medication : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Medication.
 @result Class representing the data source associated with a Medication.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var appId
 @abstract Generated model property: app_id.
 */
@property (nonatomic, strong) NSNumber * appId;

/*!
 @var defaultDosage
 @abstract Generated model property: default_dosage.
 */
@property (nonatomic, strong) NSNumber * defaultDosage;

/*!
 @var defaultDosageUomId
 @abstract Generated model property: default_dosage_uom_id.
 */
@property (nonatomic, strong) NSNumber * defaultDosageUomId;

/*!
 @var defaultIngestionMethodId
 @abstract Generated model property: default_ingestion_method_id.
 */
@property (nonatomic, strong) NSNumber * defaultIngestionMethodId;

/*!
 @var defaultTreatmentScheduleId
 @abstract Generated model property: default_treatment_schedule_id.
 */
@property (nonatomic, strong) NSNumber * defaultTreatmentScheduleId;

/*!
 @var inactive
 @abstract Generated model property: inactive.
 */
@property (nonatomic, strong) NSNumber * inactive;

/*!
 @var medicationCat
 @abstract Generated model property: medication_cat.
 */
@property (nonatomic, strong) NSString * medicationCat;

/*!
 @var name
 @abstract Generated model property: name.
 */
@property (nonatomic, strong) NSString * name;

/*!
 @var subCategory
 @abstract Generated model property: sub_category.
 */
@property (nonatomic, strong) NSString * subCategory;

/*!
 @var patientTreatments
 @abstract Generated property for has-many relationship to patientTreatments.
 */
@property (nonatomic, strong) NSOrderedSet * patientTreatments;
/*!
 @var patientSideEffectMedications
 @abstract Generated property for has-many relationship to patientSideEffectMedications.
 */
@property (nonatomic, strong) NSOrderedSet * patientSideEffectMedications;
@end
