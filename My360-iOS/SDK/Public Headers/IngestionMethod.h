//
//  IngestionMethod.h
//  AnyPresence SDK
//

/*!
 @header IngestionMethod
 @abstract IngestionMethod class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class IngestionMethod
 @abstract Generated model object: IngestionMethod.
 @discussion Use @link //apple_ref/occ/cat/IngestionMethod(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/IngestionMethod/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface IngestionMethod : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a IngestionMethod.
 @result Class representing the data source associated with a IngestionMethod.
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
 @var patientTreatments
 @abstract Generated property for has-many relationship to patientTreatments.
 */
@property (nonatomic, strong) NSOrderedSet * patientTreatments;
@end
