//
//  ReminderType.h
//  AnyPresence SDK
//

/*!
 @header ReminderType
 @abstract ReminderType class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class ReminderType
 @abstract Generated model object: ReminderType.
 @discussion Use @link //apple_ref/occ/cat/ReminderType(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/ReminderType/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface ReminderType : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a ReminderType.
 @result Class representing the data source associated with a ReminderType.
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
 @var patientReminders
 @abstract Generated property for has-many relationship to patientReminders.
 */
@property (nonatomic, strong) NSOrderedSet * patientReminders;
@end
