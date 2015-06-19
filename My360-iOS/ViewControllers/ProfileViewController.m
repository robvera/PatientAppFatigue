//
//  ProfileViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/14/13.
//
//

#import "ProfileViewController.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import <APSDK/APObject+Remote.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"
#import "ConfigurationManager.h"

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)



@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize userProfile;
@synthesize contentView;
@synthesize emailField;
@synthesize firstNameField;
@synthesize lastNameField;
@synthesize birthdayField;
@synthesize heightField;
@synthesize weightField;
@synthesize cityField;
@synthesize stateField;
@synthesize zipcodeField;
@synthesize genderField;
@synthesize stateData;
@synthesize inputViewStatePicker = _inputViewStatePicker;
@synthesize genderData;
@synthesize inputViewGenderPicker = _inputViewGenderPicker;



#pragma mark - Methods
- (void)viewDidLoad
{
    self.scrollView.frame = self.view.bounds;
    CGSize contentSize = self.contentView.frame.size;
    self.scrollView.contentSize = contentSize;
    [super viewDidLoad];
    
//    if (IS_IPAD){
//        UIScrollView* scrollView= [self.view.subviews lastObject];
//        UIView *view1 = [scrollView.subviews objectAtIndex:0];
//        NSLog(@"---View=1 %@", view1);
//        //    UIView* contentView= [[UIView alloc] initWithFrame:view1.bounds];
//        //    for (UIView *v  in view1.subviews) {
//        //        NSLog(@"View== %d, %@",v.tag, v);
//        //    }
//   
//        view1.layer.transform = CATransform3DMakeScale(768.0/320.0,1024/410.0 , 1);
//    }
//    
    
    if ([AppDelegate hasConnectivity])
    {
        
        [UserProfile query:@"my_profile" params:nil  async:^(NSArray * objects, NSError * error) {
            
            if (error) {
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:[error localizedDescription] ? : @"Error"];
            } else if (objects.count > 0) {
                self.userProfile = [objects objectAtIndex:0];
                
                //set values returned from the server
                self.emailField.text = self.userProfile.email;
                self.firstNameField.text = self.userProfile.firstName;
                self.lastNameField.text = self.userProfile.lastName;
                
                self.dateFormatter.dateFormat = kDateFormat;
                self.birthdayField.text = [self.dateFormatter stringFromDate:self.userProfile.dob];
                self.stateField.text = self.userProfile.state;
                self.heightField.text = [self.userProfile.height stringValue];
                self.weightField.text = [self.userProfile.weight stringValue];
                self.cityField.text = self.userProfile.city;
                self.zipcodeField.text = self.userProfile.zipcode;
                self.genderField.text = self.userProfile.gender;
                
                
                switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
                    case MS:
                        // Hide per David S by phone 11/21/14 - svaz
                        self.goalWeightField.hidden=YES;
                        self.goalCholesterolField.hidden=YES;
                        self.goalGlucoseField.hidden=YES;
                        self.goalContentView.hidden=YES;
                    case Diabetes:
                    case COPD:
                    case MM:
                    case RA:
                    case HepC:
                    case PD:
                    case IPF:
                    case Asthma:
                    case AAPA:
                    case BC:
                    case MDD:
                    case MDSAML:
                        
                        self.goalContentView.backgroundColor = [UIColor clearColor];
                        self.goalContentView.clipsToBounds = YES;
                        self.goalContentView.layer.cornerRadius = 8;
                        self.goalContentView.layer.borderColor = [UIColor whiteColor].CGColor;
                        self.goalContentView.layer.borderWidth = 1.0f;
                        
                        self.goalCholesterolField.text = [self.userProfile.goalCholesterol stringValue];
                        self.goalWeightField.text = [self.userProfile.goalWeight stringValue];
                        self.goalGlucoseField.text = [self.userProfile.goalHbaonec stringValue];
                    break;
                        
                    default:
                        break;
                }
                
//                if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//                    || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//                    
//                    self.goalContentView.backgroundColor = [UIColor clearColor];
//                    self.goalContentView.clipsToBounds = YES;
//                    self.goalContentView.layer.cornerRadius = 8;
//                    self.goalContentView.layer.borderColor = [UIColor whiteColor].CGColor;
//                    self.goalContentView.layer.borderWidth = 1.0f;
//                    
//                    self.goalCholesterolField.text = [self.userProfile.goalCholesterol stringValue];
//                    self.goalWeightField.text = [self.userProfile.goalWeight stringValue];
//                    self.goalGlucoseField.text = [self.userProfile.goalHbaonec stringValue];
//                }
            }
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    
    self.stateData = @[@"Alabama", @"Alaska", @"American Samoa", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"District of Columbia", @"Florida", @"Georgia", @"Guam", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine",  @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Northern Marianas Islands", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Puerto Rico", @"Rhode Island", @"South Carolina",@"South Dakota",@"Tennessee", @"Texas", @"Utah",@"Vermont", @"Virginia", @"Virgin Islands",@"Washington",@"West Virginia", @"Wisconsin",@"Wyoming"];
    
    self.genderData = @[@"Male", @"Female"];
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    
    self.emailField.backgroundColor = [UIColor whiteColor];
    self.firstNameField.backgroundColor = [UIColor whiteColor];
    self.lastNameField.backgroundColor = [UIColor whiteColor];
    self.birthdayField.backgroundColor = [UIColor whiteColor];
    self.heightField.backgroundColor = [UIColor whiteColor];
    self.weightField.backgroundColor = [UIColor whiteColor];
    self.cityField.backgroundColor = [UIColor whiteColor];
    self.stateField.backgroundColor = [UIColor whiteColor];
    self.zipcodeField.backgroundColor = [UIColor whiteColor];
    self.genderField.backgroundColor = [UIColor whiteColor];
    
    self.emailField.inputAccessoryView = self.inputToolbar;
    self.firstNameField.inputAccessoryView = self.inputToolbar;
    self.lastNameField.inputAccessoryView = self.inputToolbar;
    self.birthdayField.inputAccessoryView = self.inputToolbar;
    self.heightField.inputAccessoryView = self.inputToolbar;
    self.weightField.inputAccessoryView = self.inputToolbar;
    self.cityField.inputAccessoryView = self.inputToolbar;
    self.stateField.inputAccessoryView = self.inputToolbar;
    self.zipcodeField.inputAccessoryView = self.inputToolbar;
    self.genderField.inputAccessoryView = self.inputToolbar;
   
    switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
        case MS:
        case Diabetes:
        case COPD:
        case MM:
        case RA:
        case HepC:
        case PD:
        case IPF:
        case Asthma:
        case AAPA:
        case BC:
        case MDD:
        case MDSAML:
            
            self.goalContentView.backgroundColor = [UIColor clearColor];
            self.goalContentView.clipsToBounds = YES;
            self.goalContentView.layer.cornerRadius = 8;
            self.goalContentView.layer.borderColor = [UIColor whiteColor].CGColor;
            self.goalContentView.layer.borderWidth = 1.0f;
            
            
            self.goalCholesterolField.backgroundColor = [UIColor whiteColor];
            self.goalWeightField.backgroundColor = [UIColor whiteColor];
            self.goalGlucoseField.backgroundColor = [UIColor whiteColor];
            
            self.goalCholesterolField.inputAccessoryView = self.inputToolbar;
            self.goalWeightField.inputAccessoryView = self.inputToolbar;
            self.goalGlucoseField.inputAccessoryView = self.inputToolbar;
            break;
            
        default:
            break;
    }
    
//    if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//        ||[[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//        
//        
//        self.goalContentView.backgroundColor = [UIColor clearColor];
//        self.goalContentView.clipsToBounds = YES;
//        self.goalContentView.layer.cornerRadius = 8;
//        self.goalContentView.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.goalContentView.layer.borderWidth = 1.0f;
//        
//        
//        self.goalCholesterolField.backgroundColor = [UIColor whiteColor];
//        self.goalWeightField.backgroundColor = [UIColor whiteColor];
//        self.goalGlucoseField.backgroundColor = [UIColor whiteColor];
//        
//        self.goalCholesterolField.inputAccessoryView = self.inputToolbar;
//        self.goalWeightField.inputAccessoryView = self.inputToolbar;
//        self.goalGlucoseField.inputAccessoryView = self.inputToolbar;
//    }
    
    
    //these views use pickers for user input
    self.birthdayField.inputView = self.inputViewDatePicker;
    self.stateField.inputView = self.inputViewStatePicker;
    self.genderField.inputView = self.inputViewGenderPicker;
    
    
    // Set the custom back button
    UIImage *buttonImage = [UIImage imageNamed:ASSET_BY_IOS_VERSION(@"back_button_dark")];
    
    //create the button and assign the image
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    //set the frame of the button to the size of the image (see note below)
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(savePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIPickerView *)inputViewStatePicker {
    if (!_inputViewStatePicker) {
        _inputViewStatePicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        
        _inputViewStatePicker.delegate = self;
        _inputViewStatePicker.dataSource = self;
        _inputViewStatePicker.showsSelectionIndicator = YES;
        
        [_inputViewStatePicker sizeToFit];
    }
    
    return _inputViewStatePicker;
}


- (UIPickerView *)inputViewGenderPicker {
    if (!_inputViewGenderPicker) {
        _inputViewGenderPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        
        _inputViewGenderPicker.delegate = self;
        _inputViewGenderPicker.dataSource = self;
        _inputViewGenderPicker.showsSelectionIndicator = YES;
        
        [_inputViewGenderPicker sizeToFit];
    }
    
    return _inputViewGenderPicker;
}


#pragma mark - PickerView delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    NSInteger numberOfRows = 0;
    
    if (pickerView == self.inputViewStatePicker) {
        numberOfRows = self.stateData.count;
    }
    else if (pickerView == self.inputViewGenderPicker) {
        numberOfRows = self.genderData.count;
    }
    
    return numberOfRows;
    
    
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString *title;
    
    if (pickerView == self.inputViewStatePicker) {
        title = [self.stateData objectAtIndex:row];
    }
    else if (pickerView == self.inputViewGenderPicker) {
        title = [self.genderData objectAtIndex:row];
    }
    
    return title;    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (pickerView == self.inputViewStatePicker) {
        self.stateField.text = [self.stateData objectAtIndex:row];
    }
    else if (pickerView == self.inputViewGenderPicker) {
        self.genderField.text = [self.genderData objectAtIndex:row];
    }
    
}



#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.activeField = textField;
    if (textField == self.birthdayField) {
        
        self.dateFormatter.dateFormat = kDateFormat;
        
        if (textField.text.length > 0) {
            
            self.inputViewDatePicker.date = [self.dateFormatter dateFromString:textField.text];
        }
        else {
            textField.text = [self.dateFormatter stringFromDate:self.inputViewDatePicker.date];
        }
        
        self.inputViewDatePicker.datePickerMode = UIDatePickerModeDate;
    }
    else if (textField == self.stateField) {
        if (textField.text.length > 0) {
            
            NSInteger row = [self.stateData indexOfObject:textField.text];
            [self.inputViewStatePicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            textField.text = [self.stateData objectAtIndex:0];
        }
    }
    else if (textField == self.genderField) {
        if (textField.text.length > 0) {
            
            NSInteger row = [self.genderData indexOfObject:textField.text];
            [self.inputViewGenderPicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            textField.text = [self.genderData objectAtIndex:0];
        }
    }

    
    return YES;
}

- (IBAction)inputViewDatePickerValueChanged
{
    self.birthdayField.text = [self.dateFormatter stringFromDate:self.inputViewDatePicker.date];
    
}


#pragma mark - Actions

- (IBAction)keyboardDonePressed:(id)sender
{
    [self.emailField resignFirstResponder];
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.birthdayField resignFirstResponder];
    [self.heightField resignFirstResponder];
    [self.weightField resignFirstResponder];
    [self.cityField resignFirstResponder];
    [self.stateField resignFirstResponder];
    [self.zipcodeField resignFirstResponder];
    [self.genderField resignFirstResponder];
    
    switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
        case MS:
        case Diabetes:
        case COPD:
        case MM:
        case RA:
        case HepC:
        case PD:
        case IPF:
        case Asthma:
        case AAPA:
        case BC:
        case MDD:
        case MDSAML:
            [self.goalCholesterolField resignFirstResponder];
            [self.goalWeightField resignFirstResponder];
            [self.goalGlucoseField resignFirstResponder];
        break;
            
        default:
            break;
    }
//    if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//        ||[[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//        || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//        
//        [self.goalCholesterolField resignFirstResponder];
//        [self.goalWeightField resignFirstResponder];
//        [self.goalGlucoseField resignFirstResponder];
//    }

}


