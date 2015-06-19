//
//  PatientLabResult.h
//  AnyPresence SDK
//

/*!
 @header PatientLabResult
 @abstract PatientLabResult class
 */

#import "APObject.h"
#import "Typedefs.h"

@class LabResultStat;

@class TestType;

/*!
 @class PatientLabResult
 @abstract Generated model object: PatientLabResult.
 @discussion Use @link //apple_ref/occ/cat/PatientLabResult(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientLabResult/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientLabResult : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientLabResult.
 @result Class representing the data source associated with a PatientLabResult.
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
 @var clinicianOffice
 @abstract Generated model property: clinician_office.
 */
@property (nonatomic, strong) NSNumber * clinicianOffice;

/*!
 @var hospital
 @abstract Generated model property: hospital.
 */
@property (nonatomic, strong) NSNumber * hospital;

/*!
 @var labResultOn
 @abstract Generated model property: lab_result_on.
 */
@property (nonatomic, strong) NSDate * labResultOn;

/*!
 @var labResultStatDenormalized
 @abstract Generated model property: lab_result_stat_denormalized.
 */
@property (nonatomic, strong) NSString * labResultStatDenormalized;

/*!
 @var labResultStatId
 @abstract Generated model property: lab_result_stat_id.
 */
@property (nonatomic, strong) NSNumber * labResultStatId;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var testTypeDenormalized
 @abstract Generated model property: test_type_denormalized.
 */
@property (nonatomic, strong) NSString * testTypeDenormalized;

/*!
 @var testTypeId
 @abstract Generated model property: test_type_id.
 */
@property (nonatomic, strong) NSNumber * testTypeId;

/*!
 @var labResultStat
 @abstract Generated property for belongs-to relationship to labResultStat.
 */
@property (nonatomic, strong) LabResultStat * labResultStat;
/*!
 @var testType
 @abstract Generated property for belongs-to relationship to testType.
 */
@property (nonatomic, strong) TestType * testType;
@end
