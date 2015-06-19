//
//  EditAdherencePageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/5/13.
//
//

#import "EditAdherencePageViewController.h"
#import <APSDK/Symptom+Remote.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "MBProgressHUD.h"
#import "UIViewController+UI.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/Patient+Remote.h>
#import "UIColor+APColorExtension.h"
#import <APSDK/TreatmentType+Remote.h>
#import <APSDK/Medication+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"


@interface EditAdherencePageViewController () < UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet UITextField * reasonMissedTextField;
@property (nonatomic, weak) IBOutlet UITextField * timesPerDayTextField;
@property (nonatomic, weak) IBOutlet UITextField * adherenceLogOnTextField;
@property (nonatomic, strong, readonly) UIPickerView * inputReasonMissedPicker;
@property (nonatomic, strong, readonly) UIPickerView * inputTimesPerDayPicker;

@end

@implementation EditAdherencePageViewController

@synthesize inputReasonMissedPicker = _inputReasonMissedPicker;
@synthesize inputTimesPerDayPicker = _inputTimesPerDayPicker;
@synthesize tookMedicationSwitch;
@synthesize timesPerDayData;
@synthesize treatmentSchedule = _treatmentSchedule;
@synthesize missingTreatmentReason;
@synthesize patientTreatment;
@synthesize timesPerDay;
@synthesize timesMissedCell;
@synthesize timesPerDayField;
@synthesize timesPerDayLabel;
@synthesize reasonMissedCell;




#pragma mark - Public

- (void)setPatientAdherenceLog:(PatientAdherenceLog *)patientAdherenceLog {
    if (_patientAdherenceLog != patientAdherenceLog) {
        _patientAdherenceLog = patientAdherenceLog;
        
        if ([self isViewLoaded])
            [self refresh];
    }
}

-(IBAction)saveTappedIB:(id)sender{
    [self saveTapped];
}

#pragma mark - Actions

