//
//  PatientFatigueResult.h
//  AnyPresence SDK
//

/*!
 @header PatientFatigueResult
 @abstract PatientFatigueResult class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class PatientFatigueResult
 @abstract Generated model object: PatientFatigueResult.
 @discussion Use @link //apple_ref/occ/cat/PatientFatigueResult(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientFatigueResult/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientFatigueResult : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientFatigueResult.
 @result Class representing the data source associated with a PatientFatigueResult.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var archived
 @abstract Generated model property: archived.
 */
@property (nonatomic, strong) NSNumber * archived;

/*!
 @var cognitiveSubscale
 @abstract Generated model property: cognitive_subscale.
 */
@property (nonatomic, strong) NSNumber * cognitiveSubscale;

/*!
 @var completedOn
 @abstract Generated model property: completed_on.
 */
@property (nonatomic, strong) NSDate * completedOn;

/*!
 @var createdOn
 @abstract Generated model property: created_on.
 */
@property (nonatomic, strong) NSDate * createdOn;

/*!
 @var isCompleted
 @abstract Generated model property: is_completed.
 */
@property (nonatomic, strong) NSNumber * isCompleted;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var physicalSubscale
 @abstract Generated model property: physical_subscale.
 */
@property (nonatomic, strong) NSNumber * physicalSubscale;

/*!
 @var psychosocialSubscale
 @abstract Generated model property: psychosocial_subscale.
 */
@property (nonatomic, strong) NSNumber * psychosocialSubscale;

/*!
 @var totalSubscale
 @abstract Generated model property: total_subscale.
 */
@property (nonatomic, strong) NSNumber * totalSubscale;

/*!
 @var patientFatigueAnswers
 @abstract Generated property for has-many relationship to patientFatigueAnswers.
 */
//@property (nonatomic, strong) NSOrderedSet * patientFatigueAnswers;
@end
