//
//  EditCaregiverViewController.h
//  MSPatient
//
//  Created by David Benko on 5/16/13.
//
//

#import "BaseFormViewController.h"
#import "DCRoundSwitch.h"
#import <APSDK/PatientCaregiver+Remote.h>
@interface EditCaregiverViewController : BaseFormViewController

@property (nonatomic, strong) IBOutlet UITextField *cgName;
@property (nonatomic, strong) IBOutlet UITextField *cgPhone;
@property (nonatomic, strong) IBOutlet UITextField *cgEmail;
@property (nonatomic, strong) DCRoundSwitch *shouldEmail;
@property (nonatomic, strong) DCRoundSwitch *shouldSMS;
@property (nonatomic, strong) PatientCaregiver *patientCaregiver;
@property (nonatomic, strong, readonly) UIToolbar * inputAccessoryViewToolbar;
@end
