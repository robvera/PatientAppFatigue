//
//  Mood.h
//  AnyPresence SDK
//

/*!
 @header Mood
 @abstract Mood class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Mood
 @abstract Generated model object: Mood.
 @discussion Use @link //apple_ref/occ/cat/Mood(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Mood/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Mood : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Mood.
 @result Class representing the data source associated with a Mood.
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
 @var patientJournals
 @abstract Generated property for has-many relationship to patientJournals.
 */
@property (nonatomic, strong) NSOrderedSet * patientJournals;
@end
