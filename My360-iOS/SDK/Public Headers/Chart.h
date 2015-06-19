//
//  Chart.h
//  AnyPresence SDK
//

/*!
 @header Chart
 @abstract Chart class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Chart
 @abstract Generated model object: Chart.
 @discussion Use @link //apple_ref/occ/cat/Chart(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Chart/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Chart : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Chart.
 @result Class representing the data source associated with a Chart.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var chartdata
 @abstract Generated model property: chartdata.
 */
@property (nonatomic, strong) NSDictionary * chartdata;

/*!
 @var chartName
 @abstract Generated model property: chart_name.
 */
@property (nonatomic, strong) NSString * chartName;

@end
