//
//  PatientGlucose.h
//  AnyPresence SDK
//

/*!
 @header PatientGlucose
 @abstract PatientGlucose class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class PatientGlucose
 @abstract Generated model object: PatientGlucose.
 @discussion Use @link //apple_ref/occ/cat/PatientGlucose(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientGlucose/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientGlucose : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientGlucose.
 @result Class representing the data source associated with a PatientGlucose.
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
 @var carbohydrates
 @abstract Generated model property: carbohydrates.
 */
@property (nonatomic, strong) NSNumber * carbohydrates;

/*!
 @var glucoseLevel
 @abstract Generated model property: glucose_level.
 */
@property (nonatomic, strong) NSString * glucoseLevel;

/*!
 @var glucoseOn
 @abstract Generated model property: glucose_on.
 */
@property (nonatomic, strong) NSDate * glucoseOn;

/*!
 @var glucoseReading
 @abstract Generated model property: glucose_reading.
 */
@property (nonatomic, strong) NSNumber * glucoseReading;

/*!
 @var insulin
 @abstract Generated model property: insulin.
 */
@property (nonatomic, strong) NSNumber * insulin;

/*!
 @var notes
 @abstract Generated model property: notes.
 */
@property (nonatomic, strong) NSString * notes;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var timeFrame
 @abstract Generated model property: time_frame.
 */
@property (nonatomic, strong) NSString * timeFrame;

/*!
 @var timeFrameSortId
 @abstract Generated model property: time_frame_sort_id.
 */
@property (nonatomic, strong) NSNumber * timeFrameSortId;

@end
