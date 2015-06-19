//
//  MedicalCondition.h
//  AnyPresence SDK
//

/*!
 @header MedicalCondition
 @abstract MedicalCondition class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class MedicalCondition
 @abstract Generated model object: MedicalCondition.
 @discussion Use @link //apple_ref/occ/cat/MedicalCondition(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/MedicalCondition/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface MedicalCondition : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a MedicalCondition.
 @result Class representing the data source associated with a MedicalCondition.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var inactive
 @abstract Generated model property: inactive.
 */
@property (nonatomic, strong) NSNumber * inactive;

/*!
 @var name
 @abstract Generated model property: name.
 */
@property (nonatomic, strong) NSString * name;

/*!
 @var patientMedicalConditions
 @abstract Generated property for has-many relationship to patientMedicalConditions.
 */
@property (nonatomic, strong) NSOrderedSet * patientMedicalConditions;
@end
