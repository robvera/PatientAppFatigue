//
//  PatientApp.h
//  AnyPresence SDK
//

/*!
 @header PatientApp
 @abstract PatientApp class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Patient;

/*!
 @class PatientApp
 @abstract Generated model object: PatientApp.
 @discussion Use @link //apple_ref/occ/cat/PatientApp(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientApp/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientApp : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientApp.
 @result Class representing the data source associated with a PatientApp.
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
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var patient
 @abstract Generated property for belongs-to relationship to patient.
 */
@property (nonatomic, strong) Patient * patient;
@end
