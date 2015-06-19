//
//  EditCaregiverViewController.m
//  MSPatient
//
//  Created by David Benko on 5/16/13.
//
//

#import "EditCaregiverViewController.h"
#import <APSDK/APObject+Remote.h>
#import "UIColor+APColorExtension.h"
#import <APSDK/User+Remote.h>
#import <APSDK/AuthManager.h>
#import <APSDK/Patient+Remote.h>
#import "PikConstants.h"
#import <APSDK/APObject+Remote.h>
#import "UIView+APViewExtensions.h"
#import "MBProgressHUD.h"
#import "UIViewController+UI.h"

@interface EditCaregiverViewController ()

@end

@implementation EditCaregiverViewController

@synthesize cgEmail;
@synthesize cgName;
@synthesize cgPhone;
@synthesize shouldEmail;
@synthesize shouldSMS;
@synthesize patientCaregiver;
@synthesize inputAccessoryViewToolbar = _inputAccessoryViewToolbar;

- (void)viewDidLoad
{
    
    int yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 214 : 194;
    self.shouldSMS = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.view addSubview:self.shouldSMS];
    self.shouldSMS.onText = @"YES";
    self.shouldSMS.offText = @"NO";
    self.shouldSMS.onTintColor = [UIColor darkBlue];
    
    yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 170 : 150;
    self.shouldEmail = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.view addSubview:self.shouldEmail];
    self.shouldEmail.onText = @"YES";
    self.shouldEmail.offText = @"NO";
    self.shouldEmail.onTintColor = [UIColor darkBlue];
    
    self.cgEmail.inputAccessoryView = [self inputAccessoryViewToolbar];
    self.cgName.inputAccessoryView = [self inputAccessoryViewToolbar];
    self.cgPhone.inputAccessoryView = [self inputAccessoryViewToolbar];
    
    //[self pushBusyOperation];
    
    if ([AppDelegate hasConnectivity])
    {
        [self pushBusyOperation];
        [PatientCaregiver query:@"my_caregiver" params:nil offset:0 limit:kListLength async:^(NSArray *objects, NSError *error) {
            if (error) {
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [[[UIAlertView alloc]initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
            } else {
                if(objects.count > 0){
                    self.patientCaregiver = (PatientCaregiver *)[objects objectAtIndex:0];
                    [self.shouldEmail setOn:[self.patientCaregiver.emailNotifications boolValue]];
                    [self.shouldSMS setOn:[self.patientCaregiver.smsNotifications boolValue]];
                    self.cgEmail.text = self.patientCaregiver.email;
                    self.cgName.text = self.patientCaregiver.name;
                    self.cgPhone.text = self.patientCaregiver.phone;
                }
                else{
                    self.patientCaregiver = [PatientCaregiver new];
                    //self.patientCaregiver.patient.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
                    Patient *me = [Patient new];
                    me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
                    self.patientCaregiver.patient = me;
                    self.patientCaregiver.smsNotifications = @0;
                    self.patientCaregiver.emailNotifications = @0;
                    self.patientCaregiver.name = @"";
                    self.patientCaregiver.phone = @"";
                    self.patientCaregiver.email = @"";
                    
                    [self.patientCaregiver createAsync:^(id obj, NSError * error) {
                        if(error){
                            [[[UIAlertView alloc]initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
                            [self.navigationController popViewControllerAnimated:YES];
                        }
                        else {
                            self.patientCaregiver = (PatientCaregiver *)obj;
                        }
                    }];
                }
            }
            [self popBusyOperation];
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    //[self popBusyOperation];
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
    }
    [self saveTapped];
    [super viewWillDisappear:animated];
}


#pragma mark - Actions

- (IBAction)saveTapped
{
    self.patientCaregiver.name = self.cgName.text;
    self.patientCaregiver.phone = self.cgPhone.text;
    self.patientCaregiver.email = self.cgEmail.text;
    self.patientCaregiver.emailNotifications = [NSNumber numberWithBool:self.shouldEmail.on];
    self.patientCaregiver.smsNotifications = [NSNumber numberWithBool:self.shouldSMS.on];
    
        //[self pushBusyOperation];
        __block EditCaregiverViewController * _self = self;
        
        [self.patientCaregiver updateAsync:^(id obj, NSError * error) {
            if (error) {
                //[_self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                //else [_self showMessage:@"Caregiver record failed to save."];
            } else {
                //[_self popBusyOperation];
                //[_self showMessage:@"Alerts record successfully saved."];
                [_self.navigationController popViewControllerAnimated:YES];
                
            }
        }];
}

- (UIToolbar *)inputAccessoryViewToolbar
{
    if (!_inputAccessoryViewToolbar) {
        _inputAccessoryViewToolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
        [self.doneBarButtonItem setTarget:self];
        [self.doneBarButtonItem setAction:@selector(doneTyping)];
        _inputAccessoryViewToolbar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], self.doneBarButtonItem];
        
        [_inputAccessoryViewToolbar sizeToFit];
        
        _inputAccessoryViewToolbar.barStyle = UIBarStyleBlack;
        _inputAccessoryViewToolbar.translucent = YES;
    }
    
    return _inputAccessoryViewToolbar;
}
-(void)doneTyping {
    [self.cgEmail resignFirstResponder];
    [self.cgName resignFirstResponder];
    [self.cgPhone resignFirstResponder];
}


@end
