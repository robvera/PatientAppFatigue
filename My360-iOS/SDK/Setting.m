//
//  Setting.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Setting.h"
#import "Setting$AP$.h"
#import "Application.h"
#import "AnyPresenceAPI.h"

@interface Setting ()

@property (nonatomic, strong) Setting$AP$ * internal;

@end

@implementation Setting

@synthesize application = _application;

#pragma mark - Data Source

+ (Class)dataSource {
    return [AnyPresenceAPI class];
}

#pragma mark - Public

- (NSNumber *)id {
    return ThreadSafeReturn(^id{
        return self.internal.id;
    });
}

- (void)setId:(NSNumber *)id {
    ThreadSafe(^{
        self.internal.id = id;
    });
}

- (NSNumber *)appId {
    return ThreadSafeReturn(^id{
        return self.internal.appId;
    });
}

- (void)setAppId:(NSNumber *)appId {
    ThreadSafe(^{
        self.internal.appId = appId;
    });
}

- (NSString *)caregiverEmailMsg {
    return ThreadSafeReturn(^id{
        return self.internal.caregiverEmailMsg;
    });
}

- (void)setCaregiverEmailMsg:(NSString *)caregiverEmailMsg {
    ThreadSafe(^{
        self.internal.caregiverEmailMsg = caregiverEmailMsg;
    });
}

- (NSString *)caregiverEmailSubject {
    return ThreadSafeReturn(^id{
        return self.internal.caregiverEmailSubject;
    });
}

- (void)setCaregiverEmailSubject:(NSString *)caregiverEmailSubject {
    ThreadSafe(^{
        self.internal.caregiverEmailSubject = caregiverEmailSubject;
    });
}

- (NSString *)caregiverSmsMsg {
    return ThreadSafeReturn(^id{
        return self.internal.caregiverSmsMsg;
    });
}

- (void)setCaregiverSmsMsg:(NSString *)caregiverSmsMsg {
    ThreadSafe(^{
        self.internal.caregiverSmsMsg = caregiverSmsMsg;
    });
}

- (NSString *)contactEmergeServicesMsg {
    return ThreadSafeReturn(^id{
        return self.internal.contactEmergeServicesMsg;
    });
}

- (void)setContactEmergeServicesMsg:(NSString *)contactEmergeServicesMsg {
    ThreadSafe(^{
        self.internal.contactEmergeServicesMsg = contactEmergeServicesMsg;
    });
}

- (NSString *)educationalPushMessage {
    return ThreadSafeReturn(^id{
        return self.internal.educationalPushMessage;
    });
}

- (void)setEducationalPushMessage:(NSString *)educationalPushMessage {
    ThreadSafe(^{
        self.internal.educationalPushMessage = educationalPushMessage;
    });
}

- (NSString *)educationReminderMsg {
    return ThreadSafeReturn(^id{
        return self.internal.educationReminderMsg;
    });
}

- (void)setEducationReminderMsg:(NSString *)educationReminderMsg {
    ThreadSafe(^{
        self.internal.educationReminderMsg = educationReminderMsg;
    });
}

- (NSString *)firstLoginReminder {
    return ThreadSafeReturn(^id{
        return self.internal.firstLoginReminder;
    });
}

- (void)setFirstLoginReminder:(NSString *)firstLoginReminder {
    ThreadSafe(^{
        self.internal.firstLoginReminder = firstLoginReminder;
    });
}

- (NSString *)fromEmail {
    return ThreadSafeReturn(^id{
        return self.internal.fromEmail;
    });
}

- (void)setFromEmail:(NSString *)fromEmail {
    ThreadSafe(^{
        self.internal.fromEmail = fromEmail;
    });
}

- (NSString *)fromPhone {
    return ThreadSafeReturn(^id{
        return self.internal.fromPhone;
    });
}

- (void)setFromPhone:(NSString *)fromPhone {
    ThreadSafe(^{
        self.internal.fromPhone = fromPhone;
    });
}

- (NSString *)labApptReminderMsgToday {
    return ThreadSafeReturn(^id{
        return self.internal.labApptReminderMsgToday;
    });
}

- (void)setLabApptReminderMsgToday:(NSString *)labApptReminderMsgToday {
    ThreadSafe(^{
        self.internal.labApptReminderMsgToday = labApptReminderMsgToday;
    });
}

- (NSString *)labApptReminderMsgTomorrow {
    return ThreadSafeReturn(^id{
        return self.internal.labApptReminderMsgTomorrow;
    });
}

- (void)setLabApptReminderMsgTomorrow:(NSString *)labApptReminderMsgTomorrow {
    ThreadSafe(^{
        self.internal.labApptReminderMsgTomorrow = labApptReminderMsgTomorrow;
    });
}

- (NSString *)lastLoginAlertMessage {
    return ThreadSafeReturn(^id{
        return self.internal.lastLoginAlertMessage;
    });
}

- (void)setLastLoginAlertMessage:(NSString *)lastLoginAlertMessage {
    ThreadSafe(^{
        self.internal.lastLoginAlertMessage = lastLoginAlertMessage;
    });
}

- (NSNumber *)lastLoginNumberOfDays {
    return ThreadSafeReturn(^id{
        return self.internal.lastLoginNumberOfDays;
    });
}

- (void)setLastLoginNumberOfDays:(NSNumber *)lastLoginNumberOfDays {
    ThreadSafe(^{
        self.internal.lastLoginNumberOfDays = lastLoginNumberOfDays;
    });
}

- (NSString *)medicationReminderMsg {
    return ThreadSafeReturn(^id{
        return self.internal.medicationReminderMsg;
    });
}

- (void)setMedicationReminderMsg:(NSString *)medicationReminderMsg {
    ThreadSafe(^{
        self.internal.medicationReminderMsg = medicationReminderMsg;
    });
}

