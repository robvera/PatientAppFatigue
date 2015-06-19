//
//  EditClinicianViewController.h
//  My360-iOS
//
//  Created by Savio Vaz on 5/12/14.
//
//  https://peaceful-temple-4206.herokuapp.com
//  /api/v32

//   https://my360-stage.atpointofcare360.com
//  /api/v16


#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <APSDK/Clinician.h>
#import <APSDK/ClinicianCodeRequest+Remote.h>
//#import "SHSPhoneLibrary.h"
//#import "SHSPhoneNumberFormatter.h"


@interface EditClinicianViewController : BaseViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *currentClinicians;
@property (nonatomic, strong) Clinician *clinician;
@property (nonatomic, retain) UIAlertView *alert;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (strong, nonatomic) NSDictionary *dict_UnRegisteredClinician;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) ClinicianCodeRequest *clinician_code_request;
@property (weak, nonatomic) IBOutlet UITextField *fax;

@property (weak, nonatomic) IBOutlet UISwitch *sendEmail2Clinician;

- (IBAction)close:(id)sender;
- (IBAction)savedTapped;
-(IBAction)sendRequestEmail:(id)sender;
@end
