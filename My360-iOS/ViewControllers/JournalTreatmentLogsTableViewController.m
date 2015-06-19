//
//  JournalTreatmentLogsTableViewController.m
//  My360-iOS
//
//  Created by Savio Vaz on 3/31/14.
//
//

#import "JournalTreatmentLogsTableViewController.h"
//#import "DCRoundSwitchAlternative.h"
#import "DCRoundSwitch.h"
#import "UIViewController+UI.h"
#import <APSDK/MissingTreatmentReason.h>
#import "JournalReasonCell.h"
#import <APSDK/PatientAdherenceLog.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"
#import <APSDK/Patient+Remote.h>
#import <APSDK/PatientTreatment.h>
#import <APSDK/TreatmentSchedule.h>
#import "PIKCommon.h"
#import "Flurry.h"
#import <QuartzCore/QuartzCore.h>



@interface JournalTreatmentLogsTableViewController ()
<UIPickerViewDelegate, UIPickerViewDataSource, UIAlertViewDelegate>

//@property (nonatomic, strong) DCRoundSwitchAlternative * reasonSwitch;
@property (nonatomic, strong, readonly) UIPickerView * inputMedicationReasonMissedPicker;
@property (nonatomic, strong) NSArray *missingTreatmentReasonData;

@property (strong, nonatomic) MissingTreatmentReason *missingTreatmentReason;
@property (strong, nonatomic) UITextField *currentReasonTextField;
@property (strong, nonatomic) JournalReasonCell *currentCell;
@property (nonatomic, strong) PatientAdherenceLog * patientAdherenceLog;

@property (nonatomic, strong) DCRoundSwitch * tookMedicationSwitch;
@property(nonatomic, retain) UIColor *tintColor;

@end

@implementation JournalTreatmentLogsTableViewController

NSIndexPath *currentIndexPath;
NSInteger   currentSelectedRow;
NSIndexPath* pathOfTheCell ;
NSInteger rowOfTheCell;


#pragma MARK - SAVE METHODS

- (IBAction)saveTapped {
    [self  resignFirstResponder];
    [self pushBusyOperation];
    
    NSInteger  rowsCount =  [takingMedications count];
    
    for (NSInteger i = 0 ; i< rowsCount; i++) {
        NSMutableDictionary *objectToUpdateORSave = [takingMedications objectAtIndex:i];
        NSString *recordStatus = [[takingMedications objectAtIndex:i] objectForKey:@"recordStatus"];
        NSString *recordModifiedStatus = [[takingMedications objectAtIndex:i] objectForKey:@"recordModifiedStatus"];
        //        NSString *medicationFromTreatment = [[takingMedications objectAtIndex:i] objectForKey:@"medicationFromTreatment"];
        //        NSLog(@"%@: %@ / %@ ",medicationFromTreatment, recordStatus ,recordModifiedStatus);
        if ([recordStatus isEqualToString:@"recordNEW"]  ) {
            
            if ( [recordModifiedStatus isEqualToString:@"recordNEWModified"]) {
                //RESET STATUS
                if ([self insert:objectToUpdateORSave] ) {
                    [[ takingMedications objectAtIndex:i] setObject: @""  forKey:@"recordModifiedStatus"];
                }
                else{
                    // Error in saving a record
                    [self popBusyOperation];
                    return;
                }
            }
            else{
                NSLog(@"NOTHING TO INSERT");
            }
        }
        else if ([recordStatus isEqualToString:@"recordOLD"]  ) {
            
            if ( [recordModifiedStatus isEqualToString:@"recordOLDModified"]) {
                //RESET STATUS
                if ( [self update:objectToUpdateORSave]  ) {
                    [[ takingMedications objectAtIndex:i] setObject: @""  forKey:@"recordModifiedStatus"];
                    
                }
                else{
                    // Error in saving a record
                    [self popBusyOperation];
                    return;
                }
            }
            else{
                NSLog(@"NOTHING TO UPDATE");
            }
        }
    }
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"saveTapped Do some work");
        [self popBusyOperation];
        [self popBusyOperation];
    });
    
//      [[PIKCommon sharedInstance] popLayerMessage:self.view message:@"Journal Saved Successfully"];
}

