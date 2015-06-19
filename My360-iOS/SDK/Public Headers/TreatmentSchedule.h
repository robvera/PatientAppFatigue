//
//  TreatmentSchedule.h
//  AnyPresence SDK
//

/*!
 @header TreatmentSchedule
 @abstract TreatmentSchedule class
 */

#import "APObject.h"
#import "Typedefs.h"

/*!
 @class TreatmentSchedule
 @abstract Generated model object: TreatmentSchedule.
 @discussion Use @link //apple_ref/occ/cat/TreatmentSchedule(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/TreatmentSchedule/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface TreatmentSchedule : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a TreatmentSchedule.
 @result Class representing the data source associated with a TreatmentSchedule.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key.
 */
@property (nonatomic, strong) NSNumber * id;

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
 @var reminderInterval
 @abstract Generated model property: reminder_interval.
 */
@property (nonatomic, strong) NSNumber * reminderInterval;

/*!
 @var sortOrder
 @abstract Generated model property: sort_order.
 */
@property (nonatomic, strong) NSNumber * sortOrder;

/*!
 @var timesPerDay
 @abstract Generated model property: times_per_day.
 */
@property (nonatomic, strong) NSNumber * timesPerDay;

/*!
 @var patientTreatments
 @abstract Generated property for has-many relationship to patientTreatments.
 */
@property (nonatomic, strong) NSOrderedSet * patientTreatments;
@end
