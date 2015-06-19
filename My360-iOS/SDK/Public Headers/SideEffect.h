//
//  SideEffect.h
//  AnyPresence SDK
//

/*!
 @header SideEffect
 @abstract SideEffect class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class SideEffect
 @abstract Generated model object: SideEffect.
 @discussion Use @link //apple_ref/occ/cat/SideEffect(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/SideEffect/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface SideEffect : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a SideEffect.
 @result Class representing the data source associated with a SideEffect.
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
 @var patientSideEffects
 @abstract Generated property for has-many relationship to patientSideEffects.
 */
@property (nonatomic, strong) NSOrderedSet * patientSideEffects;
@end