- (BOOL)saveTapped {
    
    if (self.adherenceLogOnTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A date is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
    else if([[[self configureDateFormatter:self.dateFormatter field:self.adherenceLogOnTextField] dateFromString:self.adherenceLogOnTextField.text] compare: [NSDate date]] == NSOrderedDescending){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"You can not have an adherence log for a date in the future." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
    else if(!self.tookMedicationSwitch.on && self.reasonMissedTextField.text.length == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please enter a reason for missing treatment." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
    
    if (self.editMode) {
        
        self.patientAdherenceLog.timesMissedPerDay = self.timesPerDay;
        self.patientAdherenceLog.tookMedication = [NSNumber numberWithBool:self.tookMedicationSwitch.on ];
        self.patientAdherenceLog.missingTreatmentReasonId = self.missingTreatmentReason.id;
        self.patientAdherenceLog.logOn = [[self configureDateFormatter:self.dateFormatter field:self.adherenceLogOnTextField] dateFromString:self.adherenceLogOnTextField.text];
        self.patientAdherenceLog.patient.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
        [self pushBusyOperation];
        NSError *err = nil;
        // UPDATE - svaz
        [self.patientAdherenceLog update:&err];
        if (err) {
            [self popBusyOperation];
            if(ERROR_CODE_401(err)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else [self showMessage:@"Adherence Log record failed to save."];
            return false;
        }
        else {
            return true;
            //[_self showMessage:@"Adherence Log record successfully saved."];
        }
    }
    else {
        
//        New log - svaz
        NSError *err = nil;
        NSDateFormatter *formatter = [self configureDateFormatter:self.dateFormatter field:self.adherenceLogOnTextField];
        NSDate *tempDate = [formatter dateFromString:self.adherenceLogOnTextField.text];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDictionary *params = [[NSDictionary alloc]initWithObjects:[[NSArray alloc]initWithObjects:[formatter stringFromDate:tempDate],((User *)[AuthManager defaultManager].currentCredentials).id,self.patientTreatment.id,nil] forKeys:[[NSArray alloc]initWithObjects:@"date",@"patient_id",@"patient_treatment_id",nil]];
        NSArray *objects = [PatientAdherenceLog query:@"adherence_for_date_treatment" params:params error:&err];
        if(err == nil){
            if ([objects count] > 0) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"You have already created an adherence log for this treatment on this date." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                return false;
            }
        }
        
        
        PatientAdherenceLog * patientAdherenceLog = [PatientAdherenceLog new];
        patientAdherenceLog.patientTreatmentId = self.patientTreatment.id;
        patientAdherenceLog.timesMissedPerDay = self.timesPerDay;
        Patient *me = [Patient new];
        me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
        patientAdherenceLog.patient = me;
        patientAdherenceLog.tookMedication = [NSNumber numberWithBool:self.tookMedicationSwitch.on ];
        patientAdherenceLog.missingTreatmentReasonId = self.missingTreatmentReason.id;
        patientAdherenceLog.logOn = [[self configureDateFormatter:self.dateFormatter field:self.adherenceLogOnTextField] dateFromString:self.adherenceLogOnTextField.text];

        [self pushBusyOperation];
        // SAVE - svaz
        [patientAdherenceLog create:&err];
        [self popBusyOperation];
        if (err) {
            if(ERROR_CODE_401(err)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else [self showMessage:@"Adherence Log record failed to add."];
            return false;
        } else {
            [[NSNotificationCenter defaultCenter] postNotificationName: @"adherenceAdded" object:nil userInfo:nil];
            //[_self showMessage:@"Adherence Log record successfully added."];
            [self dismissViewControllerAnimated:YES completion:nil];
            return true;
            
        }
    }
}

- (UIPickerView *)inputReasonMissedPicker {
    if (!_inputReasonMissedPicker) {
        _inputReasonMissedPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        
        _inputReasonMissedPicker.delegate = self;
        _inputReasonMissedPicker.dataSource = self;
        _inputReasonMissedPicker.showsSelectionIndicator = YES;
        
        [_inputReasonMissedPicker sizeToFit];
    }
    
    return _inputReasonMissedPicker;
}



- (UIPickerView *)inputTimesPerDayPicker {
    if (!_inputTimesPerDayPicker) {
        _inputTimesPerDayPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        
        _inputTimesPerDayPicker.delegate = self;
        _inputTimesPerDayPicker.dataSource = self;
        _inputTimesPerDayPicker.showsSelectionIndicator = YES;
        
        [_inputTimesPerDayPicker sizeToFit];
    }
    
    return _inputTimesPerDayPicker;
}




- (void)refresh {
    
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    for (MissingTreatmentReason *reason in ad.missingTreatmentReasonData) {
        
        if ([reason.id intValue] == [self.patientAdherenceLog.missingTreatmentReasonId intValue]) {
            self.missingTreatmentReason = reason;
            break;
        }
    }
    if (self.patientAdherenceLog.timesMissedPerDay) {
        self.timesPerDayTextField.text = [self.patientAdherenceLog.timesMissedPerDay stringValue];
    }
    if (!self.patientTreatment) {
        NSError *err = nil;
        [self.patientAdherenceLog loadRelationship:@"patientTreatment" error:&err];
        if (!err) {
            self.patientTreatment = self.patientAdherenceLog.patientTreatment;
        }
    }
    NSLog(@"Treatment %@",self.patientTreatment);

    for (TreatmentSchedule *treatmentSchedule in ad.treatmentScheduleData) {
        
        if ([treatmentSchedule.id intValue] == [self.patientTreatment.treatmentScheduleId intValue]) {
            self.treatmentSchedule = treatmentSchedule;
            break;
        }
    }
            int numberPerDay = [self.treatmentSchedule.timesPerDay intValue];
            NSLog(@"Schedule %@",self.treatmentSchedule);
            NSLog(@"Times Per Day: %d",numberPerDay);
            self.timesPerDayData = [[NSMutableArray alloc] init];
            [self.timesPerDayData addObject:[NSNumber numberWithInt:1]];
            for (int i = 2; i <= numberPerDay; i++) {
                [self.timesPerDayData addObject:[NSNumber numberWithInt:i]];
            }

    self.timesPerDay = self.patientAdherenceLog.timesMissedPerDay;
    self.adherenceLogOnTextField.text = [[self configureDateFormatter:[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] field:self.adherenceLogOnTextField] stringFromDate:self.patientAdherenceLog.logOn];
    self.reasonMissedTextField.text = self.patientAdherenceLog.missingTreatmentReasonDenormalized;
    if (self.editMode) self.tookMedicationSwitch.on = [self.patientAdherenceLog.tookMedication boolValue];
    else self.tookMedicationSwitch.on = YES;
    [self switchChanged:nil];
    [self.tableView reloadData];
}

#pragma mark - PickerView delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger numberOfRows = 0;
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (pickerView == self.inputReasonMissedPicker) {
        numberOfRows = ad.missingTreatmentReasonData.count;
    }
    else if (pickerView == self.inputTimesPerDayPicker) {
        numberOfRows = self.timesPerDayData.count;
       
    }

    return numberOfRows;
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (pickerView == self.inputReasonMissedPicker) {
        MissingTreatmentReason *reason = [ad.missingTreatmentReasonData objectAtIndex:row];
        title = reason.name;
    }
    else if (pickerView == self.inputTimesPerDayPicker) {
        NSNumber *numberOfTimes = [self.timesPerDayData objectAtIndex:row];
        title = [numberOfTimes stringValue];
    }
    
    return title;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (pickerView == self.inputReasonMissedPicker) {
        self.missingTreatmentReason = [ad.missingTreatmentReasonData objectAtIndex:row];
        self.reasonMissedTextField.text = self.missingTreatmentReason.name;
    }
    else if (pickerView == self.inputTimesPerDayPicker) {
        self.timesPerDay = [self.timesPerDayData objectAtIndex:row];
        self.timesPerDayTextField.text = [self.timesPerDay stringValue];

    }
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField.tag == kFormViewControllerFieldDate) {
        if (textField.text.length > 0) {
            NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:textField];
            self.inputViewDatePicker.date = [formatter dateFromString:textField.text];
        }
        else {
            NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:textField];
            textField.text = [formatter stringFromDate:self.inputViewDatePicker.date];
        }
    }
   
    if (textField == self.timesPerDayTextField) {
        if (textField.text.length > 0) {
            
            [self.inputTimesPerDayPicker selectRow:[self.timesPerDay intValue] - 1 inComponent:0 animated:YES];
        }
        else {
            self.timesPerDay = [self.timesPerDayData objectAtIndex:0];
            textField.text = [self.timesPerDay stringValue];
        }
    }
    else if (textField == self.reasonMissedTextField) {
        if (textField.text.length > 0) {
            AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            NSInteger row = [ad.missingTreatmentReasonData indexOfObject:self.missingTreatmentReason];

        //    [self.inputReasonMissedPicker selectRow:[self.missingTreatmentReason.id intValue] - 1 inComponent:0 animated:YES];
            [self.inputReasonMissedPicker selectRow:row inComponent:0 animated:YES];
        }

        else {
            AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            self.missingTreatmentReason = [ad.missingTreatmentReasonData objectAtIndex:0];
            textField.text = self.missingTreatmentReason.name;
        }
    }
    
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adherence Log";
    //TODO FIX NAV TITLE
    //self.patienttreatment is null
    /*CGRect navFrame = self.navigationController.navigationBar.frame;
    UIView *navView = [[UIView alloc]initWithFrame:navFrame];
    UILabel *topLabel = [[UILabel alloc]initWithFrame:CGRectMake(-60, 3, navFrame.size.width, navFrame.size.height / 2)];
    topLabel.text = @"Adherence Log";
    topLabel.font = [UIFont boldSystemFontOfSize:16];
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.textColor = [UIColor whiteColor];
    [topLabel setBackgroundColor:[UIColor clearColor]];
    
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(-60, navFrame.size.height / 2, navFrame.size.width, navFrame.size.height / 2)];
    bottomLabel.text = [self.patientTreatment.treatmentTypeDenormalized isEqualToString:@"Medication"] ? self.patientTreatment.medicationDenormalized : self.patientTreatment.treatmentTypeDenormalized;
    NSLog(@"%@",bottomLabel.text);
    NSLog(@"%@",[self.patientTreatment.treatmentTypeDenormalized isEqualToString:@"Medication"] ? self.patientTreatment.medicationDenormalized : self.patientTreatment.treatmentTypeDenormalized);
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.font = [UIFont systemFontOfSize:14];
    [bottomLabel setBackgroundColor:[UIColor clearColor]];
    bottomLabel.textColor = [UIColor whiteColor];
    
    [navView addSubview:topLabel];
    [navView addSubview:bottomLabel];
    self.navigationItem.titleView = navView;*/
    //  self.navigationItem.title = self.patientAdherenceLog ? [AppDelegate interpolateString:NSLocalizedString(@"Adherence Log", @"Adherence Log") objectInstance:self.patientAdherenceLog] : nil;
    int yVal = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 84 : 64;
    self.tookMedicationSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, yVal, 79, 27)];
    [self.tookMedicationSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.tookMedicationSwitch];
    self.tookMedicationSwitch.onText = @"YES";
    self.tookMedicationSwitch.offText = @"NO";
    self.tookMedicationSwitch.onTintColor = [UIColor darkBlue];
    self.reasonMissedTextField.delegate = self;
    self.adherenceLogOnTextField.placeholder = kFieldPlaceHolderText;
    self.timesPerDayField.placeholder = kFieldPlaceHolderText;
    self.timesPerDayTextField.placeholder = kFieldPlaceHolderText;
    self.reasonMissedTextField.placeholder = kFieldPlaceHolderText;
    
    self.adherenceLogOnTextField.tag = kFormViewControllerFieldDate;
    
    self.fields = @[self.adherenceLogOnTextField, self.timesPerDayTextField, self.reasonMissedTextField];
    
    for (UITextField * field in self.fields) {
        self.inputViewDatePicker.datePickerMode = UIDatePickerModeDate;
        field.inputAccessoryView = self.inputAccessoryViewToolbar;
        
        if (field.tag == kFormViewControllerFieldDate){
            field.inputView = self.inputViewDatePicker;
        }

        if (field == self.timesPerDayTextField){
            field.inputView = self.inputTimesPerDayPicker;
        }
        
        if (field == self.reasonMissedTextField){
            field.inputView = self.inputReasonMissedPicker;
        }
    }
    [self refresh];
    /*self.treatmentSchedule = self.patientTreatment.treatmentSchedule;
    [self refresh];
    int numberPerDay = [self.treatmentSchedule.timesPerDay intValue];
    NSLog(@"%@",self.patientTreatment);
    NSLog(@"%@",self.treatmentSchedule);
    NSLog(@"Times Per Day: %d",numberPerDay);
    self.timesPerDayData = [[NSMutableArray alloc] init];
    [self.timesPerDayData addObject:[NSNumber numberWithInt:1]];
    for (int i = 2; i <= numberPerDay; i++) {
        [self.timesPerDayData addObject:[NSNumber numberWithInt:i]];
    }*/

}
-(void)switchChanged:(id)sender {
    if(!self.tookMedicationSwitch.on){
        self.reasonMissedCell.hidden = NO;
        self.timesMissedCell.hidden = NO;
    }
    else {
        self.reasonMissedCell.hidden = YES;
        self.timesMissedCell.hidden = YES;
    }
}
-(void)back{
    
    if(!self.editMode){
        [super back];
        return;
    }
    
    
    if([self saveTapped]) [super back];
    else return;
}

@end