- (IBAction)savePressed:(id)sender
{
    
    if ([AppDelegate hasConnectivity]) {
        
        NSError *error = nil;
        
        if (self.emailField.text.length <= 0 ||
            self.firstNameField.text.length <= 0 ||
            self.lastNameField.text.length <= 0) {
            [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please fill all required fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            return;
        }
        
        //set all of the fields
        self.userProfile.email = self.emailField.text;
        self.userProfile.firstName = self.firstNameField.text;
        self.userProfile.lastName = self.lastNameField.text;
        
        self.dateFormatter.dateFormat = kDateFormat;
        self.userProfile.dob = [self.dateFormatter dateFromString:self.birthdayField.text];
        
        if (self.heightField.text.length > 0) {
            self.userProfile.height = [NSNumber numberWithFloat:[self.heightField.text floatValue]];
            
        }
        
        if (self.weightField.text.length > 0) {
            self.userProfile.weight = [NSNumber numberWithInt:[self.weightField.text intValue]];
        }
        
        self.userProfile.city = self.cityField.text;
        self.userProfile.state = self.stateField.text;
        self.userProfile.zipcode = self.zipcodeField.text;
        self.userProfile.gender = self.genderField.text;
        
        switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
            case MS:
            case Diabetes:
            case COPD:
            case MM:
            case RA:
            case HepC:
            case PD:
            case IPF:
            case Asthma:
            case AAPA:
            case BC:
            case MDD:
            case MDSAML:
                
                if (self.goalCholesterolField.text.length > 0) {
                    self.userProfile.goalCholesterol = [NSNumber numberWithInt:[self.goalCholesterolField.text intValue]];
                }
                
                if (self.goalGlucoseField.text.length > 0) {
                    self.userProfile.goalHbaonec = [NSNumber numberWithFloat:[self.goalGlucoseField.text floatValue]]; // Change to float in order to get the decimals  -- rv 5/6/14
                    NSLog(@"goal Glucose: %@", self.userProfile.goalHbaonec);
                }
                
                if (self.goalWeightField.text.length > 0) {
                    self.userProfile.goalWeight = [NSNumber numberWithInt:[self.goalWeightField.text intValue]];
                    NSLog(@"Goal Weight:%@", self.userProfile.goalWeight);
                }
            break;
                
            default:
                break;
        }
//        if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//            ||[[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//            || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//            
//            if (self.goalCholesterolField.text.length > 0) {
//                self.userProfile.goalCholesterol = [NSNumber numberWithInt:[self.goalCholesterolField.text intValue]];
//                
//            }
//            
//            if (self.goalGlucoseField.text.length > 0) {
//                self.userProfile.goalHbaonec = [NSNumber numberWithFloat:[self.goalGlucoseField.text floatValue]]; // Change to float in order to get the decimals  -- rv 5/6/14
//                NSLog(@"goal Glucose: %@", self.userProfile.goalHbaonec);
//                
//            }
//            
//            if (self.goalWeightField.text.length > 0) {
//                self.userProfile.goalWeight = [NSNumber numberWithInt:[self.goalWeightField.text intValue]];
//                
//                NSLog(@"Goal Weight:%@", self.userProfile.goalWeight);
//                
//            }
//        }

        
        [self.userProfile update:&error];
        
        if (error != nil) {
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else{
            //extract the error information
            NSDictionary *userInfo = error.userInfo;
            int errorCode = [[userInfo objectForKey:@"ss"] intValue];            
            
            NSString *message = @"";
            
            if (errorCode == 409) {
                message = @"An account is already registered with that e-mail address.";
            }
            else {
                message = @"We were unable to complete this request, please try again.";
            }
            
            
            [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
        }
        else {
            //[[[UIAlertView alloc] initWithTitle:@"Success" message:@"You profile has been updated." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            
        }
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