- (BOOL)insert:(NSMutableDictionary *)object{
    __block BOOL status;
    
    NSNumber *missingTreatmentReasonId= [object objectForKey:@"missingTreatmentReasonId"];
    if (missingTreatmentReasonId == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Treatment Reason"
                                                        message:@"Please check carefully and enter a Treatment Reason for one of your Medications Logs"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
        
    }
    
    NSLog(@" ** CREATE recordNEW: %@", object);
    PatientAdherenceLog * patientAdherenceLog = [PatientAdherenceLog new];
    patientAdherenceLog.patientTreatmentId = [object objectForKey:@"treatmentId"];
    patientAdherenceLog.timesMissedPerDay = [object objectForKey:@"timesMissedPerDay"];
    Patient *me = [Patient new];
    me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
    patientAdherenceLog.patient = me;
    patientAdherenceLog.tookMedication = [object objectForKey:@"tookMedication"];
    patientAdherenceLog.missingTreatmentReasonId = [object objectForKey:@"missingTreatmentReasonId"];
    NSDate *parsedDate = [self.common getParsedDate:self.common.currentDate];
    patientAdherenceLog.logOn = parsedDate;
//    [self pushBusyOperation];
   // NSError *err = nil;
   // [patientAdherenceLog create:&err];
    
    // added
    
    
     
     [patientAdherenceLog createAsync:^(id object, NSError *error) {
        
        [self popBusyOperation];
        
        if (error) {
            NSLog(@"error = %@",error);
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else {
                [self showMessage:@"Adherence Log record failed to add."];
                status= NO;
            }
        }     else {
            
            [[NSNotificationCenter defaultCenter] postNotificationName: @"adherenceAdded" object:nil userInfo:nil];
            //[_self showMessage:@"Adherence Log record successfully added."];
            [self dismissViewControllerAnimated:YES completion:nil];
            status= YES;

            
        }
    }];
    
    // end added
    
    
    
//    NSError *err = nil;
//    [patientAdherenceLog create:&err];
//    
//    if (err) {
//
//        NSLog(@"Error:%@",err);
//        if( ERROR_CODE_401(err)) {
//            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//            [app showSessionTerminatedAlert];
//        }
//        else {
//            [self showMessage:@"Adherence Log record failed to add."];
//            status= NO;
//        }
//    } else {
//        [[NSNotificationCenter defaultCenter] postNotificationName: @"adherenceAdded" object:nil userInfo:nil];
//        //[_self showMessage:@"Adherence Log record successfully added."];
//        [self dismissViewControllerAnimated:YES completion:nil];
//        status= YES;
//        
//    }
    
    return status;
    
}

