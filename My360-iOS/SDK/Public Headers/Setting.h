//
//  Setting.h
//  AnyPresence SDK
//

/*!
 @header Setting
 @abstract Setting class
 */

#import "APObject.h"
#import "Typedefs.h"

@class Application;

/*!
 @class Setting
 @abstract Generated model object: Setting.
 @discussion Use @link //apple_ref/occ/cat/Setting(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/Setting/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface Setting : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a Setting.
 @result Class representing the data source associated with a Setting.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var appId
 @abstract Generated model property: app_id.
 */
@property (nonatomic, strong) NSNumber * appId;

/*!
 @var caregiverEmailMsg
 @abstract Generated model property: caregiver_email_msg.
 */
@property (nonatomic, strong) NSString * caregiverEmailMsg;

/*!
 @var caregiverEmailSubject
 @abstract Generated model property: caregiver_email_subject.
 */
@property (nonatomic, strong) NSString * caregiverEmailSubject;

/*!
 @var caregiverSmsMsg
 @abstract Generated model property: caregiver_sms_msg.
 */
@property (nonatomic, strong) NSString * caregiverSmsMsg;

/*!
 @var contactEmergeServicesMsg
 @abstract Generated model property: contact_emerge_services_msg.
 */
@property (nonatomic, strong) NSString * contactEmergeServicesMsg;

/*!
 @var educationalPushMessage
 @abstract Generated model property: educational_push_message.
 */
@property (nonatomic, strong) NSString * educationalPushMessage;

/*!
 @var educationReminderMsg
 @abstract Generated model property: education_reminder_msg.
 */
@property (nonatomic, strong) NSString * educationReminderMsg;

/*!
 @var firstLoginReminder
 @abstract Generated model property: first_login_reminder.
 */
@property (nonatomic, strong) NSString * firstLoginReminder;

/*!
 @var fromEmail
 @abstract Generated model property: from_email.
 */
@property (nonatomic, strong) NSString * fromEmail;

/*!
 @var fromPhone
 @abstract Generated model property: from_phone.
 */
@property (nonatomic, strong) NSString * fromPhone;

/*!
 @var labApptReminderMsgToday
 @abstract Generated model property: lab_appt_reminder_msg_today.
 */
@property (nonatomic, strong) NSString * labApptReminderMsgToday;

/*!
 @var labApptReminderMsgTomorrow
 @abstract Generated model property: lab_appt_reminder_msg_tomorrow.
 */
@property (nonatomic, strong) NSString * labApptReminderMsgTomorrow;

/*!
 @var lastLoginAlertMessage
 @abstract Generated model property: last_login_alert_message.
 */
@property (nonatomic, strong) NSString * lastLoginAlertMessage;

/*!
 @var lastLoginNumberOfDays
 @abstract Generated model property: last_login_number_of_days.
 */
@property (nonatomic, strong) NSNumber * lastLoginNumberOfDays;

/*!
 @var medicationReminderMsg
 @abstract Generated model property: medication_reminder_msg.
 */
@property (nonatomic, strong) NSString * medicationReminderMsg;

/*!
 @var nonMedicationReminderMsg
 @abstract Generated model property: non_medication_reminder_msg.
 */
@property (nonatomic, strong) NSString * nonMedicationReminderMsg;

/*!
 @var refDataJournalsUpdatedOn
 @abstract Generated model property: ref_data_journals_updated_on.
 */
@property (nonatomic, strong) NSDate * refDataJournalsUpdatedOn;

/*!
 @var refDataLabResultsUpdatedOn
 @abstract Generated model property: ref_data_lab_results_updated_on.
 */
@property (nonatomic, strong) NSDate * refDataLabResultsUpdatedOn;

/*!
 @var refDataSideEffectsUpdatedOn
 @abstract Generated model property: ref_data_side_effects_updated_on.
 */
@property (nonatomic, strong) NSDate * refDataSideEffectsUpdatedOn;

/*!
 @var refDataTreatmentUpdatedOn
 @abstract Generated model property: ref_data_treatment_updated_on.
 */
@property (nonatomic, strong) NSDate * refDataTreatmentUpdatedOn;

/*!
 @var reportEmailFailure
 @abstract Generated model property: report_email_failure.
 */
@property (nonatomic, strong) NSString * reportEmailFailure;

/*!
 @var reportEmailSuccess
 @abstract Generated model property: report_email_success.
 */
@property (nonatomic, strong) NSString * reportEmailSuccess;

/*!
 @var reportMessageFailure
 @abstract Generated model property: report_message_failure.
 */
@property (nonatomic, strong) NSString * reportMessageFailure;

/*!
 @var reportMessageSuccess
 @abstract Generated model property: report_message_success.
 */
@property (nonatomic, strong) NSString * reportMessageSuccess;

/*!
 @var reportSubjectFailure
 @abstract Generated model property: report_subject_failure.
 */
@property (nonatomic, strong) NSString * reportSubjectFailure;

/*!
 @var reportSubjectSuccess
 @abstract Generated model property: report_subject_success.
 */
@property (nonatomic, strong) NSString * reportSubjectSuccess;

/*!
 @var severeSymptomMsg
 @abstract Generated model property: severe_symptom_msg.
 */
@property (nonatomic, strong) NSString * severeSymptomMsg;

/*!
 @var sysEmailOnClinicianCodeRequest
 @abstract Generated model property: sys_email_on_clinician_code_request.
 */
@property (nonatomic, strong) NSString * sysEmailOnClinicianCodeRequest;

/*!
 @var timeSensitiveAlertMessage
 @abstract Generated model property: time_sensitive_alert_message.
 */
@property (nonatomic, strong) NSString * timeSensitiveAlertMessage;

/*!
 @var application
 @abstract Generated property for belongs-to relationship to application.
 */
@property (nonatomic, strong) Application * application;
@end
