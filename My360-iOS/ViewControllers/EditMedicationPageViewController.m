//
//  EditMedicationPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/15/13.
//
//

#import <APSDK/AuthManager.h>
#import <APSDK/PatientTreatment+Remote.h>
#import <APSDK/User.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "MBProgressHUD.h"
#import "UIViewController+UI.h"
#import "MedicationViewController.h"
#import "ScheduleDetailsViewController.h"
#import "EditDosagePageViewController.h"
#import "EditMedicationPageViewController.h"
#import "NSDate+APDateExtension.h"
#import <APSDK/APObject+Remote.h>
#import "PikConstants.h"
#import <APSDK/APObject+RemoteRelationships.h>

@interface EditMedicationPageViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet UITextField * dosageTextField;
@property (nonatomic, weak) IBOutlet UITextField * endedOnTextField;
@property (nonatomic, weak) IBOutlet UITextField * ingestionMethodIdTextField;
@property (nonatomic, weak) IBOutlet UITextField * medicationBrandNameTextField;
@property (nonatomic, weak) IBOutlet UITextField * startedOnTextField;
@property (nonatomic, weak) IBOutlet UITextField * treatmentScheduleIdTextField;

@property (nonatomic, strong, readonly) UIPickerView * inputIngestionMethodPicker;

- (BOOL)saveTapped;
- (void)refresh;



@end

@implementation EditMedicationPageViewController

@synthesize inputIngestionMethodPicker = _inputIngestionMethodPicker;
@synthesize dosageData;
@synthesize currentScheduleDate;
@synthesize nextScheduleDate;


#pragma mark - Public

- (void)setPatientTreatment:(PatientTreatment *)patientTreatment {
    if (_patientTreatment != patientTreatment) {
        _patientTreatment = patientTreatment;
        
        if ([self isViewLoaded])
            [self refresh];
    }
}


#pragma mark - Actions

- (BOOL)saveTapped {
    
    if (self.startedOnTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A start day is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
        
    }
    else if (self.treatmentScheduleIdTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A schedule is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
        
    }
    else if (self.medicationBrandNameTextField.text.length == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A medication name is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return false;
            
    }
    else if (self.dosageTextField.text.length == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A dosage amount is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return false;
            
    }
    else if (self.ingestionMethodIdTextField.text.length == 0) {
            //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An ingestion method is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An administration method is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
            [alert show];
            return false;
            
    }
    else if ([[[self configureDateFormatter:self.dateFormatter field:self.startedOnTextField] dateFromString:self.startedOnTextField.text] compare:self.currentScheduleDate] == NSOrderedDescending) {
#warning Not working as designed - svaz 1/23/15
        NSLog(@" Date 1 = %@, date 2 = %@",self.startedOnTextField,self.currentScheduleDate );
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"You can not have a treatment schedule date before the treatment starts." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
    else if ([[[self configureDateFormatter:self.dateFormatter field:self.startedOnTextField] dateFromString:self.startedOnTextField.text] compare:[[self configureDateFormatter:self.dateFormatter field:self.endedOnTextField] dateFromString:self.endedOnTextField.text]] == NSOrderedDescending) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Start date can not be later than end date." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }

    if (self.editMode) {
        
        self.patientTreatment.dosage = self.dosage;
        self.patientTreatment.treatmentType.id = @1;
        self.patientTreatment.dosageUom = self.dosageUom;
        self.patientTreatment.endOn = [[self configureDateFormatter:self.dateFormatter field:self.endedOnTextField] dateFromString:self.endedOnTextField.text];
        self.patientTreatment.ingestionMethod = self.ingestionMethod;
        self.patientTreatment.startOn = [[self configureDateFormatter:self.dateFormatter field:self.startedOnTextField] dateFromString:self.startedOnTextField.text];
        self.patientTreatment.treatmentSchedule = self.treatmentSchedule;
        self.patientTreatment.medication = self.medication;
        [self.patientTreatment setCurrentScheduleOn:[self currentScheduleDate]];
        [self.patientTreatment setNextScheduleOn:[self nextScheduleDate]];
        
        [self pushBusyOperation];
        __block EditMedicationPageViewController * _self = self;
        
        [self.patientTreatment updateAsync:^(id obj, NSError * error) {
            if (error) {
                [_self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [_self showMessage:@"Treatment record failed to save."];
            } else {
                [_self popBusyOperation];
                
                _self.patientTreatment = obj;
                //[_self showMessage:@"Treatment record successfully saved."];
                [_self.navigationController popViewControllerAnimated:YES];
            }
        }];
    }
    else {
        
        PatientTreatment * patientTreatment = [PatientTreatment new];
        patientTreatment.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        
        patientTreatment.dosage = self.dosage;
        TreatmentType *tt = [TreatmentType new];
        tt.id = @1;
        patientTreatment.treatmentType = tt;
        patientTreatment.dosageUom = self.dosageUom;
        patientTreatment.endOn = [[self configureDateFormatter:self.dateFormatter field:self.endedOnTextField] dateFromString:self.endedOnTextField.text];
        patientTreatment.ingestionMethod = self.ingestionMethod;
        
        patientTreatment.startOn = [[self configureDateFormatter:self.dateFormatter field:self.startedOnTextField] dateFromString:self.startedOnTextField.text];
        patientTreatment.treatmentSchedule = self.treatmentSchedule;
        patientTreatment.medication = self.medication;
        [patientTreatment setCurrentScheduleOn:[self currentScheduleDate]];
        [patientTreatment setNextScheduleOn:[self nextScheduleDate]];
        
        [self pushBusyOperation];
        __block EditMedicationPageViewController * _self = self;
        
        
        [patientTreatment createAsync:^(id obj, NSError * error) {
            if (error) {
                [_self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [_self showMessage:@"Medication record failed to add."];
            } else {
                [_self popBusyOperation];
                
                //[_self showMessage:@"Medication record successfully added."];
                //[_self.navigationController popViewControllerAnimated:YES];
                [_self dismissViewControllerAnimated:YES completion:nil];

            }
        }];
    }
    return true;
}


- (UIPickerView *)inputIngestionMethodPicker {
    if (!_inputIngestionMethodPicker) {
        _inputIngestionMethodPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        
        _inputIngestionMethodPicker.delegate = self;
        _inputIngestionMethodPicker.dataSource = self;
        _inputIngestionMethodPicker.showsSelectionIndicator = YES;
        
        [_inputIngestionMethodPicker sizeToFit];
    }
    
    return _inputIngestionMethodPicker;
}



- (void)medicationSelected:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"selectedMedication"]){
        
        [self.navigationController popViewControllerAnimated:YES];
        
        NSDictionary *userInfo = notification.userInfo;
        
        self.medication = [userInfo objectForKey:@"medication"];
        self.medicationBrandNameTextField.text = self.medication.name;
        
        [self.tableView reloadData];
        
    }
}


