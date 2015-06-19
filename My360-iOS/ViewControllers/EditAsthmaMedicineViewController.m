//
//  EditAsthmaMedicineViewController.m
//  My360-iOS
//
//  Created by Savio Vaz on 10/27/14.
//
//

#import "EditAsthmaMedicineViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import <APSDK/Symptom.h>
#import "AuthManager+Rules.h"
#import "MyAsthmaActionPlanFormViewController.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "ConfigurationManager.h"
#import "JournalCell.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"
//#import <APSDk/PatientAsthma+Remote.h>
//#import <APSDk/PatientAsthma.h>
#import "AsthmaActionMedicationTableViewCell.h"
#import <APSDk/PatientAsthmaActionMedication+Remote.h>
#import <APSDk/PatientAsthmaActionMedication.h>

@interface EditAsthmaMedicineViewController ()

@end

@implementation EditAsthmaMedicineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"***KEY ID Edit=%@", self.myActionPlanID);
//    float sizeFont = 13.0;
    NSLog(@" viewDidLoad for EditAsthmaMedicineViewController");
    if (self.currentAsthmaMedicationObject ) {
        
        self.medicine.text = self.currentAsthmaMedicationObject.medication;
        self.dose.text = self.currentAsthmaMedicationObject.dose;
        self.frequency.text = self.currentAsthmaMedicationObject.frequency;
        
        self.medicine.inputAccessoryView = self.inputToolbar;
        self.medicine.returnKeyType = UIReturnKeyNext;
        self.dose.inputAccessoryView = self.inputToolbar;
        self.dose.returnKeyType = UIReturnKeyNext;
        self.frequency.inputAccessoryView = self.inputToolbar;
        self.frequency.returnKeyType = UIReturnKeyNext;
        
//        self.dose.attributedPlaceholder =
//        [[NSAttributedString alloc] initWithString:@"ButtonText"
//                                        attributes:@{   NSFontAttributeName : [UIFont fontWithName:@"Roboto-Bold" size:sizeFont]
//                                                        }
//         ];
       
    }
    
    
}

- (IBAction)keyboardDonePressed:(id)sender
{
    NSLog(@"keyboardDonePressed");
    [self.medicine resignFirstResponder];
    [self.dose resignFirstResponder];
    [self.frequency resignFirstResponder];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)back {
    //    [super back];
    
    
    [self saveAction:nil];
    
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1) {
        //user clicked OK so make the change
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}



- (IBAction)saveAction:(id)sender {
    
    NSLog(@"Save old/New medicine");
    
    if ([self.medicine.text isEqualToString:@""]) {
    
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Medicatiion cannot be empty" message:@"Do you want to return without saving a Medication?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alertView show];
        
        return;
    }

    
    [self pushBusyOperation];
  
    
    self.currentAsthmaMedicationObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
    self.currentAsthmaMedicationObject.appId = [[ConfigurationManager sharedManager] appID]  ;
    [self.currentAsthmaMedicationObject setPostedDate: [NSDate date]];
    
    
    
    // Key to parent Table!!!
    self.currentAsthmaMedicationObject.patientAsthmaActionIdSeq = self.myActionPlanID;
    self.currentAsthmaMedicationObject.medicationType  = self.medicationType;
 
    
     self.currentAsthmaMedicationObject.medication= self.medicine.text;
     self.currentAsthmaMedicationObject.dose= self.dose.text ;
     self.currentAsthmaMedicationObject.frequency=self.frequency.text ;
    
    
    
    //    if ([self.myActionPlanID isEqualToNumber:[NSNumber numberWithInt:0]]) {
    
    if (self.editMode) {
        
        
        //UPDATE ROW
        
        NSError *err = nil;
        [self.currentAsthmaMedicationObject update:&err];
        
        if(err){
            if(ERROR_CODE_401(err)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else [self showMessage:@"Asthma Action record failed to save."];
            //return  ;
        }
        else {
            NSLog(@"Update successful ***********");
             [self.navigationController popViewControllerAnimated:YES];
        }
        
        
        
        
    }else{
        //INSERT ROW
        
        PatientAsthmaActionMedication *newAsthmaMedicationObject = [PatientAsthmaActionMedication new];
        
        newAsthmaMedicationObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        newAsthmaMedicationObject.appId = [[ConfigurationManager sharedManager] appID]  ;
        [newAsthmaMedicationObject setPostedDate: [NSDate date]];
        
        newAsthmaMedicationObject.medicationType = self.medicationType;
        newAsthmaMedicationObject.patientAsthmaActionIdSeq = self.myActionPlanID;
        newAsthmaMedicationObject.medication = self.medicine.text;
         newAsthmaMedicationObject.dose = self.dose.text;
         newAsthmaMedicationObject.frequency = self.frequency.text;
        
        [newAsthmaMedicationObject  createAsync:^(id obj, NSError * error) {
            if (error) {
                [self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:@"New Asthma Medicine record failed to add."];
            } else {
                //                [self popBusyOperation];
                //[_self showMessage:@"Alerts record successfully saved."];
                NSLog(@"createAsync Success  " );
                //                [self dismissViewControllerAnimated:YES completion:nil];
                [self.navigationController popViewControllerAnimated:YES];
                
                
            }
        }];
        
        
    }
    
//
    
    
    [self popBusyOperation];
    
}

@end
