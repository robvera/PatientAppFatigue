//
//  RegisterViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 2/27/13.
//
//

#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import <APSDK/UserProfile.h>
#import <APSDK/APObject+Remote.h>
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"
#import "PIKAnalyticsManager.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
#import "ConfigurationManager.h"

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)



@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize contentView;
@synthesize emailField;
@synthesize confirmEmailField;
@synthesize passwordField;
@synthesize confirmPasswordField;
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



- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if (IS_IPAD){
//                UIScrollView* scrollView= [self.view.subviews lastObject];
//                UIView *view1 = [scrollView.subviews objectAtIndex:0];
//                NSLog(@"---View=1 %@, Tag= %d", view1, view1.tag);
//                //    UIView* contentView= [[UIView alloc] initWithFrame:view1.bounds];
//                //    for (UIView *v  in view1.subviews) {
//                //        NSLog(@"View== %d, %@",v.tag, v);
//                //    }
//      
//                view1.transform = CGAffineTransformMakeScale(2.0, 2.0);
//            //self.view.transform = CGAffineTransformMakeScale(768.0/320.0,1024/433.0);
//    }
//    
    self.stateData = @[@"Alabama", @"Alaska", @"American Samoa", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"District of Columbia", @"Florida", @"Georgia", @"Guam", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine",  @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Northern Marianas Islands", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Puerto Rico", @"Rhode Island", @"South Carolina",@"South Dakota",@"Tennessee", @"Texas", @"Utah",@"Vermont", @"Virginia", @"Virgin Islands",@"Washington",@"West Virginia", @"Wisconsin",@"Wyoming"];
    
    self.genderData = @[@"Male", @"Female"];
    //self.contentView.frame = self.view.bounds;
    CGSize contentSize = self.contentView.frame.size;
    contentSize.height += 44; //accomodate the navigation bar
    self.scrollView.contentSize = contentSize;
    
    CGRect scrollViewFrame = self.view.bounds;
    scrollViewFrame.origin.y += 44;
    scrollViewFrame.size.height -= 44;
    self.scrollView.frame = scrollViewFrame;
    self.contentView.backgroundColor = [UIColor clearColor];
    //self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    self.emailField.backgroundColor = [UIColor whiteColor];
    self.confirmEmailField.backgroundColor = [UIColor whiteColor];
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.confirmPasswordField.backgroundColor = [UIColor whiteColor];
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
    self.confirmEmailField.inputAccessoryView = self.inputToolbar;
    self.passwordField.inputAccessoryView = self.inputToolbar;
    self.confirmPasswordField.inputAccessoryView = self.inputToolbar;
    self.firstNameField.inputAccessoryView = self.inputToolbar;
    self.lastNameField.inputAccessoryView = self.inputToolbar;
    self.birthdayField.inputAccessoryView = self.inputToolbar;
    self.heightField.inputAccessoryView = self.inputToolbar;
    self.weightField.inputAccessoryView = self.inputToolbar;
    self.cityField.inputAccessoryView = self.inputToolbar;
    self.stateField.inputAccessoryView = self.inputToolbar;
    self.zipcodeField.inputAccessoryView = self.inputToolbar;
    self.genderField.inputAccessoryView = self.inputToolbar;
    
    // Set Keyboard
    self.emailField.returnKeyType = UIReturnKeyNext;
    self.confirmEmailField.returnKeyType = UIReturnKeyNext;
    self.passwordField.returnKeyType = UIReturnKeyNext;
    self.confirmPasswordField.returnKeyType = UIReturnKeyNext;
    self.firstNameField.returnKeyType = UIReturnKeyNext;
    self.lastNameField.returnKeyType = UIReturnKeyNext;
    self.cityField.returnKeyType = UIReturnKeyNext;
    self.zipcodeField.returnKeyType = UIReturnKeyNext;
    
    //these views use pickers for user input
    self.birthdayField.inputView = self.inputViewDatePicker;
    self.stateField.inputView = self.inputViewStatePicker;
    self.genderField.inputView = self.inputViewGenderPicker;

    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self navigateNextTextField];
    
    return NO;
}

- (IBAction)inputViewDatePickerValueChanged
{
    self.birthdayField.text = [self.dateFormatter stringFromDate:self.inputViewDatePicker.date];
    
}


#pragma mark - Actions

- (IBAction)keyboardDonePressed:(id)sender
{
    [self.emailField resignFirstResponder];
    [self.confirmEmailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.confirmPasswordField resignFirstResponder];
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.birthdayField resignFirstResponder];
    [self.heightField resignFirstResponder];
    [self.weightField resignFirstResponder];
    [self.cityField resignFirstResponder];
    [self.stateField resignFirstResponder];
    [self.zipcodeField resignFirstResponder];
    [self.genderField resignFirstResponder];
    
}


