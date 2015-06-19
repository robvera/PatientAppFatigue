//
//  TreatmentSchedule$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface TreatmentSchedule$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSNumber * reminderInterval;
@property (nonatomic, strong) NSNumber * sortOrder;
@property (nonatomic, strong) NSNumber * timesPerDay;
@property (nonatomic, strong) NSOrderedSet * patientTreatments;

@end
