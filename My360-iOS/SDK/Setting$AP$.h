//
//  Setting$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Application$AP$;

@interface Setting$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSString * caregiverEmailMsg;
@property (nonatomic, strong) NSString * caregiverEmailSubject;
@property (nonatomic, strong) NSString * caregiverSmsMsg;
@property (nonatomic, strong) NSString * contactEmergeServicesMsg;
@property (nonatomic, strong) NSString * educationalPushMessage;
@property (nonatomic, strong) NSString * educationReminderMsg;
@property (nonatomic, strong) NSString * firstLoginReminder;
@property (nonatomic, strong) NSString * fromEmail;
@property (nonatomic, strong) NSString * fromPhone;
@property (nonatomic, strong) NSString * labApptReminderMsgToday;
@property (nonatomic, strong) NSString * labApptReminderMsgTomorrow;
@property (nonatomic, strong) NSString * lastLoginAlertMessage;
@property (nonatomic, strong) NSNumber * lastLoginNumberOfDays;
@property (nonatomic, strong) NSString * medicationReminderMsg;
@property (nonatomic, strong) NSString * nonMedicationReminderMsg;
@property (nonatomic, strong) NSDate * refDataJournalsUpdatedOn;
@property (nonatomic, strong) NSDate * refDataLabResultsUpdatedOn;
@property (nonatomic, strong) NSDate * refDataSideEffectsUpdatedOn;
@property (nonatomic, strong) NSDate * refDataTreatmentUpdatedOn;
@property (nonatomic, strong) NSString * reportEmailFailure;
@property (nonatomic, strong) NSString * reportEmailSuccess;
@property (nonatomic, strong) NSString * reportMessageFailure;
@property (nonatomic, strong) NSString * reportMessageSuccess;
@property (nonatomic, strong) NSString * reportSubjectFailure;
@property (nonatomic, strong) NSString * reportSubjectSuccess;
@property (nonatomic, strong) NSString * severeSymptomMsg;
@property (nonatomic, strong) NSString * sysEmailOnClinicianCodeRequest;
@property (nonatomic, strong) NSString * timeSensitiveAlertMessage;
@property (nonatomic, strong) Application$AP$ * application;

@end
