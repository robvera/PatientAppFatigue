//
//  PasswordViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/18/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <APSDK/UserProfile.h>


@interface PasswordViewController : BaseViewController <UITextFieldDelegate>


@property (strong, nonatomic) UserProfile *userProfile;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;

-(IBAction)savePressed:(id)sender;
- (IBAction)keyboardDonePressed:(id)sender;

@end
