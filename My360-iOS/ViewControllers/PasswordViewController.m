//
//  PasswordViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/18/13.
//
//

#import "PasswordViewController.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import <APSDK/UserProfile.h>
#import <APSDK/APObject+Remote.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)


@interface PasswordViewController ()

@end

@implementation PasswordViewController

@synthesize scrollView;
@synthesize contentView;
@synthesize passwordField;
@synthesize confirmPasswordField;
@synthesize userProfile;




- (void)viewDidLoad
{
    [super viewDidLoad];

    if (IS_IPAD){
        UIScrollView* scrollView= [self.view.subviews lastObject];
        UIView *view1 = [scrollView.subviews objectAtIndex:0];
        NSLog(@"---View=1 %@", view1);
        //    UIView* contentView= [[UIView alloc] initWithFrame:view1.bounds];
        //    for (UIView *v  in view1.subviews) {
        //        NSLog(@"View== %d, %@",v.tag, v);
        //    }
        
        //view1.layer.transform = CATransform3DMakeScale(2.0, 2.0, 1);
        //view1.layer.transform = CATransform3DMakeScale(768.0/320.0,1024/410.0 , 1);
        view1.layer.transform = CATransform3DMakeScale(768.0/320.0,1024/410.0 , 1);
    }

    
    
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
                self.userProfile = [objects objectAtIndex:0]; //should only have one element
                                
            }
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    self.scrollView.frame = self.view.bounds;
    self.contentView.frame = self.view.bounds;
    CGSize contentSize = self.contentView.frame.size;
    self.scrollView.contentSize = contentSize;

    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.confirmPasswordField.backgroundColor = [UIColor whiteColor];

    self.passwordField.inputAccessoryView = self.inputToolbar;
    self.confirmPasswordField.inputAccessoryView = self.inputToolbar;
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.activeField = textField;
    
    return YES;
}

#pragma mark - Actions

- (IBAction)keyboardDonePressed:(id)sender
{
    [self.passwordField resignFirstResponder];
    [self.confirmPasswordField resignFirstResponder];
    
}


- (IBAction)savePressed:(id)sender
{
    NSString *passwordString = self.passwordField.text;
    NSString *confirmPasswordString = self.confirmPasswordField.text;
    
    
    if (![passwordString isEqualToString:confirmPasswordString]) {
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Passwords do not match. Please correct." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else if (passwordString.length < 6) {
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Password must have at least 6 characters. Please correct." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else {
        
        if ([AppDelegate hasConnectivity]) {
            
            self.userProfile.password = self.passwordField.text;
            self.userProfile.passwordConfirmation = self.confirmPasswordField.text;
            self.userProfile.resetPassword = [NSNumber numberWithBool:NO];
            
            [self pushBusyOperation];
            __unsafe_unretained PasswordViewController * _self = self;
            
            [self.userProfile updateAsync:^(id obj, NSError * error) {
                if (error) {
                    [_self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [_self showMessage:@"Unable to update your password."];
                } else {
                    [_self popBusyOperation];
                    [_self showMessage:@"Your password had been updated."];
                    //pass NO so the user is not forced to change their password the next time they login
                    //Pop back to the view they were at before
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }
            }];
        }
        else
        {
            [AppDelegate showNoConnecttivityAlert];
        }
    }
}



@end
