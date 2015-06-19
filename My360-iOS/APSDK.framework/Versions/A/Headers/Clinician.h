//
//  Clinician.h
//  AnyPresence SDK
//

/*!
 @header Clinician
 @abstract Clinician class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Clinician
 @abstract Generated model object: Clinician.
 @discussion Use @link //apple_ref/occ/cat/Clinician(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Clinician/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Clinician : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Clinician.
 @result Class representing the data source associated with a Clinician.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var clinicianType
 @abstract Generated model property: clinician_type.
 */
@property (nonatomic, strong) NSString * clinicianType;

/*!
 @var couponCode
 @abstract Generated model property: coupon_code.
 */
@property (nonatomic, strong) NSString * couponCode;

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
 @var lastName
 @abstract Generated model property: last_name.
 */
@property (nonatomic, strong) NSString * lastName;

/*!
 @var patientClinicians
 @abstract Generated property for has-many relationship to patientClinicians.
 */
@property (nonatomic, strong) NSOrderedSet * patientClinicians;
/*!
 @var educationalReadings
 @abstract Generated property for has-many relationship to educationalReadings.
 */
@property (nonatomic, strong) NSOrderedSet * educationalReadings;
@end