- (IBAction)savePressed:(id)sender
{
    
    NSString *passwordString = self.passwordField.text;
    NSString *confirmPasswordString = self.confirmPasswordField.text;
    NSString *emailString = self.emailField.text;
    NSString *confirmEmailString = self.confirmEmailField.text;
    
    if (passwordString.length <= 0 ||
        emailString.length <= 0 ||
        self.firstNameField.text.length <= 0 ||
        self.lastNameField.text.length <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please fill all required fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else if (![passwordString isEqualToString:confirmPasswordString]) {
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Passwords do not match. Please correct." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else if (passwordString.length < 6) {
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Password must have at least 6 characters. Please correct." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else if (![emailString isEqualToString:confirmEmailString]) {
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Email addresses do not match. Please correct." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else {
        
        if ([AppDelegate hasConnectivity]) {
            
            [self pushBusyOperation];
       
            NSError *error = nil;
            
            UserProfile *newUser = [UserProfile new];
            
            newUser.email = self.emailField.text;
            newUser.password = self.passwordField.text;
            newUser.passwordConfirmation = self.confirmPasswordField.text;
            newUser.firstName = self.firstNameField.text;
            newUser.lastName = self.lastNameField.text;
            self.dateFormatter.dateFormat = kDateFormat;
            
            newUser.dob = [self.dateFormatter dateFromString:self.birthdayField.text];
            
            if (self.heightField.text.length > 0) {
                newUser.height = [NSNumber numberWithInt:[self.heightField.text intValue]];

            }
            if (self.weightField.text.length > 0) {
                newUser.weight = [NSNumber numberWithInt:[self.weightField.text intValue]];
            }
            
            newUser.city = self.cityField.text;
            newUser.state = self.stateField.text;
            newUser.zipcode = self.zipcodeField.text;
            newUser.gender = self.genderField.text;
            
            [newUser create:&error];

            if (error) {
                
                //extract the error information
                NSDictionary *userInfo = error.userInfo;
                int errorCode = [[userInfo objectForKey:kErrorCodeSS] intValue];
                
                NSString *message = @"";
                
                if (errorCode == 409) {
                    message = @"An account is already registered with that e-mail address.";
                }
                else if (errorCode == 422) {
                        message = @"An account is already registered with that e-mail address.";
                }
                else{
                    message = @"We were unable to complete this request, please try again.";
                    NSLog(@"%@",[error localizedDescription]);
                }
                
                [self popBusyOperation];
                
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
            else {
                [PIKAnalyticsManager sendAnalyticsToURLWithParams:
                 [NSString stringWithFormat:@"register.cfm?book=%@&udid=%@&user=%@",
                  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],
                 /*[[UIDevice currentDevice]uniqueIdentifier]*/@"",
                 ((User *)[AuthManager defaultManager].currentCredentials).id]];
                
                //[[[UIAlertView alloc] initWithTitle:@"Registration successful" message:@"You can log in using your email and password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                
                //[self dismissViewControllerAnimated:YES completion:nil];
                
                User *user = [User new];
                user.email = newUser.email;
                user.password = self.passwordField.text;
                user.appId = [[ConfigurationManager sharedManager] appID];

                
                [[AuthManager defaultManager] signInAs:user async:^(id<Authorizable> object, NSError *error) {
                    
                    if (error != nil) {
                        
                        NSString *message = @"The information you entered was incorrect. Please try again.";
                        
                        //extract the error information
                        NSDictionary *userInfo = error.userInfo;
                        int errorCode = [[userInfo objectForKey:@"ss"] intValue];
                        
                        
                        if (errorCode == 401) {
                            message = @"Invalid login credentials.";
                        }
                        else if (errorCode == 404) {
                            
                            message = @"User email does not exist.";
                        }
                        else {
                            message = @"The e-mail address and password do not match our records. Please try again or select the \"I forgot my password\" link.";
                        }
                        
                        self.emailField.enabled = YES;
                        self.passwordField.enabled = YES;
                        self.passwordField.text = @"";
                        
                        [self popBusyOperation];
                        [[[UIAlertView alloc] initWithTitle:@"Failure" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                    }
                    else {
                        //Success
                        
                        self.emailField.enabled = YES;
                        self.passwordField.enabled = YES;
                        self.passwordField.text = @"";
                        
                        //NSString * channel = [NSString stringWithFormat:@"%d",[user.id intValue]];
                        NSString * channel = [NSString stringWithFormat:@"%@_%@", [[ConfigurationManager sharedManager] appID] , user.id];
                        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [AppDelegate subscribeToChannel:channel withToken:[ad apnToken]];
                        ad.sessionOpen = TRUE;
                        [PIKAnalyticsManager sendAnalyticsToURLWithParams:[NSString stringWithFormat:@"run.cfm?book=%@&udid=%@&user=%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], [NSNumber numberWithInt:0], user.id]];
                        
                        
                        [self popBusyOperation];
                        
                        //[self performSegueWithIdentifier:@"LoggedInSegue" sender:self];
                        [((AppDelegate*)[[UIApplication sharedApplication] delegate]) setRootTabBar];
                    }
                }];

            }
        }
        else
        {
            [AppDelegate showNoConnecttivityAlert];
        }
    }
}


- (IBAction)cancelPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
