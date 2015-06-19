//
//  DosageUom.h
//  AnyPresence SDK
//

/*!
 @header DosageUom
 @abstract DosageUom class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class DosageUom
 @abstract Generated model object: DosageUom.
 @discussion Use @link //apple_ref/occ/cat/DosageUom(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/DosageUom/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface DosageUom : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a DosageUom.
 @result Class representing the data source associated with a DosageUom.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var dosageCat
 @abstract Generated model property: dosage_cat.
 */
@property (nonatomic, strong) NSString * dosageCat;

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
 @var patientTreatments
 @abstract Generated property for has-many relationship to patientTreatments.
 */
@property (nonatomic, strong) NSOrderedSet * patientTreatments;
@end
