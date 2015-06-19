//
//  PatientSideEffect.h
//  AnyPresence SDK
//

/*!
 @header PatientSideEffect
 @abstract PatientSideEffect class
 */

#import "APObject.h"
#import "Typedefs.h"

@class SideEffect;

/*!
 @class PatientSideEffect
 @abstract Generated model object: PatientSideEffect.
 @discussion Use @link //apple_ref/occ/cat/PatientSideEffect(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientSideEffect/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientSideEffect : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientSideEffect.
 @result Class representing the data source associated with a PatientSideEffect.
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
 @var medicationIds
 @abstract Generated model property: medication_ids.
 */
@property (nonatomic, strong) NSString * medicationIds;

/*!
 @var medicationUnsure
 @abstract Generated model property: medication_unsure.
 */
@property (nonatomic, strong) NSString * medicationUnsure;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var sideEffectDenormalized
 @abstract Generated model property: side_effect_denormalized.
 */
@property (nonatomic, strong) NSString * sideEffectDenormalized;

/*!
 @var sideEffectId
 @abstract Generated model property: side_effect_id.
 */
@property (nonatomic, strong) NSNumber * sideEffectId;

/*!
 @var sideEffectOn
 @abstract Generated model property: side_effect_on.
 */
@property (nonatomic, strong) NSDate * sideEffectOn;

/*!
 @var patientSideEffectMedications
 @abstract Generated property for has-many relationship to patientSideEffectMedications.
 */
@property (nonatomic, strong) NSOrderedSet * patientSideEffectMedications;
/*!
 @var sideEffect
 @abstract Generated property for belongs-to relationship to sideEffect.
 */
@property (nonatomic, strong) SideEffect * sideEffect;
@end
