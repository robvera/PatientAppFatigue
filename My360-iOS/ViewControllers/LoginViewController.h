//
//  LoginViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/26/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DCRoundSwitch.h"
#import <APSDK/Application.h>


@interface LoginViewController : BaseViewController <UITextFieldDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) DCRoundSwitch *saveEmailSwitch;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *majorVersion;

@property (weak, nonatomic) IBOutlet UILabel *appVersionString;

@property (strong, nonatomic) Application *applicationData; //used to check for new version




- (IBAction)loginPressed:(id)sender;
- (IBAction)registerPressed:(id)sender;

@end