- (BOOL)update:(NSMutableDictionary *)object{
  __block  BOOL status;
    NSLog(@" ** UPDATE recordOLD: %@", object);
    //    if switch is NO and reason is "" - ALERT
    //    if switch is YES - set reason to ""
    NSNumber *missingTreatmentReasonId= [object objectForKey:@"missingTreatmentReasonId"];
    NSNumber *tookMedication = [object objectForKey:@"tookMedication"];
    if ( [tookMedication intValue] == 0  &&  [missingTreatmentReasonId intValue] == 0)  {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Treatment Reason"
                                                        message:@"Please check carefully and enter a Treatment Reason for one of your Medications Logs"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
        
    }
    
    if (missingTreatmentReasonId == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Treatment Reason"
                                                        message:@"Please check carefully and enter a Treatment Reason for one of your Medications Logs"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
        
        
        
    }
    
    PatientAdherenceLog * patientAdherenceLog = [PatientAdherenceLog new];
    patientAdherenceLog.timesMissedPerDay = [object objectForKey:@"timesMissedPerDay"];
    patientAdherenceLog.tookMedication = [object objectForKey:@"tookMedication"];
    patientAdherenceLog.missingTreatmentReasonId = [object objectForKey:@"missingTreatmentReasonId"];
    patientAdherenceLog.id =[object objectForKey:@"logId"];
    patientAdherenceLog.patientTreatmentId = [object objectForKey:@"treatmentId"];
    Patient *me = [Patient new];
    me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
    patientAdherenceLog.patient = me;
    
    NSString *passedString = [self.common getUTCFormateDate:[object objectForKey:@"logOn"]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *parsed = [dateFormatter dateFromString:passedString];
    
    patientAdherenceLog.logOn = parsed;
    //     patientAdherenceLog.logOn = [[self configureDateFormatter:self.dateFormatter field:self.adherenceLogOnTextField] dateFromString:self.adherenceLogOnTextField.text];
    
    patientAdherenceLog.patient.id = ((User *)[AuthManager defaultManager].currentCredentials).id;


   // Added
    [patientAdherenceLog updateAsync:^(id obj, NSError * error) {
        if (error) {
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else {
                [self showMessage:@"Adherence Log record failed to save."];
                status=NO;
            }
        
        } else {
            status=YES;
        }
    }];

    
    
    
    // end added
  
//    /* rEMOVED
//        NSError *err = nil;
//    [ patientAdherenceLog update:&err];
//    
//    if (err) {
//        if(ERROR_CODE_401(err)) {
//            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//            [app showSessionTerminatedAlert];
//        }
//        else {
//            [self showMessage:@"Adherence Log record failed to save."];
//            status=NO;
//        }
//    }
//    else {
//        status=YES;
//    }
//   END REMOVED *\
    
    return status;
}

#pragma mark - VC Methods

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) tappedOnCell:(id)sender{
    NSLog(@"tappedOnCell within JournalTreatmentLogsTableViewController");
    //    NSString *d = [self.tableView
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // [[PIKCommon sharedInstance] popLayerMessageWithInterval:self.view message:@"No treatment taken for this day" NSTimeInterval:3.00];
    
    //#if TRUE
   
/////////////////////////
    [self.view setBackgroundColor:[UIColor redColor]];
    
    //[self.navigationItem setHidesBackButton:NO];
//    self.navigationItem.leftBarButtonItem.title = @"";// nil;
    
    self.navigationController.navigationBar.topItem.title = @"";
   // self.navigationController.navigationBar..title = @"Back";
    
    self.currentCell.switchYESNO.layer.cornerRadius = 16.0; // you must import QuartzCore to do this
    
    
    if (self.currentCell.switchYESNO.on) {
        NSLog(@"If body ");
        [self.currentCell.switchYESNO setThumbTintColor:[UIColor redColor]];
        
        [self.currentCell.switchYESNO setBackgroundColor:[UIColor whiteColor]];
        [self.currentCell.switchYESNO setOnTintColor:[UIColor whiteColor]];
        
    }else{
        NSLog(@"Else body ");
        
        [self.currentCell.switchYESNO setTintColor:[UIColor clearColor]];
        
        [self.currentCell.switchYESNO setThumbTintColor:[UIColor redColor]];
        
        [self.currentCell.switchYESNO setBackgroundColor:[UIColor colorWithRed:138/256.0 green:9/256.0 blue:18/256.0 alpha:1]];
    }
/////////////////////////
    
    [Flurry logEvent:@"viewJournalList" timed:YES];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.common = [JournalReasonGlobalObject sharedInstance] ;
 
    self.title=@"Journal Logs";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable) name:@"RetrieveOfLogsComplete" object:nil];
    
    
    //set picker
    _inputMedicationReasonMissedPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    _inputMedicationReasonMissedPicker.delegate = self;
    _inputMedicationReasonMissedPicker.dataSource = self;
    _inputMedicationReasonMissedPicker.showsSelectionIndicator = YES;
    [_inputMedicationReasonMissedPicker sizeToFit];
    
    //Get Picker Data
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.missingTreatmentReasonData = ad.missingTreatmentReasonData ;
    
    if (takingMedications.count) {
        [self.tableView selectRowAtIndexPath:pathOfTheCell animated:YES scrollPosition:0];
    }

    
//#else
   // [[PIKCommon sharedInstance] popLayerMessageWithInterval:self.view message:@"WiFi or data connection is required" NSTimeInterval:3.00];

//#endif
}





- (void) doneBarButtonItemTapped {
    [super doneBarButtonItemTapped];
    [self setDataValues];
    [self.currentReasonTextField resignFirstResponder];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RetrieveOfLogsComplete" object:nil];
}

- (void) viewWillAppear:(BOOL)animated{
    [self pushBusyOperation];
    takingMedications = [self.common getJournalReasons];
    
    [self popBusyOperation];
    
    //RV added to remove the lable on the back button 4-26-15
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.topItem.title = @"";
    [self.navigationItem setTitle:@"Journal Logs"];


}

