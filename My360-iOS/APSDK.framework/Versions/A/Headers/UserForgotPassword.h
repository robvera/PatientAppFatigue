//
//  UserForgotPassword.h
//  AnyPresence SDK
//

/*!
 @header UserForgotPassword
 @abstract UserForgotPassword class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class UserForgotPassword
 @abstract Generated model object: UserForgotPassword.
 @discussion Use @link //apple_ref/occ/cat/UserForgotPassword(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/UserForgotPassword/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface UserForgotPassword : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a UserForgotPassword.
 @result Class representing the data source associated with a UserForgotPassword.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var email
 @abstract Generated model property: email.
 */
@property (nonatomic, strong) NSString * email;

/*!
 @var updatedOn
 @abstract Generated model property: updated_on.
 */
@property (nonatomic, strong) NSDate * updatedOn;

@end
