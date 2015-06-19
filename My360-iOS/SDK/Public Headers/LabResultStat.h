//
//  LabResultStat.h
//  AnyPresence SDK
//

/*!
 @header LabResultStat
 @abstract LabResultStat class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class LabResultStat
 @abstract Generated model object: LabResultStat.
 @discussion Use @link //apple_ref/occ/cat/LabResultStat(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/LabResultStat/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface LabResultStat : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a LabResultStat.
 @result Class representing the data source associated with a LabResultStat.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

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
 @var patientLabResults
 @abstract Generated property for has-many relationship to patientLabResults.
 */
@property (nonatomic, strong) NSOrderedSet * patientLabResults;
@end
