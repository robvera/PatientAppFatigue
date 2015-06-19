//
//  PatientAsthmaActionMedication.h
//  AnyPresence SDK
//

/*!
 @header PatientAsthmaActionMedication
 @abstract PatientAsthmaActionMedication class
 */

#import "APObject.h"
#import "Typedefs.h"

@class PatientAsthma;

/*!
 @class PatientAsthmaActionMedication
 @abstract Generated model object: PatientAsthmaActionMedication.
 @discussion Use @link //apple_ref/occ/cat/PatientAsthmaActionMedication(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientAsthmaActionMedication/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientAsthmaActionMedication : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientAsthmaActionMedication.
 @result Class representing the data source associated with a PatientAsthmaActionMedication.
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
 @var dose
 @abstract Generated model property: dose.
 */
@property (nonatomic, strong) NSString * dose;

/*!
 @var frequency
 @abstract Generated model property: frequency.
 */
@property (nonatomic, strong) NSString * frequency;

/*!
 @var medication
 @abstract Generated model property: medication.
 */
@property (nonatomic, strong) NSString * medication;

/*!
 @var medicationType
 @abstract Generated model property: medication_type.
 */
@property (nonatomic, strong) NSString * medicationType;

/*!
 @var patientAsthmaActionIdSeq
 @abstract Generated model property: patient_asthma_action_id_seq.
 */
@property (nonatomic, strong) NSNumber * patientAsthmaActionIdSeq;

/*!
 @var patientAsthmaId
 @abstract Generated model property: patient_asthma_id.
 */
@property (nonatomic, strong) NSNumber * patientAsthmaId;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var postedDate
 @abstract Generated model property: posted_date.
 */
@property (nonatomic, strong) NSDate * postedDate;

/*!
 @var patientAsthma
 @abstract Generated property for belongs-to relationship to patientAsthma.
 */
@property (nonatomic, strong) PatientAsthma * patientAsthma;
@end
