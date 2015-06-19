//
//  TestType.h
//  AnyPresence SDK
//

/*!
 @header TestType
 @abstract TestType class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class TestType
 @abstract Generated model object: TestType.
 @discussion Use @link //apple_ref/occ/cat/TestType(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/TestType/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface TestType : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a TestType.
 @result Class representing the data source associated with a TestType.
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
 @var testTypeCat
 @abstract Generated model property: test_type_cat.
 */
@property (nonatomic, strong) NSString * testTypeCat;

/*!
 @var patientLabResults
 @abstract Generated property for has-many relationship to patientLabResults.
 */
@property (nonatomic, strong) NSOrderedSet * patientLabResults;
@end
