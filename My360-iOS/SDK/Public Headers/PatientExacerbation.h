//
//  PatientExacerbation.h
//  AnyPresence SDK
//

/*!
 @header PatientExacerbation
 @abstract PatientExacerbation class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Symptom;

/*!
 @class PatientExacerbation
 @abstract Generated model object: PatientExacerbation.
 @discussion Use @link //apple_ref/occ/cat/PatientExacerbation(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientExacerbation/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientExacerbation : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientExacerbation.
 @result Class representing the data source associated with a PatientExacerbation.
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
 @var concurrentInfection
 @abstract Generated model property: concurrent_infection.
 */
@property (nonatomic, strong) NSNumber * concurrentInfection;

/*!
 @var endOn
 @abstract Generated model property: end_on.
 */
@property (nonatomic, strong) NSDate * endOn;

/*!
 @var fatigability
 @abstract Generated model property: fatigability.
 */
@property (nonatomic, strong) NSNumber * fatigability;

/*!
 @var heatExposure
 @abstract Generated model property: heat_exposure.
 */
@property (nonatomic, strong) NSNumber * heatExposure;

/*!
 @var intensity
 @abstract Generated model property: intensity.
 */
@property (nonatomic, strong) NSNumber * intensity;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var startOn
 @abstract Generated model property: start_on.
 */
@property (nonatomic, strong) NSDate * startOn;

/*!
 @var stress
 @abstract Generated model property: stress.
 */
@property (nonatomic, strong) NSNumber * stress;

/*!
 @var symptomDenormalized
 @abstract Generated model property: symptom_denormalized.
 */
@property (nonatomic, strong) NSString * symptomDenormalized;

/*!
 @var symptomId
 @abstract Generated model property: symptom_id.
 */
@property (nonatomic, strong) NSNumber * symptomId;

/*!
 @var symptom
 @abstract Generated property for belongs-to relationship to symptom.
 */
@property (nonatomic, strong) Symptom * symptom;
@end
