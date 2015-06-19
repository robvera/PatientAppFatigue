//
//  EditAllergyPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "EditAllergyPageViewController.h"
#import <APSDK/User.h>
#import <APSDK/APObject+Remote.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import <APSDK/AuthManager.h>
#import "UIColor+APColorExtension.h"



@interface EditAllergyPageViewController ()

@end

@implementation EditAllergyPageViewController

@synthesize userProfile = _userProfile;
@synthesize foodAllergySwitch;
@synthesize medicationAllergySwitch;
@synthesize seasonalAllergySwitch;


#pragma mark - Private


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    int yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 42 : 22;
    self.foodAllergySwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.view addSubview:self.foodAllergySwitch];
    self.foodAllergySwitch.onText = @"YES";
    self.foodAllergySwitch.offText = @"NO";
    self.foodAllergySwitch.onTintColor = [UIColor darkBlue];
    
    yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 84 : 64;
    self.medicationAllergySwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.view addSubview:self.medicationAllergySwitch];
    self.medicationAllergySwitch.onText = @"YES";
    self.medicationAllergySwitch.offText = @"NO";
    self.medicationAllergySwitch.onTintColor = [UIColor darkBlue];
    
    yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 130 : 110;
    self.seasonalAllergySwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 77, 27)];
    [self.view addSubview:self.seasonalAllergySwitch];
    self.seasonalAllergySwitch.onText = @"YES";
    self.seasonalAllergySwitch.offText = @"NO";
    self.seasonalAllergySwitch.onTintColor = [UIColor darkBlue];
    
    
    if (self.userProfile) {
        
        [self.foodAllergySwitch setOn:[self.userProfile.foodAllergies boolValue]];
        [self.medicationAllergySwitch setOn:[self.userProfile.medicationAllergies boolValue]];
        [self.seasonalAllergySwitch setOn:[self.userProfile.seasonalAllergies boolValue]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

- (BOOL)saveTapped
{
    
    if (self.userProfile) {
        
        self.userProfile.foodAllergies = [NSNumber numberWithBool:self.foodAllergySwitch.on];
        self.userProfile.medicationAllergies = [NSNumber numberWithBool:self.medicationAllergySwitch.on];
        self.userProfile.seasonalAllergies = [NSNumber numberWithBool:self.seasonalAllergySwitch.on];
        self.userProfile.allergiesSet = [NSNumber numberWithBool:YES];
        
        
        [self pushBusyOperation];
        __block EditAllergyPageViewController * _self = self;
        
        [self.userProfile updateAsync:^(id obj, NSError * error) {
            if (error) {
                [_self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [_self showMessage:@"Allergies record failed to save."];
            } else {
                [_self popBusyOperation];
                //[_self showMessage:@"Allergies record successfully saved."];
                [_self.navigationController popViewControllerAnimated:YES];

            }
        }];
        
        return true;
    }
    else return false;
}

-(void)back{
    if([self saveTapped]) [super back];
    else return;
}




@end
