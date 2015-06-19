//
//  PatientReminder.h
//  AnyPresence SDK
//

/*!
 @header PatientReminder
 @abstract PatientReminder class
 */

#import "APObject.h"
#import "Typedefs.h"

@class ReminderType;

/*!
 @class PatientReminder
 @abstract Generated model object: PatientReminder.
 @discussion Use @link //apple_ref/occ/cat/PatientReminder(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientReminder/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientReminder : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientReminder.
 @result Class representing the data source associated with a PatientReminder.
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
 @var reminderMessage
 @abstract Generated model property: reminder_message.
 */
@property (nonatomic, strong) NSString * reminderMessage;

/*!
 @var reminderOn
 @abstract Generated model property: reminder_on.
 */
@property (nonatomic, strong) NSDate * reminderOn;

/*!
 @var reminderTypeDenormalized
 @abstract Generated model property: reminder_type_denormalized.
 */
@property (nonatomic, strong) NSString * reminderTypeDenormalized;

/*!
 @var reminderTypeId
 @abstract Generated model property: reminder_type_id.
 */
@property (nonatomic, strong) NSNumber * reminderTypeId;

/*!
 @var unread
 @abstract Generated model property: unread.
 */
@property (nonatomic, strong) NSNumber * unread;

/*!
 @var reminderType
 @abstract Generated property for belongs-to relationship to reminderType.
 */
@property (nonatomic, strong) ReminderType * reminderType;
@end