- (void) viewDidAppear:(BOOL)animated{
    if (takingMedications.count) {
        [self.tableView selectRowAtIndexPath:pathOfTheCell animated:YES scrollPosition:0];
    }

}

- (void) viewWillDisappear:(BOOL)animated{
    
    [self saveTapped];
}

- (void) reloadTable{
    [self pushBusyOperation];
    takingMedications = self.common.completeListOfObjects;
    [self.tableView reloadData];
    [self popBusyOperation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return takingMedications.count;
}

- (void) setDataValues{
    pathOfTheCell = [self.tableView indexPathForCell:self.currentCell];
    NSInteger rowOfTheCell = [pathOfTheCell row];
    [self.tableView selectRowAtIndexPath:pathOfTheCell animated:YES scrollPosition:rowOfTheCell];
    
    NSString * reasonCellText = self.currentCell.reason.text;
    NSLog(@"reasonCellText: %@", reasonCellText);
    
    //    NSNumber * isOn = [NSNumber numberWithBool:self.reasonSwitch.on];
    
    
    NSMutableDictionary *currObjectToDisplay = [ takingMedications objectAtIndex:pathOfTheCell.row];
    NSNumber * missingTreatmentReasonId;
    NSNumber * timesMissedPerDay  ;
    NSString *recordModifiedStatus,  *recordStatus;
    if (![reasonCellText isEqualToString:@""]  ) {
        
        recordStatus = [currObjectToDisplay objectForKey:@"recordStatus"];
        
        for (MissingTreatmentReason *reason in  self.missingTreatmentReasonData) {
            if ([reasonCellText isEqualToString:reason.name]) {
                missingTreatmentReasonId =reason.id;
                timesMissedPerDay = [NSNumber  numberWithInt:1];
                break;
            }
        }
        
    }else{
        //        NSLog(@"empty reason:");
        missingTreatmentReasonId = [NSNumber  numberWithInt:0];
        timesMissedPerDay = [NSNumber  numberWithInt:0];
    }
    //        CHECK AND SET CURRENT STATUS
    if ([recordStatus isEqualToString:@"recordNEW"]) {
        recordModifiedStatus = @"recordNEWModified";
    }
    else if ([recordStatus isEqualToString:@"recordOLD"])
    {// = recordOLD , i. e its  a   has   ADHERENCE log
        recordModifiedStatus = @"recordOLDModified";
    }
    [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject: missingTreatmentReasonId  forKey:@"missingTreatmentReasonId"];
    [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject: timesMissedPerDay  forKey:@"timesMissedPerDay"];
    [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject: recordModifiedStatus  forKey:@"recordModifiedStatus"];
}

////////////////////////////
//- (IBAction)toggleTookMedicationSwitch2:(UISwitch *)sender {
//
//    
//    [[UISwitch appearance] setOnTintColor:[UIColor colorWithRed:104.0/255 green:73.0/255 blue:54.0/255 alpha:1.0]];
//    [[UISwitch appearance] setTintColor:[UIColor colorWithRed:213.0/255 green:183.0/255 blue:165.0/255 alpha:1.000]];
//    [[UISwitch appearance] setThumbTintColor:[UIColor colorWithRed:125.0/255 green:30.0/255 blue:21.0/255 alpha:1.000]];
//    
//    UISwitch* apSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(72, 60, 63, 23)];
//    [self.view addSubview:apSwitch];
//
//    [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"yesSwitch"]];
//    [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"noSwitch"]];
//    
//    
//    
//    int yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 59 : 69;
//    self.tookMedicationSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(120, yVal, 79, 27)];
//
////if (shouldShowSymptonSwitch) {
////     if (self.currentCell.switchYESNO.isOn) {
//    [self.view addSubview:self.currentCell.switchYESNO];
//    self.tookMedicationSwitch.onText = @"YES";
//    self.tookMedicationSwitch.offText = @"NO";
//    self.tookMedicationSwitch.onTintColor = [UIColor darkBlue];
//         self.currentCell.reason.hidden = YES;
//         self.currentCell.labelReasonWhy.hidden = YES;
//
//    // EDIT THE CURRENT ARRAY OF DISCTIONARIES
//    [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:1] forKey:@"tookMedication"];
//    [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"timesMissedPerDay"];
//    [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"missingTreatmentReasonId"];
//     }
//     else{
//         //DID NOT TAKE MEDICATION - IE IT IS SET TO "NO"
//         self.currentCell.reason.hidden = NO;
//         self.currentCell.labelReasonWhy.hidden = NO;
//         self.currentCell.reason.text = @"";
//         [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"tookMedication"];
//         [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:1] forKey:@"timesMissedPerDay"];
//         }
//    
//}

////////////////////////////////

- (IBAction)toggleTookMedicationSwitch:(UISwitch *)sender {
    
    //    UISwitch *sw = (UISwitch *) sender;
    

    NSIndexPath *myIP = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    //Type cast it to CustomCell
    self.currentCell   = (JournalReasonCell*)[self.tableView cellForRowAtIndexPath:myIP];
    pathOfTheCell = [self.tableView indexPathForCell:self.currentCell];
    
    NSInteger rowOfTheCell = sender.tag  ; //[pathOfTheCell row];
    [self.tableView selectRowAtIndexPath:pathOfTheCell animated:YES scrollPosition:rowOfTheCell];
    
    NSMutableDictionary *currObjectToDisplay = [ takingMedications objectAtIndex:pathOfTheCell.row];
    //    NSString * tempTreatment = [currObjectToDisplay objectForKey:@"medicationFromTreatment"];
    //    NSLog(@" TREATMENT = %@", tempTreatment );

//    self.switchYESNO.onTintColor = [UIColor yellowColor]; // the "on" color
//    self.switchYESNO.tintColor = [UIColor redColor]; // the "off" color
//    self.switchYESNO.backgroundColor = [UIColor redColor];

    
    
    if (self.currentCell.switchYESNO.isOn) {
        self.currentCell.reason.hidden = YES;
        self.currentCell.labelReasonWhy.hidden = YES;
        // EDIT THE CURRENT ARRAY OF DISCTIONARIES
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:1] forKey:@"tookMedication"];
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"timesMissedPerDay"];
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"missingTreatmentReasonId"];
    }
    else{
        //DID NOT TAKE MEDICATION - IE IT IS SET TO "NO"
        self.currentCell.switchYESNO.tintColor = [UIColor redColor]; // the "off" color
       // [self.currentCell.switchYESNO setBackgroundColor:[UIColor redColor]];
        //self.currentCell.switchYESNO.backgroundColor = [UIColor redColor];
        
        self.currentCell.reason.hidden = NO;
        self.currentCell.labelReasonWhy.hidden = NO;
        self.currentCell.reason.text = @"";
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"tookMedication"];
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:1] forKey:@"timesMissedPerDay"];
        
    }
    
    NSString *status = [currObjectToDisplay objectForKey:@"recordStatus"];
    if ([status isEqualToString:@"recordNEW"]) {
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:@"recordNEWModified" forKey:@"recordModifiedStatus"];
    }
    else
    {//=====  recordOLD
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:@"recordOLDModified" forKey:@"recordModifiedStatus"];
    }
    
    
}




