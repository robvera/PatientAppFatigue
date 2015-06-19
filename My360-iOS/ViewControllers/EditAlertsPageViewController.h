//
//  EditAlertsPageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/27/13.
//
//

#import "BaseFormViewController.h"
#import <APSDK/UserProfile.h>
#import "DCRoundSwitch.h"

@interface EditAlertsPageViewController : BaseFormViewController


@property (nonatomic, strong) UserProfile * userProfile;

@property (strong, nonatomic) IBOutlet DCRoundSwitch *labAppointmentReminderSwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *lastLoginAlertSwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *medicationExpirationAlertSwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *treatmentScheduleAlertSwitch;


- (BOOL)saveTapped;

@end