- (NSString *)nonMedicationReminderMsg {
    return ThreadSafeReturn(^id{
        return self.internal.nonMedicationReminderMsg;
    });
}

- (void)setNonMedicationReminderMsg:(NSString *)nonMedicationReminderMsg {
    ThreadSafe(^{
        self.internal.nonMedicationReminderMsg = nonMedicationReminderMsg;
    });
}

- (NSDate *)refDataJournalsUpdatedOn {
    return ThreadSafeReturn(^id{
        return self.internal.refDataJournalsUpdatedOn;
    });
}

- (void)setRefDataJournalsUpdatedOn:(NSDate *)refDataJournalsUpdatedOn {
    ThreadSafe(^{
        self.internal.refDataJournalsUpdatedOn = refDataJournalsUpdatedOn;
    });
}

- (NSDate *)refDataLabResultsUpdatedOn {
    return ThreadSafeReturn(^id{
        return self.internal.refDataLabResultsUpdatedOn;
    });
}

- (void)setRefDataLabResultsUpdatedOn:(NSDate *)refDataLabResultsUpdatedOn {
    ThreadSafe(^{
        self.internal.refDataLabResultsUpdatedOn = refDataLabResultsUpdatedOn;
    });
}

- (NSDate *)refDataSideEffectsUpdatedOn {
    return ThreadSafeReturn(^id{
        return self.internal.refDataSideEffectsUpdatedOn;
    });
}

- (void)setRefDataSideEffectsUpdatedOn:(NSDate *)refDataSideEffectsUpdatedOn {
    ThreadSafe(^{
        self.internal.refDataSideEffectsUpdatedOn = refDataSideEffectsUpdatedOn;
    });
}

- (NSDate *)refDataTreatmentUpdatedOn {
    return ThreadSafeReturn(^id{
        return self.internal.refDataTreatmentUpdatedOn;
    });
}

- (void)setRefDataTreatmentUpdatedOn:(NSDate *)refDataTreatmentUpdatedOn {
    ThreadSafe(^{
        self.internal.refDataTreatmentUpdatedOn = refDataTreatmentUpdatedOn;
    });
}

- (NSString *)reportEmailFailure {
    return ThreadSafeReturn(^id{
        return self.internal.reportEmailFailure;
    });
}

- (void)setReportEmailFailure:(NSString *)reportEmailFailure {
    ThreadSafe(^{
        self.internal.reportEmailFailure = reportEmailFailure;
    });
}

- (NSString *)reportEmailSuccess {
    return ThreadSafeReturn(^id{
        return self.internal.reportEmailSuccess;
    });
}

- (void)setReportEmailSuccess:(NSString *)reportEmailSuccess {
    ThreadSafe(^{
        self.internal.reportEmailSuccess = reportEmailSuccess;
    });
}

- (NSString *)reportMessageFailure {
    return ThreadSafeReturn(^id{
        return self.internal.reportMessageFailure;
    });
}

- (void)setReportMessageFailure:(NSString *)reportMessageFailure {
    ThreadSafe(^{
        self.internal.reportMessageFailure = reportMessageFailure;
    });
}

- (NSString *)reportMessageSuccess {
    return ThreadSafeReturn(^id{
        return self.internal.reportMessageSuccess;
    });
}

- (void)setReportMessageSuccess:(NSString *)reportMessageSuccess {
    ThreadSafe(^{
        self.internal.reportMessageSuccess = reportMessageSuccess;
    });
}

- (NSString *)reportSubjectFailure {
    return ThreadSafeReturn(^id{
        return self.internal.reportSubjectFailure;
    });
}

- (void)setReportSubjectFailure:(NSString *)reportSubjectFailure {
    ThreadSafe(^{
        self.internal.reportSubjectFailure = reportSubjectFailure;
    });
}

- (NSString *)reportSubjectSuccess {
    return ThreadSafeReturn(^id{
        return self.internal.reportSubjectSuccess;
    });
}

- (void)setReportSubjectSuccess:(NSString *)reportSubjectSuccess {
    ThreadSafe(^{
        self.internal.reportSubjectSuccess = reportSubjectSuccess;
    });
}

- (NSString *)severeSymptomMsg {
    return ThreadSafeReturn(^id{
        return self.internal.severeSymptomMsg;
    });
}

- (void)setSevereSymptomMsg:(NSString *)severeSymptomMsg {
    ThreadSafe(^{
        self.internal.severeSymptomMsg = severeSymptomMsg;
    });
}

- (NSString *)sysEmailOnClinicianCodeRequest {
    return ThreadSafeReturn(^id{
        return self.internal.sysEmailOnClinicianCodeRequest;
    });
}

- (void)setSysEmailOnClinicianCodeRequest:(NSString *)sysEmailOnClinicianCodeRequest {
    ThreadSafe(^{
        self.internal.sysEmailOnClinicianCodeRequest = sysEmailOnClinicianCodeRequest;
    });
}

- (NSString *)timeSensitiveAlertMessage {
    return ThreadSafeReturn(^id{
        return self.internal.timeSensitiveAlertMessage;
    });
}

- (void)setTimeSensitiveAlertMessage:(NSString *)timeSensitiveAlertMessage {
    ThreadSafe(^{
        self.internal.timeSensitiveAlertMessage = timeSensitiveAlertMessage;
    });
}

- (Application *)application {
    if (!_application && self.internal.application) {
        _application = [[Application alloc] initWithInternal:(APInternalObject *)self.internal.application];
    }
    
    return _application;
}

- (void)setApplication:(Application *)application {
    if (_application != application) {
        _application = application;
        
        ThreadSafe(^{
            self.internal.application = (id)application.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.application" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.application"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.application"]) {
        _application = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