- (void)dosageSelected:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"selectedDosage"]){
        
        [self.navigationController popViewControllerAnimated:YES];
        
        NSDictionary *userInfo = notification.userInfo;
        
        self.dosage = [userInfo objectForKey:@"dosage"];
        self.dosageUom = [userInfo objectForKey:@"dosageUom"];
        
        NSString *labelText = [NSString stringWithFormat:@"%@  %@", [self.dosage stringValue], self.dosageUom.name];
        
        self.dosageTextField.text = labelText;
        
        [self.tableView reloadData];
        
    }
}


- (void)scheduleSelected:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"selectedScheduleDetails"]){
        
        [self.navigationController popViewControllerAnimated:YES];
        
        NSDictionary *userInfo = notification.userInfo;
        
        self.treatmentSchedule = [userInfo objectForKey:@"schedule"];
        self.treatmentScheduleIdTextField.text = self.treatmentSchedule.name;
        self.currentScheduleDate = [userInfo objectForKey:@"currentScheduleDate"];
        self.nextScheduleDate = [userInfo objectForKey:@"nextScheduleDate"];
        
        [self.tableView reloadData];
        
    }
}


- (void)refresh {
    
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    for (Medication *medication in ad.medicationData) {
        
        if ([medication.id intValue] == [self.patientTreatment.medicationId intValue]) {
            self.medication = medication;
            break;
        }
    }
    for (DosageUom *dosageUom in ad.dosageUomData) {
        if ([dosageUom.id intValue] == [self.patientTreatment.dosageUomId intValue]) {
            self.dosageUom = dosageUom;
            self.dosage = self.patientTreatment.dosage;
            break;
        }
    }
    for (IngestionMethod *ingestionMethod in ad.ingestionMethodData) {
        if ([ingestionMethod.id intValue] == [self.patientTreatment.ingestionMethodId intValue]) {
            self.ingestionMethod = ingestionMethod;
            break;
        }
    }
    for (TreatmentSchedule *treatmentSchedule in ad.treatmentScheduleData) {
        if ([treatmentSchedule.id intValue] == [self.patientTreatment.treatmentScheduleId intValue]) {
            self.treatmentSchedule = treatmentSchedule;
            break;
        }
    }
    

    NSDateFormatter *df = [self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    self.startedOnTextField.text = [[self configureDateFormatter:df field:self.startedOnTextField] stringFromDate:self.patientTreatment.startOn];
    self.endedOnTextField.text = [[self configureDateFormatter:df field:self.endedOnTextField] stringFromDate:self.patientTreatment.endOn];
    self.medicationBrandNameTextField.text = self.medication.name;
    NSString *labelText = [NSString stringWithFormat:@"%@  %@", [self.patientTreatment.dosage stringValue] == NULL ? @"" : [self.patientTreatment.dosage stringValue], self.patientTreatment.dosageUomDenormalized == NULL ? @"" : self.patientTreatment.dosageUomDenormalized ];
    self.dosageTextField.text = labelText;
    self.ingestionMethodIdTextField.text = self.ingestionMethod.name;
    self.treatmentScheduleIdTextField.text = self.treatmentSchedule.name;
    [self setCurrentScheduleDate:self.patientTreatment.currentScheduleOn];
    [self setNextScheduleDate:self.patientTreatment.nextScheduleOn];
    [self.tableView reloadData];
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
        
        self.inputViewDatePicker.datePickerMode = UIDatePickerModeDate;
    }
    
    if (textField == self.ingestionMethodIdTextField) {
        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        if (textField.text.length > 0) {
            //set the default
            NSInteger row=[ad.ingestionMethodData indexOfObject:self.ingestionMethod];
            [self.inputIngestionMethodPicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            //set default
            self.ingestionMethod = [ad.ingestionMethodData objectAtIndex:0];
            textField.text = self.ingestionMethod.name;
        }
    }
    
    
    return YES;
}


#pragma mark - PickerView delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    return ad.ingestionMethodData.count;
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    IngestionMethod *ingestionMethod = [ad.ingestionMethodData objectAtIndex:row];
    return ingestionMethod.name;
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.ingestionMethod = [ad.ingestionMethodData objectAtIndex:row];
    self.ingestionMethodIdTextField.text = self.ingestionMethod.name;
    
}


