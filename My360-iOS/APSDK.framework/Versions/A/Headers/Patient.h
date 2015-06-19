//
//  Patient.h
//  AnyPresence SDK
//

/*!
 @header Patient
 @abstract Patient class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Patient
 @abstract Generated model object: Patient.
 @discussion Use @link //apple_ref/occ/cat/Patient(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Patient/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Patient : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Patient.
 @result Class representing the data source associated with a Patient.
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
 @var height
 @abstract Generated model property: height.
 */
@property (nonatomic, strong) NSNumber * height;

/*!
 @var inactive
 @abstract Generated model property: inactive.
 */
@property (nonatomic, strong) NSNumber * inactive;

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
 @var patientAsthmaActionId
 @abstract Generated model property: patient_asthma_action_id.
 */
@property (nonatomic, strong) NSNumber * patientAsthmaActionId;

/*!
 @var phone
 @abstract Generated model property: phone.
 */
@property (nonatomic, strong) NSString * phone;

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
 @var weight
 @abstract Generated model property: weight.
 */
@property (nonatomic, strong) NSNumber * weight;

/*!
 @var zipcode
 @abstract Generated model property: zipcode.
 */
@property (nonatomic, strong) NSString * zipcode;

/*!
 @var patientClinicians
 @abstract Generated property for has-many relationship to patientClinicians.
 */
@property (nonatomic, strong) NSOrderedSet * patientClinicians;
/*!
 @var patientCaregivers
 @abstract Generated property for has-many relationship to patientCaregivers.
 */
@property (nonatomic, strong) NSOrderedSet * patientCaregivers;
/*!
 @var patientAdherenceLogs
 @abstract Generated property for has-many relationship to patientAdherenceLogs.
 */
@property (nonatomic, strong) NSOrderedSet * patientAdherenceLogs;
/*!
 @var clinicianCodeRequests
 @abstract Generated property for has-many relationship to clinicianCodeRequests.
 */
@property (nonatomic, strong) NSOrderedSet * clinicianCodeRequests;
/*!
 @var patientApps
 @abstract Generated property for has-many relationship to patientApps.
 */
@property (nonatomic, strong) NSOrderedSet * patientApps;
@end