//- (IBAction)toggleTookMedication:(id)sender  {
//    
//    DCRoundSwitch  *senderButton = (DCRoundSwitch  *)sender;
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//        // Load resources for iOS 6.1 or earlier
//        self.currentCell = (JournalReasonCell *)[senderButton superview];
//    }
//    else if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0){
//        // Load resources for iOS 7 or later
//        self.currentCell = (JournalReasonCell *) senderButton.superview.superview.superview;
//    }else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
//        // Load resources for iOS 8 or later
//        self.currentCell = (JournalReasonCell *) senderButton.superview.superview.superview;
//        self.currentCell = (JournalReasonCell *) senderButton.superview.superview;
//        self.currentCell = (JournalReasonCell *) senderButton.superview;
//    }

- (IBAction)toggleTookMedication:(id)sender  {
    
    DCRoundSwitch  *senderButton = (DCRoundSwitch  *)sender;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 6.1 or earlier
        self.currentCell = (JournalReasonCell *)[senderButton superview];
    } else if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0){
        // Load resources for iOS 7 or later
        self.currentCell = (JournalReasonCell *) senderButton.superview.superview;
    }else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        // Load resources for iOS 8 or later
        //cell = (JournalReasonCell *) textField.superview.superview.superview;
        self.currentCell = (JournalReasonCell *) senderButton.superview.superview;
        //cell = (JournalReasonCell *)textField.superview;
    }

    
