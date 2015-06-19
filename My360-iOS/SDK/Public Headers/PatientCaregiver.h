//
//  PatientCaregiver.h
//  AnyPresence SDK
//

/*!
 @header PatientCaregiver
 @abstract PatientCaregiver class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Patient;

/*!
 @class PatientCaregiver
 @abstract Generated model object: PatientCaregiver.
 @discussion Use @link //apple_ref/occ/cat/PatientCaregiver(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientCaregiver/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientCaregiver : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientCaregiver.
 @result Class representing the data source associated with a PatientCaregiver.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var email
 @abstract Generated model property: email.
 */
@property (nonatomic, strong) NSString * email;

/*!
 @var emailNotifications
 @abstract Generated model property: email_notifications.
 */
@property (nonatomic, strong) NSNumber * emailNotifications;

/*!
 @var name
 @abstract Generated model property: name.
 */
@property (nonatomic, strong) NSString * name;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var phone
 @abstract Generated model property: phone.
 */
@property (nonatomic, strong) NSString * phone;

/*!
 @var smsNotifications
 @abstract Generated model property: sms_notifications.
 */
@property (nonatomic, strong) NSNumber * smsNotifications;

/*!
 @var patient
 @abstract Generated property for belongs-to relationship to patient.
 */
@property (nonatomic, strong) Patient * patient;
@end