#pragma mark - UIViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"MedicationSegue"])
    {
        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        MedicationViewController *controller = (MedicationViewController *)[segue destinationViewController];
        controller.tableData = ad.medicationData;
    }
    else if ([segue.identifier isEqualToString:@"DosageSegue"])
    {
        EditDosagePageViewController *controller = (EditDosagePageViewController *)[segue destinationViewController];
        controller.dosageUom = self.dosageUom;
        controller.dosage = self.dosage;
    }
    else if ([segue.identifier isEqualToString:@"ScheduleDetailSegue"])
    {
        ScheduleDetailsViewController *controller = (ScheduleDetailsViewController *)[segue destinationViewController];
        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        [controller setTreatmentScheduleData:[ad treatmentScheduleData]];
        [controller setTreatmentSchedule:[self treatmentSchedule]];
        [controller setCurrentScheduleDate:[self currentScheduleDate]];
        [controller setNextScheduleDate:[self nextScheduleDate]];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.dosageData = [[NSArray alloc] initWithObjects:@"0",@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    
    
 //   self.navigationItem.title = self.patientTreatment ? [AppDelegate interpolateString:NSLocalizedString(@"My Medication", @"My Medication") objectInstance:self.patientTreatment] : nil;
    self.navigationItem.title = @"My Medication";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(medicationSelected:) name:@"selectedMedication" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dosageSelected:) name:@"selectedDosage" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scheduleSelected:) name:@"selectedScheduleDetails" object:nil];
    
    self.startedOnTextField.placeholder = kFieldPlaceHolderText;
    self.endedOnTextField.placeholder = kFieldPlaceHolderText;
    self.ingestionMethodIdTextField.placeholder = kFieldPlaceHolderText;
    self.endedOnTextField.tag = kFormViewControllerFieldDate;
    self.startedOnTextField.tag = kFormViewControllerFieldDate;
    
    self.fields = @[ self.startedOnTextField, self.endedOnTextField, self.ingestionMethodIdTextField ];
    
    for (UITextField * field in self.fields) {
        
        field.inputAccessoryView = self.inputAccessoryViewToolbar;
        
        if (field.tag == kFormViewControllerFieldDate) {
            field.inputView = self.inputViewDatePicker;
        }
        
        if (field == self.ingestionMethodIdTextField) {
            field.inputView = self.inputIngestionMethodPicker;
        }
    }
    
    [self refresh];
    
        
    if (!self.editMode) {
        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        self.treatmentSchedule = [ad.treatmentScheduleData objectAtIndex:0];
        
    }
}


- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectedMedication" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectedDosage" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectedScheduleDetails" object:nil];
    
}

-(void)back{
    if([self saveTapped]) [super back];
    else return;
}




@end
