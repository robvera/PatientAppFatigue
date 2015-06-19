//
//  TreatmentType.h
//  AnyPresence SDK
//

/*!
 @header TreatmentType
 @abstract TreatmentType class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class TreatmentType
 @abstract Generated model object: TreatmentType.
 @discussion Use @link //apple_ref/occ/cat/TreatmentType(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/TreatmentType/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface TreatmentType : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a TreatmentType.
 @result Class representing the data source associated with a TreatmentType.
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
 @var sortId
 @abstract Generated model property: sort_id.
 */
@property (nonatomic, strong) NSNumber * sortId;

/*!
 @var patientTreatments
 @abstract Generated property for has-many relationship to patientTreatments.
 */
@property (nonatomic, strong) NSOrderedSet * patientTreatments;
@end
