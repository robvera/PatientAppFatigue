//
//  EducationalReading.h
//  AnyPresence SDK
//

/*!
 @header EducationalReading
 @abstract EducationalReading class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Clinician;

/*!
 @class EducationalReading
 @abstract Generated model object: EducationalReading.
 @discussion Use @link //apple_ref/occ/cat/EducationalReading(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/EducationalReading/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface EducationalReading : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a EducationalReading.
 @result Class representing the data source associated with a EducationalReading.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var addedOn
 @abstract Generated model property: added_on.
 */
@property (nonatomic, strong) NSDate * addedOn;

/*!
 @var appId
 @abstract Generated model property: app_id.
 */
@property (nonatomic, strong) NSNumber * appId;

/*!
 @var clinicianId
 @abstract Generated model property: clinician_id.
 */
@property (nonatomic, strong) NSNumber * clinicianId;

/*!
 @var defaultEducation
 @abstract Generated model property: default_education.
 */
@property (nonatomic, strong) NSNumber * defaultEducation;

/*!
 @var desc
 @abstract Generated model property: desc.
 */
@property (nonatomic, strong) NSString * desc;

/*!
 @var inactive
 @abstract Generated model property: inactive.
 */
@property (nonatomic, strong) NSNumber * inactive;

/*!
 @var name
 @abstract Generated model property: name.
 */
@property (nonatomic, strong) NSString * name;

/*!
 @var url
 @abstract Generated model property: url.
 */
@property (nonatomic, strong) NSString * url;

/*!
 @var patientEducations
 @abstract Generated property for has-many relationship to patientEducations.
 */
@property (nonatomic, strong) NSOrderedSet * patientEducations;
/*!
 @var clinician
 @abstract Generated property for belongs-to relationship to clinician.
 */
@property (nonatomic, strong) Clinician * clinician;
@end
