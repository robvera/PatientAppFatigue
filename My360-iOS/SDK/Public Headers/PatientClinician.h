//
//  PatientClinician.h
//  AnyPresence SDK
//

/*!
 @header PatientClinician
 @abstract PatientClinician class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Clinician;

@class Patient;

/*!
 @class PatientClinician
 @abstract Generated model object: PatientClinician.
 @discussion Use @link //apple_ref/occ/cat/PatientClinician(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientClinician/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientClinician : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientClinician.
 @result Class representing the data source associated with a PatientClinician.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var approved
 @abstract Generated model property: approved.
 */
@property (nonatomic, strong) NSNumber * approved;

/*!
 @var approvedAt
 @abstract Generated model property: approved_at.
 */
@property (nonatomic, strong) NSDate * approvedAt;

/*!
 @var canClinicianRead
 @abstract Generated model property: can_clinician_read.
 */
@property (nonatomic, strong) NSNumber * canClinicianRead;

/*!
 @var clinicianId
 @abstract Generated model property: clinician_id.
 */
@property (nonatomic, strong) NSNumber * clinicianId;

/*!
 @var clinicianNameDenormalized
 @abstract Generated model property: clinician_name_denormalized.
 */
@property (nonatomic, strong) NSString * clinicianNameDenormalized;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var requestedAt
 @abstract Generated model property: requested_at.
 */
@property (nonatomic, strong) NSDate * requestedAt;

/*!
 @var clinician
 @abstract Generated property for belongs-to relationship to clinician.
 */
@property (nonatomic, strong) Clinician * clinician;
/*!
 @var patient
 @abstract Generated property for belongs-to relationship to patient.
 */
@property (nonatomic, strong) Patient * patient;
@end
