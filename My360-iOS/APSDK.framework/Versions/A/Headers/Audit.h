//
//  Audit.h
//  AnyPresence SDK
//

/*!
 @header Audit
 @abstract Audit class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Audit
 @abstract Generated model object: Audit.
 @discussion Use @link //apple_ref/occ/cat/Audit(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Audit/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Audit : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Audit.
 @result Class representing the data source associated with a Audit.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var actionTaken
 @abstract Generated model property: action_taken.
 */
@property (nonatomic, strong) NSString * actionTaken;

/*!
 @var actionTime
 @abstract Generated model property: action_time.
 */
@property (nonatomic, strong) NSDate * actionTime;

/*!
 @var patientId
 @abstract Generated model property: patient_id.
 */
@property (nonatomic, strong) NSNumber * patientId;

/*!
 @var recObjectId
 @abstract Generated model property: rec_object_id.
 */
@property (nonatomic, strong) NSNumber * recObjectId;

/*!
 @var recObjectName
 @abstract Generated model property: rec_object_name.
 */
@property (nonatomic, strong) NSString * recObjectName;

@end
