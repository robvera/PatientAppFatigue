//
//  EditAlertsPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/27/13.
//
//

#import "EditAlertsPageViewController.h"
#import <APSDK/User.h>
#import <APSDK/APObject+Remote.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import <APSDK/AuthManager.h>
#import "UIColor+APColorExtension.h"

@interface EditAlertsPageViewController ()

@end

@implementation EditAlertsPageViewController

@synthesize userProfile = _userProfile;
@synthesize labAppointmentReminderSwitch;
@synthesize lastLoginAlertSwitch;
@synthesize medicationExpirationAlertSwitch;
@synthesize treatmentScheduleAlertSwitch;


#pragma mark - Private


- (void)viewDidLoad
{
    
    int yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 42 : 22;
    self.labAppointmentReminderSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.view addSubview:self.labAppointmentReminderSwitch];
    self.labAppointmentReminderSwitch.onText = @"YES";
    self.labAppointmentReminderSwitch.offText = @"NO";
    self.labAppointmentReminderSwitch.onTintColor = [UIColor darkBlue];
    
    yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 84 : 64;
    self.lastLoginAlertSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.view addSubview:self.lastLoginAlertSwitch];
    self.lastLoginAlertSwitch.onText = @"YES";
    self.lastLoginAlertSwitch.offText = @"NO";
    self.lastLoginAlertSwitch.onTintColor = [UIColor darkBlue];
    
    yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 130 : 100;
    self.medicationExpirationAlertSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 77, 27)];
    [self.view addSubview:self.medicationExpirationAlertSwitch];
    self.medicationExpirationAlertSwitch.onText = @"YES";
    self.medicationExpirationAlertSwitch.offText = @"NO";
    self.medicationExpirationAlertSwitch.onTintColor = [UIColor darkBlue];
    
    yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 172 : 152;
    self.treatmentScheduleAlertSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 77, 27)];
    [self.view addSubview:self.treatmentScheduleAlertSwitch];
    self.treatmentScheduleAlertSwitch.onText = @"YES";
    self.treatmentScheduleAlertSwitch.offText = @"NO";
    self.treatmentScheduleAlertSwitch.onTintColor = [UIColor darkBlue];
    [self pushBusyOperation];

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
                [self.labAppointmentReminderSwitch setOn:[self.userProfile.labApptReminderAlert boolValue]];
                [self.lastLoginAlertSwitch setOn:[self.userProfile.lastLoginAlert boolValue]];
                [self.medicationExpirationAlertSwitch setOn:[self.userProfile.educationalReadingsAlter boolValue]];
                [self.treatmentScheduleAlertSwitch setOn:[self.userProfile.treatmentScheduleAlert boolValue]];
            
            }
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    [self popBusyOperation];
    
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
        [self saveTapped];
    }
    
    [super viewWillDisappear:animated];
}


#pragma mark - Actions

- (BOOL)saveTapped
{
    
    if (self.userProfile) {
        self.userProfile.labApptReminderAlert = [NSNumber numberWithBool:self.labAppointmentReminderSwitch.on];
        self.userProfile.lastLoginAlert = [NSNumber numberWithBool:self.lastLoginAlertSwitch.on];
        self.userProfile.educationalReadingsAlter = [NSNumber numberWithBool:self.medicationExpirationAlertSwitch.on];
        self.userProfile.treatmentScheduleAlert = [NSNumber numberWithBool:self.treatmentScheduleAlertSwitch.on];
        
        
        [self pushBusyOperation];
        __block EditAlertsPageViewController * _self = self;
        
        [self.userProfile updateAsync:^(id obj, NSError * error) {
            if (error) {
                [_self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [_self showMessage:@"Alerts record failed to save."];
            } else {
                [_self popBusyOperation];
                //[_self showMessage:@"Alerts record successfully saved."];

            }
        }];
        return true;
    }
    else return false;
}


@end
