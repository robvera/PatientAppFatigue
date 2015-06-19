//
//  User.h
//  AnyPresence SDK
//

/*!
 @header User
 @abstract User class
 */

#import "APObject.h"
#import "Authorizable-Protocol.h"
#import "Typedefs.h"

/*!
 @class User
 @abstract Generated model object: User.
 @discussion Use @link //apple_ref/occ/cat/User(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/User/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface User : APObject <Authorizable> {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a User.
 @result Class representing the data source associated with a User.
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
 @var email
 @abstract Generated model property: email.
 */
@property (nonatomic, strong) NSString * email;

/*!
 @var lastLoginTimestamp
 @abstract Generated model property: last_login_timestamp.
 */
@property (nonatomic, strong) NSDate * lastLoginTimestamp;

/*!
 @var logInCounter
 @abstract Generated model property: log_in_counter.
 */
@property (nonatomic, strong) NSNumber * logInCounter;

/*!
 @var password
 @abstract Generated model property: password.
 */
@property (nonatomic, strong) NSString * password;

/*!
 @var passwordConfirmation
 @abstract Generated model property: password_confirmation.
 */
@property (nonatomic, strong) NSString * passwordConfirmation;

/*!
 @var passwordDigest
 @abstract Generated model property: password_digest.
 */
@property (nonatomic, strong) NSString * passwordDigest;

/*!
 @var resetPassword
 @abstract Generated model property: reset_password.
 */
@property (nonatomic, strong) NSNumber * resetPassword;

/*!
 @var role
 @abstract Generated model property: role.
 */
@property (nonatomic, strong) NSString * role;

/*!
 @var xSessionId
 @abstract Generated model property: x_session_id.
 */
@property (nonatomic, strong) NSString * xSessionId;

@end
