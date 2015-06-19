//
//  PatientReminder$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class ReminderType$AP$;

@interface PatientReminder$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * patientTreatmentId;
@property (nonatomic, strong) NSString * reminderMessage;
@property (nonatomic, strong) NSDate * reminderOn;
@property (nonatomic, strong) NSString * reminderTypeDenormalized;
@property (nonatomic, strong) NSNumber * reminderTypeId;
@property (nonatomic, strong) NSNumber * unread;
@property (nonatomic, strong) ReminderType$AP$ * reminderType;

@end
