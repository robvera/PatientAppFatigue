//
//  RegisterViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/27/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


@interface RegisterViewController : BaseViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>



@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *confirmEmailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (strong, nonatomic) NSArray *stateData;
@property (nonatomic, strong, readonly) UIPickerView * inputViewStatePicker;
@property (strong, nonatomic) NSArray *genderData;
@property (nonatomic, strong, readonly) UIPickerView * inputViewGenderPicker;


-(IBAction)savePressed:(id)sender;
-(IBAction)cancelPressed:(id)sender;

- (IBAction)keyboardDonePressed:(id)sender;


@end
