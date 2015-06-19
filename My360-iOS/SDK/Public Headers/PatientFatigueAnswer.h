//
//  PatientFatigueAnswer.h
//  AnyPresence SDK
//

/*!
 @header PatientFatigueAnswer
 @abstract PatientFatigueAnswer class
 */

#import "APObject.h"
#import "Typedefs.h"

@class PatientFatigueResult;

/*!
 @class PatientFatigueAnswer
 @abstract Generated model object: PatientFatigueAnswer.
 @discussion Use @link //apple_ref/occ/cat/PatientFatigueAnswer(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientFatigueAnswer/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientFatigueAnswer : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientFatigueAnswer.
 @result Class representing the data source associated with a PatientFatigueAnswer.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var answer
 @abstract Generated model property: answer.
 */
@property (nonatomic, strong) NSNumber * answer;

/*!
 @var patientFatigueResultId
 @abstract Generated model property: patient_fatigue_result_id.
 */
@property (nonatomic, strong) NSNumber * patientFatigueResultId;

/*!
 @var question
 @abstract Generated model property: question.
 */
@property (nonatomic, strong) NSString * question;

/*!
 @var sortId
 @abstract Generated model property: sort_id.
 */
@property (nonatomic, strong) NSNumber * sortId;

/*!
 @var patientFatigueResult
 @abstract Generated property for belongs-to relationship to patientFatigueResult.
 */
@property (nonatomic, strong) PatientFatigueResult * patientFatigueResult;
@end
