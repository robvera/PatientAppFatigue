//
//  PatientEducation.h
//  AnyPresence SDK
//

/*!
 @header PatientEducation
 @abstract PatientEducation class
 */

#import "APObject.h"
#import "Typedefs.h"

@class EducationalReading;

/*!
 @class PatientEducation
 @abstract Generated model object: PatientEducation.
 @discussion Use @link //apple_ref/occ/cat/PatientEducation(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientEducation/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientEducation : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientEducation.
 @result Class representing the data source associated with a PatientEducation.
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
 @var educationalReadingDenormalized
 @abstract Generated model property: educational_reading_denormalized.
 */
@property (nonatomic, strong) NSString * educationalReadingDenormalized;

/*!
 @var educationalReadingId
 @abstract Generated model property: educational_reading_id.
 */
@property (nonatomic, strong) NSNumber * educationalReadingId;

/*!
 @var educationalReadingUrl
 @abstract Generated model property: educational_reading_url.
 */
@property (nonatomic, strong) NSString * educationalReadingUrl;

/*!
 @var favorite
 @abstract Generated model property: favorite.
 */
@property (nonatomic, strong) NSNumber * favorite;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var unread
 @abstract Generated model property: unread.
 */
@property (nonatomic, strong) NSNumber * unread;

/*!
 @var educationalReading
 @abstract Generated property for belongs-to relationship to educationalReading.
 */
@property (nonatomic, strong) EducationalReading * educationalReading;
@end