//    
//    if (NSFoundationVersionNumber == NSFoundationVersionNumber_iOS_6_1 ){
//        //Here goes the code for iOS 6.1
//        self.currentCell = (JournalReasonCell *)[senderButton superview];
//    }
//    
//    else if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1){
//        //Here goes the code for iOS 7.1
//        //self.currentCell = (JournalReasonCell *) senderButton.superview.superview.superview;
//        self.currentCell = (JournalReasonCell *) senderButton.superview.superview;
//        //self.currentCell = (JournalReasonCell *) senderButton.superview;
//
//    }
//    
    
    
    pathOfTheCell = [self.tableView indexPathForCell:self.currentCell];
    NSInteger rowOfTheCell = [pathOfTheCell row];
    [self.tableView selectRowAtIndexPath:pathOfTheCell animated:YES scrollPosition:rowOfTheCell];
    
    NSMutableDictionary *currObjectToDisplay = [ takingMedications objectAtIndex:pathOfTheCell.row];
//    NSString * tempTreatment = [currObjectToDisplay objectForKey:@"medicationFromTreatment"];
    //    NSLog(@" TREATMENT = %@", tempTreatment );
    
    if (senderButton.on) {
        self.currentCell.reason.hidden = YES;
        self.currentCell.labelReasonWhy.hidden = YES;
        // EDIT THE CURRENT ARRAY OF DISCTIONARIES
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:1] forKey:@"tookMedication"];
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"timesMissedPerDay"];
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"missingTreatmentReasonId"];
    }
    else if (! senderButton.on){
        //DID NOT TAKE MEDICATION - IE IT IS SET TO "NO"
        self.currentCell.reason.hidden = NO;
        self.currentCell.labelReasonWhy.hidden = NO;
        self.currentCell.reason.text = @"";
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:0] forKey:@"tookMedication"];
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:[NSNumber numberWithInt:1] forKey:@"timesMissedPerDay"];
        
        
        
        
        //        self.currentCell.reason.hidden = YES;
        //        self.currentCell.labelReasonWhy.hidden = YES;
        //        // EDIT THE CURRENT ARRAY OF DISCTIONARIES
        //        [currObjectToDisplay setObject:[NSNumber numberWithInt:1] forKey:@"tookMedication"];
        //    }
        //    else{
        //        //DID NOT TAKE MEDICATION - IE IT IS SET TO "NO"
        //        self.currentCell.reason.hidden = NO;
        //        self.currentCell.labelReasonWhy.hidden = NO;
        //        self.currentCell.reason.text = @"";
        //        [currObjectToDisplay setObject:[NSNumber numberWithInt:0] forKey:@"tookMedication"];
        
    }
    
    //    NSString *status = [currObjectToDisplay objectForKey:@"recordStatus"];
    //    if ([status isEqualToString:@"recordNEW"]) {
    //        [currObjectToDisplay setObject:@"recordNEWModified" forKey:@"recordModifiedStatus"];
    //    }
    //    else
    //    {//=====  recordOLD
    //        [currObjectToDisplay setObject:@"recordOLDModified" forKey:@"recordModifiedStatus"];
    //    }
    NSString *status = [currObjectToDisplay objectForKey:@"recordStatus"];
    if ([status isEqualToString:@"recordNEW"]) {
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:@"recordNEWModified" forKey:@"recordModifiedStatus"];
    }
    else
    {//=====  recordOLD
        [[ takingMedications objectAtIndex:pathOfTheCell.row] setObject:@"recordOLDModified" forKey:@"recordModifiedStatus"];
    }
    
    
    
}
#pragma mark - Table methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndexPath =indexPath ;
    currentSelectedRow = indexPath.row;
    [self.currentReasonTextField resignFirstResponder];
    //    self.currentReasonTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    
    self.currentCell = (JournalReasonCell *) [tableView cellForRowAtIndexPath:indexPath];
