//
//  MissingTreatmentReason.h
//  AnyPresence SDK
//

/*!
 @header MissingTreatmentReason
 @abstract MissingTreatmentReason class
 */

#import "APObject.h"
#import "Typedefs.h"

@class PatientAdherenceLog;

/*!
 @class MissingTreatmentReason
 @abstract Generated model object: MissingTreatmentReason.
 @discussion Use @link //apple_ref/occ/cat/MissingTreatmentReason(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/MissingTreatmentReason/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface MissingTreatmentReason : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a MissingTreatmentReason.
 @result Class representing the data source associated with a MissingTreatmentReason.
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
 @var patientAdherenceLog
 @abstract Generated property for has-one relationship to patientAdherenceLog.
 */
@property (nonatomic, strong) PatientAdherenceLog * patientAdherenceLog;
@end
