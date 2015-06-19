//
//  ClinicianCodeRequest.h
//  AnyPresence SDK
//

/*!
 @header ClinicianCodeRequest
 @abstract ClinicianCodeRequest class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Patient;

/*!
 @class ClinicianCodeRequest
 @abstract Generated model object: ClinicianCodeRequest.
 @discussion Use @link //apple_ref/occ/cat/ClinicianCodeRequest(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/ClinicianCodeRequest/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface ClinicianCodeRequest : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a ClinicianCodeRequest.
 @result Class representing the data source associated with a ClinicianCodeRequest.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var dateRequested
 @abstract Generated model property: date_requested.
 */
@property (nonatomic, strong) NSDate * dateRequested;

/*!
 @var emailAddress
 @abstract Generated model property: email_address.
 */
@property (nonatomic, strong) NSString * emailAddress;

/*!
 @var fax
 @abstract Generated model property: fax.
 */
@property (nonatomic, strong) NSString * fax;

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
 @var sendEmailFlag
 @abstract Generated model property: send_email_flag.
 */
@property (nonatomic, strong) NSNumber * sendEmailFlag;

/*!
 @var statusFlag
 @abstract Generated model property: status_flag.
 */
@property (nonatomic, strong) NSString * statusFlag;

/*!
 @var patient
 @abstract Generated property for belongs-to relationship to patient.
 */
@property (nonatomic, strong) Patient * patient;
@end
