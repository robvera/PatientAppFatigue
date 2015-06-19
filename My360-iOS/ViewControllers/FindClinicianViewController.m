//
//  FindClinicianViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/18/13.
//
//

#import "FindClinicianViewController.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
#import "AuthManager+Rules.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/PatientClinician.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"
#import <APSDK/Patient+Remote.h>
#import <APSDK/ClinicianCodeRequest+Remote.h>
#import "EditClinicianViewController.h"

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)


@interface FindClinicianViewController ()

@end

@implementation FindClinicianViewController

@synthesize scrollView;
@synthesize contentView;
@synthesize codeField;
@synthesize messageLabel;
@synthesize nameLabel;
@synthesize currentClinicians;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.scrollView.frame = self.view.bounds;
//    self.contentView.frame = self.view.bounds;
//    CGSize contentSize = self.contentView.frame.size;
//    self.scrollView.contentSize = contentSize;
    
//    self.contentView.backgroundColor = [UIColor lightOrange];
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    
    self.codeField.backgroundColor = [UIColor whiteColor];
    
    self.codeField.inputAccessoryView = self.inputToolbar;
    
    //  addded fo make code UPPERCASE when entered          - svaz 7/7/14
    
    self.codeField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    
    [self.nameLabel setFont:[UIFont boldSystemFontOfSize:24.0f]];
    
    self.nameLabel.hidden = YES;
    self.messageLabel.hidden = YES;
    self.saveButton.hidden = YES;
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    
    CGSize contentSize = self.scrollView.contentSize;
    contentSize.height += 260; //add keyboard + toolbar height
    self.scrollView.contentSize = contentSize;
    
    
    
    return YES;
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGSize contentSize = self.scrollView.contentSize;
    contentSize.height -= 260; //subtract keyboard + toolbar height
    self.scrollView.contentSize = contentSize;
    
}


//  addded fo make code UPPERCASE when entered          - svaz 7/7/14
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSRange lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    
    if (lowercaseCharRange.location != NSNotFound) {
        textField.text = [textField.text stringByReplacingCharactersInRange:range
                                                                 withString:[string uppercaseString]];
        return NO;
    }
    
    return YES;
}





#pragma mark - Actions

- (IBAction)keyboardDonePressed:(id)sender
{
    [self.codeField resignFirstResponder];
    
}


- (IBAction)searchPressed:(id)sender
{
    NSString *codeString = self.codeField.text;
    
    
    if (codeString.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please enter a code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    [self.codeField resignFirstResponder];
    
    if ([AppDelegate hasConnectivity]) {
        
        [self pushBusyOperation];
        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:codeString, @"coupon_code", nil];
        
        [Clinician query:@"exact_match" params:queryAttributes async:^(NSArray * objects, NSError * error) {
            if ((error == nil) && (objects.count > 0)) {
                self.clinician = (Clinician *)[objects objectAtIndex:0];
                // First Check to make sure clinician is not already added
                for (PatientClinician *c in currentClinicians) {
                    if (c.id && self.clinician.id && [self.clinician.id isEqualToNumber:c.clinician.id]) {
                        self.messageLabel.text = [NSString stringWithFormat:@"%@ %@ has already been added.\nPlease try another code.",self.clinician.firstName,self.clinician.lastName];
                        self.nameLabel.text =@"";
                        self.saveButton.hidden = YES;
                        self.messageLabel.hidden = NO;
                        self.clinician = nil;
                        [self popBusyOperation];
                        return;
                    }
                }
                
                self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.clinician.firstName, self.clinician.lastName];
                self.nameLabel.hidden = NO;
                self.messageLabel.text = @"If this is the care provider you are looking for, tap save.";
                self.messageLabel.hidden = NO;
                self.saveButton.hidden = NO;
                
            }
            else {
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else
                {
                    self.messageLabel.text = @"We were unable to locate the care provider. Please try again.";
                    self.nameLabel.text = @"";
                    self.saveButton.hidden = YES;
                    self.messageLabel.hidden = NO;
                }
            }
            
            [self popBusyOperation];
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
}
-(IBAction)done:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self dismissModalViewControllerAnimated:YES];
}
- (IBAction)savePressed:(id)sender
{
    
    if ([AppDelegate hasConnectivity]) {
        
        PatientClinician *newClinician = [PatientClinician new];
        
        NSError *error = nil;
        
        Patient *me = [Patient new];
        me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
        
        Clinician *c = [Clinician new];
        c.id = self.clinician.id;
        c.clinicianType = self.clinician.clinicianType;
        c.couponCode = self.clinician.couponCode;
        c.email = self.clinician.email;
        c.firstName = self.clinician.firstName;
        c.lastName = self.clinician.lastName;
        
        newClinician.patient = me;
        newClinician.clinician = c;
        
        [newClinician create:&error];
        
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to add care provider." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
        else {
            
            self.messageLabel.text = @"Care Provider Added Successfully.";
            self.nameLabel.text = @"";
            self.saveButton.hidden = YES;
            self.messageLabel.hidden = NO;
            
            //[[[UIAlertView alloc] initWithTitle:@"Success" message:@"Clinician added." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
}

-(IBAction)sendRequestEmail:(id)sender{
// Change Functionality          - svaz 5/12/14
//    UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Enter care provider email address" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Send", nil];
//    [dialog setAlertViewStyle:UIAlertViewStylePlainTextInput];
//    
//    // Change keyboard type
//    [[dialog textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeEmailAddress];
//    [dialog show];
    
//    EditClinicianViewController *controller = [[EditClinicianViewController alloc] init];
    
    
//    (EditClinicianViewController *)[segue destinationViewController];
//    controller.currentClinicians = [NSArray arrayWithArray:currentClinicians];
    
//    [self presentViewController:controller animated:YES completion:nil];
    //           EditClinicianViewController *controller = (FindClinicianViewController *)[segue destinationViewController];





}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        ClinicianCodeRequest *ccr  = [ClinicianCodeRequest new];
        
        ccr.dateRequested = [NSDate date];
        ccr.emailAddress = [alertView textFieldAtIndex:0].text;
        Patient *me = [Patient new];
        me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
        ccr.patient = me;
        
        [self pushBusyOperation];
        __block FindClinicianViewController * _self = self;
        
        [ccr createAsync:^(id obj, NSError * error) {
            if (error) {
                [_self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [_self showMessage:@"Care Provider Code Request record failed to add."];
            } else {
                [_self popBusyOperation];
                
                //[_self showMessage:@"Journal record successfully added."];
                //[_self.navigationController popViewControllerAnimated:YES];
                //[_self dismissModalViewControllerAnimated:YES];
                [_self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
    }
}

@end
