//
//  Application.h
//  AnyPresence SDK
//

/*!
 @header Application
 @abstract Application class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Application
 @abstract Generated model object: Application.
 @discussion Use @link //apple_ref/occ/cat/Application(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Application/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Application : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Application.
 @result Class representing the data source associated with a Application.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var androidAppVersion
 @abstract Generated model property: android_app_version.
 */
@property (nonatomic, strong) NSNumber * androidAppVersion;

/*!
 @var appName
 @abstract Generated model property: app_name.
 */
@property (nonatomic, strong) NSString * appName;

/*!
 @var appVersion
 @abstract Generated model property: app_version.
 */
@property (nonatomic, strong) NSString * appVersion;

/*!
 @var downloadUrl
 @abstract Generated model property: download_url.
 */
@property (nonatomic, strong) NSString * downloadUrl;

/*!
 @var settings
 @abstract Generated property for has-many relationship to settings.
 */
@property (nonatomic, strong) NSOrderedSet * settings;
@end
