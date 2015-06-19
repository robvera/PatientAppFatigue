//
//  ProfileViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/14/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <APSDK/UserProfile.h>


@interface ProfileViewController : BaseViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>


@property (strong, nonatomic) UserProfile *userProfile;


@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;

//Diabetes fields
@property (weak, nonatomic) IBOutlet UIView *goalContentView;
@property (weak, nonatomic) IBOutlet UITextField *goalWeightField;
@property (weak, nonatomic) IBOutlet UITextField *goalCholesterolField;
@property (weak, nonatomic) IBOutlet UITextField *goalGlucoseField;

@property (strong, nonatomic) NSArray *stateData;
@property (nonatomic, strong, readonly) UIPickerView * inputViewStatePicker;
@property (strong, nonatomic) NSArray *genderData;
@property (nonatomic, strong, readonly) UIPickerView * inputViewGenderPicker;

-(IBAction)savePressed:(id)sender;

@end
