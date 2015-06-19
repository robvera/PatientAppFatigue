//
//  Ability.h
//  AnyPresence SDK
//

/*!
 @header Ability
 @abstract Ability class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Ability
 @abstract Generated model object: Ability.
 @discussion Use @link //apple_ref/occ/cat/Ability(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Ability/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Ability : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Ability.
 @result Class representing the data source associated with a Ability.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var appId
 @abstract Generated model property: app_id.
 */
@property (nonatomic, strong) NSNumber * appId;

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
 @var summary
 @abstract Generated model property: summary.
 */
@property (nonatomic, strong) NSString * summary;

/*!
 @var patientJournals
 @abstract Generated property for has-many relationship to patientJournals.
 */
@property (nonatomic, strong) NSOrderedSet * patientJournals;
@end
