//
//  PatientMedicalCondition.h
//  AnyPresence SDK
//

/*!
 @header PatientMedicalCondition
 @abstract PatientMedicalCondition class
 */

#import "APObject.h"
#import "Typedefs.h"

@class MedicalCondition;

/*!
 @class PatientMedicalCondition
 @abstract Generated model object: PatientMedicalCondition.
 @discussion Use @link //apple_ref/occ/cat/PatientMedicalCondition(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientMedicalCondition/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientMedicalCondition : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientMedicalCondition.
 @result Class representing the data source associated with a PatientMedicalCondition.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var medicalConditionDenormalized
 @abstract Generated model property: medical_condition_denormalized.
 */
@property (nonatomic, strong) NSString * medicalConditionDenormalized;

/*!
 @var medicalConditionId
 @abstract Generated model property: medical_condition_id.
 */
@property (nonatomic, strong) NSNumber * medicalConditionId;

/*!
 @var medicalConditionIds
 @abstract Generated model property: medical_condition_ids.
 */
@property (nonatomic, strong) NSString * medicalConditionIds;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var medicalCondition
 @abstract Generated property for belongs-to relationship to medicalCondition.
 */
@property (nonatomic, strong) MedicalCondition * medicalCondition;
@end
