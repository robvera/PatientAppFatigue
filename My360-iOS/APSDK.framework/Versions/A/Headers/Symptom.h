//
//  Symptom.h
//  AnyPresence SDK
//

/*!
 @header Symptom
 @abstract Symptom class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class Symptom
 @abstract Generated model object: Symptom.
 @discussion Use @link //apple_ref/occ/cat/Symptom(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Symptom/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Symptom : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Symptom.
 @result Class representing the data source associated with a Symptom.
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
 @var symptomCat
 @abstract Generated model property: symptom_cat.
 */
@property (nonatomic, strong) NSString * symptomCat;

/*!
 @var patientExacerbations
 @abstract Generated property for has-many relationship to patientExacerbations.
 */
@property (nonatomic, strong) NSOrderedSet * patientExacerbations;
/*!
 @var patientJournalSymptoms
 @abstract Generated property for has-many relationship to patientJournalSymptoms.
 */
@property (nonatomic, strong) NSOrderedSet * patientJournalSymptoms;
@end