//    self.currentCell.backgroundColor = [UIColor whiteColor];
//    self.currentCell.layer.backgroundColor = (__bridge CGColorRef)([UIColor whiteColor]);
    self.currentCell.delegate = self;
 
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"cell";
    JournalReasonCell *cell = (JournalReasonCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil)
    {
        cell = [[JournalReasonCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    // Set background color
//    UIView *background = [[UIView alloc] initWithFrame:cell.frame];
//    background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    background.backgroundColor  = [UIColor whiteColor];
//    cell.backgroundView = background;
    
    // Set selected background color
    UIView *selectionColor = [[UIView alloc] initWithFrame:cell.frame];
    selectionColor.backgroundColor = [UIColor whiteColor];
    selectionColor.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    cell.selectedBackgroundView = selectionColor;
    
    
    // add DC Switch dynamically
    //    NSInteger yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 64.0 : 60.0;
    //    self.reasonSwitch = [[DCRoundSwitchAlternative alloc]initWithFrame:CGRectMake(180.0, yVal, 97.0, 23.0)]; //110.0
    //    self.reasonSwitch.onText = @"YES";
    //    self.reasonSwitch.offText = @"NO";
    //    self.reasonSwitch.onTintColor = [UIColor darkBlue];
    //    [self.reasonSwitch addTarget:self
    //                          action:@selector(toggleTookMedication:)
    //                 forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // REGULAR SWITCH *****
//    [cell.switchYESNO setOnImage:[UIImage imageNamed:@"UISwitch-Yes.png"]];
//    [cell.switchYESNO setOffImage:[UIImage imageNamed:@"UISwitch-No.png"]];
    [cell.switchYESNO addTarget:self action:@selector(toggleTookMedicationSwitch:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [cell.switchYESNO setTintColor:[UIColor whiteColor ]];
    //    cell.switchYESNO.onTintColor = [UIColor blackColor ];
    //     cell.switchYESNO.transform = CGAffineTransformMakeScale(0.75, 0.75);
    cell.switchYESNO.tag = indexPath.row;
    
    NSMutableDictionary *currObjectToDisplay = [ takingMedications objectAtIndex:indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterLongStyle];
    cell.logDate.text= [formatter stringFromDate:self.common.currentDate ] ;  // this log date which is today or what ever posted from previous page
    cell.medication.text= [currObjectToDisplay objectForKey:@"medicationFromTreatment"];
    
    if ([currObjectToDisplay valueForKey:@"missingTreatmentReasonId"] != nil) {
        NSInteger reasonId = [[currObjectToDisplay valueForKey:@"missingTreatmentReasonId"] integerValue] ;
        // FIND REASON NAME
        for (MissingTreatmentReason *reason in self.missingTreatmentReasonData) {
            if ([reason.id intValue] == reasonId) {
                self.missingTreatmentReason=reason;
                cell.reason.text = self.missingTreatmentReason.name;
                break;
            }
        }
        
        cell.switchYESNO.on=NO;
        cell.labelReasonWhy.hidden=NO;
        cell.reason.hidden = NO;
        //        [self.reasonSwitch setOn:NO];
        
        // SET BY DEFAULTS
        if (reasonId == 0) {
            cell.reason.text=@"";  // nothing there
            cell.reason.hidden = YES;
            cell.switchYESNO.on=YES;
            cell.labelReasonWhy.hidden=YES;
            
            //            [self.reasonSwitch setOn:YES];
        }
        
        
    } else {
        cell.reason.text=@"";  // nothing there
        cell.reason.hidden = YES;
        cell.switchYESNO.on=YES;
        cell.labelReasonWhy.hidden=YES;
        //        [self.reasonSwitch setOn:YES];
    }
    
    //DCROUND SW
    //    [cell.contentView addSubview:self.reasonSwitch];
    
    cell.reason.inputAccessoryView=self.inputAccessoryViewToolbar;
    cell.delegate = self;
    return cell;
}





#pragma mark - PickerView delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger numberOfRows = 0;
    if (pickerView == self.inputMedicationReasonMissedPicker ){
        numberOfRows = self.missingTreatmentReasonData.count;
    }
    return numberOfRows;
    
}

//Picker
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * title;
    if (pickerView == self.inputMedicationReasonMissedPicker ){
        MissingTreatmentReason *reason = [self.missingTreatmentReasonData objectAtIndex:row];
        title = reason.name;
    }
    
    return title;
}

//Picker
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (pickerView == self.inputMedicationReasonMissedPicker ){
        MissingTreatmentReason *reason = [self.missingTreatmentReasonData objectAtIndex:row];
        self.currentReasonTextField.text = reason.name;
        [self setDataValues];
    }
    
}

#pragma mark - textField delegate

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    JournalReasonCell *cell;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 6.1 or earlier
        cell = (JournalReasonCell *)[textField superview];
    } else if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0){
        // Load resources for iOS 7 or later
        cell = (JournalReasonCell *) textField.superview.superview.superview;
    }else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        // Load resources for iOS 8 or later
        //cell = (JournalReasonCell *) textField.superview.superview.superview;
        cell = (JournalReasonCell *)textField.superview.superview;
        //cell = (JournalReasonCell *)textField.superview;
    }
    
    //    NSLog(@"textFieldDidBeginEditing = ======= %@ - med = %@ ", textField.text, cell.medication.text);
    //    if (self.tableView.contentOffset.y == 0)
    //    {
    //        [UIView animateWithDuration:0.0 delay:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
    //        } completion:^(BOOL finished) {
    //            [self.tableView scrollToRowAtIndexPath:[self.tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    //        }];
    //    }
    //
    //    [self.tableView scrollToRowAtIndexPath:[self.tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    NSIndexPath* pathOfTheCell = [self.tableView indexPathForCell:cell];
    NSInteger rowOfTheCell = [pathOfTheCell row];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowOfTheCell inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition: UITableViewScrollPositionNone];
    
    self.currentCell = cell;
}

