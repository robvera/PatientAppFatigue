//
//  UserProfile.h
//  AnyPresence SDK
//

/*!
 @header UserProfile
 @abstract UserProfile class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class UserProfile
 @abstract Generated model object: UserProfile.
 @discussion Use @link //apple_ref/occ/cat/UserProfile(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/UserProfile/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface UserProfile : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a UserProfile.
 @result Class representing the data source associated with a UserProfile.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var allergiesSet
 @abstract Generated model property: allergies_set.
 */
@property (nonatomic, strong) NSNumber * allergiesSet;

/*!
 @var city
 @abstract Generated model property: city.
 */
@property (nonatomic, strong) NSString * city;

/*!
 @var dob
 @abstract Generated model property: dob.
 */
@property (nonatomic, strong) NSDate * dob;

/*!
 @var educationalReadingsAlter
 @abstract Generated model property: educational_readings_alter.
 */
@property (nonatomic, strong) NSNumber * educationalReadingsAlter;

/*!
 @var email
 @abstract Generated model property: email.
 */
@property (nonatomic, strong) NSString * email;

/*!
 @var firstName
 @abstract Generated model property: first_name.
 */
@property (nonatomic, strong) NSString * firstName;

/*!
 @var foodAllergies
 @abstract Generated model property: food_allergies.
 */
@property (nonatomic, strong) NSNumber * foodAllergies;

/*!
 @var gender
 @abstract Generated model property: gender.
 */
@property (nonatomic, strong) NSString * gender;

/*!
 @var goalCholesterol
 @abstract Generated model property: goal_cholesterol.
 */
@property (nonatomic, strong) NSNumber * goalCholesterol;

/*!
 @var goalHbaonec
 @abstract Generated model property: goal_hbaonec.
 */
@property (nonatomic, strong) NSNumber * goalHbaonec;

/*!
 @var goalWeight
 @abstract Generated model property: goal_weight.
 */
@property (nonatomic, strong) NSNumber * goalWeight;

/*!
 @var height
 @abstract Generated model property: height.
 */
@property (nonatomic, strong) NSNumber * height;

/*!
 @var labApptReminderAlert
 @abstract Generated model property: lab_appt_reminder_alert.
 */
@property (nonatomic, strong) NSNumber * labApptReminderAlert;

/*!
 @var lastLoginAlert
 @abstract Generated model property: last_login_alert.
 */
@property (nonatomic, strong) NSNumber * lastLoginAlert;

/*!
 @var lastLoginTimestamp
 @abstract Generated model property: last_login_timestamp.
 */
@property (nonatomic, strong) NSDate * lastLoginTimestamp;

/*!
 @var lastName
 @abstract Generated model property: last_name.
 */
@property (nonatomic, strong) NSString * lastName;

/*!
 @var logInCounter
 @abstract Generated model property: log_in_counter.
 */
@property (nonatomic, strong) NSNumber * logInCounter;

/*!
 @var medicationAllergies
 @abstract Generated model property: medication_allergies.
 */
@property (nonatomic, strong) NSNumber * medicationAllergies;

/*!
 @var password
 @abstract Generated model property: password.
 */
@property (nonatomic, strong) NSString * password;

/*!
 @var passwordConfirmation
 @abstract Generated model property: password_confirmation.
 */
@property (nonatomic, strong) NSString * passwordConfirmation;

/*!
 @var passwordDigest
 @abstract Generated model property: password_digest.
 */
@property (nonatomic, strong) NSString * passwordDigest;

/*!
 @var resetPassword
 @abstract Generated model property: reset_password.
 */
@property (nonatomic, strong) NSNumber * resetPassword;

/*!
 @var role
 @abstract Generated model property: role.
 */
@property (nonatomic, strong) NSString * role;

/*!
 @var seasonalAllergies
 @abstract Generated model property: seasonal_allergies.
 */
@property (nonatomic, strong) NSNumber * seasonalAllergies;

/*!
 @var state
 @abstract Generated model property: state.
 */
@property (nonatomic, strong) NSString * state;

/*!
 @var treatmentScheduleAlert
 @abstract Generated model property: treatment_schedule_alert.
 */
@property (nonatomic, strong) NSNumber * treatmentScheduleAlert;

/*!
 @var weight
 @abstract Generated model property: weight.
 */
@property (nonatomic, strong) NSNumber * weight;

/*!
 @var zipcode
 @abstract Generated model property: zipcode.
 */
@property (nonatomic, strong) NSString * zipcode;

@end
