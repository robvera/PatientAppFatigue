//
//  PatientSideEffectMedication.h
//  AnyPresence SDK
//

/*!
 @header PatientSideEffectMedication
 @abstract PatientSideEffectMedication class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Medication;

@class PatientSideEffect;

/*!
 @class PatientSideEffectMedication
 @abstract Generated model object: PatientSideEffectMedication.
 @discussion Use @link //apple_ref/occ/cat/PatientSideEffectMedication(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientSideEffectMedication/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientSideEffectMedication : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientSideEffectMedication.
 @result Class representing the data source associated with a PatientSideEffectMedication.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var medicationId
 @abstract Generated model property: medication_id.
 */
@property (nonatomic, strong) NSNumber * medicationId;

/*!
 @var patientSideEffectId
 @abstract Generated model property: patient_side_effect_id.
 */
@property (nonatomic, strong) NSNumber * patientSideEffectId;

/*!
 @var medication
 @abstract Generated property for belongs-to relationship to medication.
 */
@property (nonatomic, strong) Medication * medication;
/*!
 @var patientSideEffect
 @abstract Generated property for belongs-to relationship to patientSideEffect.
 */
@property (nonatomic, strong) PatientSideEffect * patientSideEffect;
@end