- (BOOL)  textFieldShouldBeginEditing:(UITextField *)textField {
    //    NSLog(@"textFieldShouldBeginEditing");
    JournalReasonCell *cell;
    NSIndexPath* pathOfTheCell = [self.tableView indexPathForCell:cell];
    NSInteger rowOfTheCell = [pathOfTheCell row];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowOfTheCell inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition: UITableViewScrollPositionNone];
    
   //self.currentCell = cell;
    
    if (textField.tag == 100) {
        
        
        textField.inputView = self.inputMedicationReasonMissedPicker;
        self.currentReasonTextField = textField;
        [textField setInputView:self.inputMedicationReasonMissedPicker];
        if (textField.text.length > 0) {
            
            NSInteger row =0;
            for (MissingTreatmentReason *reason in self.missingTreatmentReasonData) {
                if ([reason.name isEqualToString:textField.text]) {
                    self.missingTreatmentReason=reason;
                    row = [self.missingTreatmentReasonData indexOfObject:self.missingTreatmentReason];                    break;
                }
            }
            
            [self.inputMedicationReasonMissedPicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            self.missingTreatmentReason = [self.missingTreatmentReasonData objectAtIndex:0];
            textField.text = self.missingTreatmentReason.name;
        }
    }
    return YES;
    
}

- (IBAction)switchStatusChange:(UISwitch *)sender
{
    if (sender.on) {
        NSLog(@"If body ");
        [sender setThumbTintColor:[UIColor redColor]];
        
        [sender setBackgroundColor:[UIColor whiteColor]];
        [sender setOnTintColor:[UIColor whiteColor]];
        
    }else{
        NSLog(@"Else body ");
        
        [sender setTintColor:[UIColor clearColor]];
        
        [sender setThumbTintColor:[UIColor redColor]];
        
        [sender setBackgroundColor:[UIColor colorWithRed:138/256.0 green:9/256.0 blue:18/256.0 alpha:1]];
    }
}

//-(void)setOnTintColor
//{
//
//        self.tookMedicationSwitch.onTintColor = [UIColor yellowColor]; // the "on" color
//
//        self.tookMedicationSwitch.tintColor = [UIColor redColor]; // the "off" color
//        self.tookMedicationSwitch.backgroundColor = [UIColor redColor];
//
//    
//    //    switch.tintColor = [UIColor redColor]; // the "off" color
//    //    switch.onTintColor = [UIColor greenColor]; // the "on" color
// 
//    
//}



@end
