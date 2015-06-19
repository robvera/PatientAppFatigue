//
//  EditGlucosePageViewController.m
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/26/13.
//
//

#import "EditGlucosePageViewController.h"
#import "PikConstants.h"
#import "UIViewController+UI.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import "PIKCommon.h"


@interface EditGlucosePageViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation EditGlucosePageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.glucoseLevelData = @[@"High", @"Normal", @"Low", @"Severe Low"];
    //self.timeFrameData = @[@"Breakfast", @"Lunch", @"Dinner", @"Snack", @"Other"];
    self.timeFrameData = @[@"Before breakfast", @"After breakfast", @"Before lunch", @"After lunch",@"Before bedtime", @"During the night", @"Before a snack", @"After a snack",@"Other"];
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(saveDate:) forControlEvents:UIControlEventValueChanged];
    
    self.dateTextField.inputView = self.datePicker;
    self.dateTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.dateTextField.placeholder = kFieldPlaceHolderText;
    self.dateTextField.tag = kFormViewControllerFieldDate;
    
    self.timeFramePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    self.timeFramePicker.delegate = self;
    self.timeFramePicker.dataSource = self;
    self.timeFramePicker.showsSelectionIndicator = YES;
    
    self.timeFrameTextField.inputView = self.timeFramePicker;
    self.timeFrameTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.timeFrameTextField.placeholder = kFieldPlaceHolderText;
    
    self.glucoseMeasurementTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.glucoseMeasurementTextField.placeholder = kFieldPlaceHolderText;
    
    self.glucoseLevelPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    self.glucoseLevelPicker.delegate = self;
    self.glucoseLevelPicker.dataSource = self;
    self.glucoseLevelPicker.showsSelectionIndicator = YES;
    
    self.glucoseLevelTextField.inputView = self.glucoseLevelPicker;
    self.glucoseLevelTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.glucoseLevelTextField.placeholder = kFieldPlaceHolderText;
    
    self.insulinAmountTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.insulinAmountTextField.placeholder = kFieldPlaceHolderText;
    
    self.carbohydrateAmountTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.carbohydrateAmountTextField.placeholder = kFieldPlaceHolderText;
    
    self.noteTextView.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.noteTextView.text = kFieldPlaceHolderText;
    self.noteTextView.textColor = [UIColor lightGrayColor];

    //this is needed for supers textfield delegate methods.
    self.fields = @[ self.dateTextField, self.timeFrameTextField, self.glucoseMeasurementTextField, self.glucoseLevelTextField, self.insulinAmountTextField, self.carbohydrateAmountTextField ];

    if (self.editMode) {
        
//        self.dateTextField.text = [[self configureDateFormatter:[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] field:self.dateTextField] stringFromDate:self.patientGlucose.glucoseOn];
//        self.timeFrameTextField.text = self.patientGlucose.timeFrame;
//        self.glucoseMeasurementTextField.text = [self.patientGlucose.glucoseReading stringValue];
//        self.glucoseLevelTextField.text = self.patientGlucose.glucoseLevel;
//        self.insulinAmountTextField.text = [self.patientGlucose.insulin stringValue];
//        self.carbohydrateAmountTextField.text = [self.patientGlucose.carbohydrates stringValue];
//        
//        if (self.patientGlucose.notes.length > 0) {
//            self.noteTextView.text = self.patientGlucose.notes;
//            self.noteTextView.textColor = [UIColor blackColor];
//            
//        }
        self.dateTextField.text = [[self configureDateFormatter:[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] field:self.dateTextField] stringFromDate:self.defaultPatientGlucose.glucoseOn];
        self.timeFrameTextField.text = self.defaultPatientGlucose.timeFrame;
        self.glucoseMeasurementTextField.text = [self.defaultPatientGlucose.glucoseReading stringValue];

        self.glucoseLevelTextField.text = self.defaultPatientGlucose.glucoseLevel;
        self.insulinAmountTextField.text = [self.defaultPatientGlucose.insulin stringValue];
        self.carbohydrateAmountTextField.text = [self.defaultPatientGlucose.carbohydrates stringValue];

        if (self.defaultPatientGlucose.notes.length > 0) {
            self.noteTextView.text = self.defaultPatientGlucose.notes;
            self.noteTextView.textColor = [UIColor blackColor];
            
        }
    }
    else {
//        self.dateTextField.text = [[self configureDateFormatter:[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] field:self.dateTextField] stringFromDate:self.defaultPatientGlucose.glucoseOn];
//        self.timeFrameTextField.text = self.defaultPatientGlucose.timeFrame;
//        self.glucoseMeasurementTextField.text = [self.defaultPatientGlucose.glucoseReading stringValue];
//        
//        self.glucoseLevelTextField.text = self.defaultPatientGlucose.glucoseLevel;
//        self.insulinAmountTextField.text = [self.defaultPatientGlucose.insulin stringValue];
//        self.carbohydrateAmountTextField.text = [self.defaultPatientGlucose.carbohydrates stringValue];
//        
//        if (self.defaultPatientGlucose.notes.length > 0) {
//            self.noteTextView.text = self.defaultPatientGlucose.notes;
//            self.noteTextView.textColor = [UIColor blackColor];
//            
//        }

        self.dateTextField.text =  nil;
        self.timeFrameTextField.text = nil;
        self.glucoseMeasurementTextField.text = nil;
        self.glucoseLevelTextField.text = nil;
        self.insulinAmountTextField.text = nil;
        self.carbohydrateAmountTextField.text = nil;
        self.noteTextView.text = nil;

//	 if (self.defaultPatientGlucose.notes.length > 0) {
//            self.noteTextView.text = self.defaultPatientGlucose.notes;
//            self.noteTextView.textColor = [UIColor blackColor];
     
//        }
    }
}


- (void)saveTapped
{
    NSNumberFormatter * numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:kDateFormat];

    if (self.editMode && self.somethingChanged) {
        
        NSLog(@"Glucose Date:%@", [dateFormatter dateFromString:self.dateTextField.text]);

        self.patientGlucose.glucoseOn = [dateFormatter dateFromString:self.dateTextField.text];
        self.patientGlucose.timeFrame = self.timeFrameTextField.text;
        
        NSInteger row = [self.timeFrameData indexOfObject:self.timeFrameTextField.text];

        self.patientGlucose.timeFrameSortId = [NSNumber numberWithInteger:row];
        
        self.patientGlucose.glucoseLevel = self.glucoseLevelTextField.text;
        self.patientGlucose.glucoseReading = [numberFormatter numberFromString: self.glucoseMeasurementTextField.text];
        self.patientGlucose.insulin = [numberFormatter numberFromString: self.insulinAmountTextField.text];
        self.patientGlucose.carbohydrates = [numberFormatter numberFromString: self.carbohydrateAmountTextField.text];
   
            if (![self.noteTextView.text isEqualToString:kFieldPlaceHolderText]) {
                self.patientGlucose.notes = self.noteTextView.text;
            }
        
            self.patientGlucose.notes =@"77";
            [self pushBusyOperation];

            [self.patientGlucose updateAsync:^(id object, NSError *error) {
            
            [self popBusyOperation];
            
            if(error){
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else
                    [self showMessage:@"Glucose record failed to save."];
                // return false;
            }
            else {
                [self.navigationController popViewControllerAnimated:YES];
                
            }
        }];
    }
    else if (!self.editMode) {
        
        PatientGlucose * patientGlucose = [PatientGlucose new];
        patientGlucose.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        
        patientGlucose.glucoseOn = [dateFormatter dateFromString:self.dateTextField.text];
        patientGlucose.timeFrame = self.timeFrameTextField.text;
       
        
        NSInteger row = [self.timeFrameData indexOfObject:self.timeFrameTextField.text];
         patientGlucose.timeFrameSortId = [NSNumber numberWithInteger:row];
        patientGlucose.glucoseLevel = self.glucoseLevelTextField.text;
        patientGlucose.glucoseReading = [numberFormatter numberFromString: self.glucoseMeasurementTextField.text];
        patientGlucose.insulin = [numberFormatter numberFromString: self.insulinAmountTextField.text];
        patientGlucose.carbohydrates = [numberFormatter numberFromString: self.carbohydrateAmountTextField.text];
      
//         NSLog(@"  patientGlucose.patientId   %@ " , patientGlucose.patientId   );
//         NSLog(@"  patientGlucose.glucoseOn   %@ " , patientGlucose.glucoseOn   );
//         NSLog(@"  patientGlucose.timeFrame   %@ " , patientGlucose.timeFrame   );
//        
//         NSLog(@"  patientGlucose.timeFrameSortId   %@ " , patientGlucose.timeFrameSortId   );
//         NSLog(@"  patientGlucose.glucoseLevel   %@ " ,   patientGlucose.glucoseLevel );
//         NSLog(@"  patientGlucose.glucoseReading  %@ " ,  patientGlucose.glucoseReading );
//         NSLog(@"   patientGlucose.insulin %@ " ,  patientGlucose.insulin );
//         NSLog(@"  patientGlucose.carbohydrates %@ " , patientGlucose.carbohydrates );
        
        if (![self.noteTextView.text isEqualToString:kFieldPlaceHolderText]) {
            patientGlucose.notes = self.noteTextView.text;
            
        }
//        else{
//            
//        patientGlucose.notes =@"ooo";}
        patientGlucose.notes =@"55";
        NSLog(@"  patientGlucose.notes%@ " , patientGlucose.notes );
        [self pushBusyOperation];
        PIKCommon *c = [PIKCommon sharedInstance] ;
        [c printObjectContents:patientGlucose];
        [patientGlucose createAsync:^(id object, NSError *error) {
 
            [self popBusyOperation];

            if (error) {
                NSLog(@"error = %@",error);
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else {
                    [self showMessage:@"Glucose record failed to add."];
                }
            }
            else {
                //we are modal here
                [self dismissViewControllerAnimated:YES completion:nil];
                
            }
        }];
    }
        
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    }
//}

//navigation button action
-(void)back{
    
    [self saveTapped];
}


#pragma mark - Textfield Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadView" object:nil userInfo:nil];
    self.somethingChanged = YES;
    
    if (textField == self.dateTextField) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:kDateFormat];
        
        if (textField.text.length == 0) {
            self.dateTextField.text = [formatter stringFromDate:[NSDate date]];
        }
        else {
            self.datePicker.date = [formatter dateFromString:self.dateTextField.text];
            
        }
    }
    else if (textField == self.timeFrameTextField) {
        if (textField.text.length > 0) {
            
            NSInteger row = [self.timeFrameData indexOfObject:self.timeFrameTextField.text];
            
            [self.timeFramePicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            self.timeFrameTextField.text = [self.timeFrameData objectAtIndex:0];
        }
    }
    else if (textField == self.glucoseLevelTextField) {
        if (textField.text.length > 0) {
            
            NSInteger row = [self.glucoseLevelData indexOfObject:self.glucoseLevelTextField.text];
            
            [self.glucoseLevelPicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            self.glucoseLevelTextField.text = [self.glucoseLevelData objectAtIndex:0];
        }
    }
    
    
    return YES;
}


#pragma mark - TextView Delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadView" object:nil userInfo:nil];
    self.somethingChanged = YES;

    if ([textView.text isEqualToString:kFieldPlaceHolderText]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = kFieldPlaceHolderText;
        textView.textColor = [UIColor lightGrayColor];
    }
}


#pragma mark - PickerView delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    NSInteger numberOfRows = 0;
    
    if (pickerView == self.glucoseLevelPicker) {
        numberOfRows = self.glucoseLevelData.count;
    }
    else {
        numberOfRows = self.timeFrameData.count;
    }
    
    return numberOfRows;
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString *title;
    
    if (pickerView == self.glucoseLevelPicker) {
        title =  [self.glucoseLevelData objectAtIndex:row];
        
    }
    else {
        title = [self.timeFrameData objectAtIndex:row];
    }
    
    return title;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (pickerView == self.glucoseLevelPicker) {
        
        self.glucoseLevelTextField.text = [self.glucoseLevelData objectAtIndex:row];
        
    }
    else {
        self.timeFrameTextField.text = [self.timeFrameData objectAtIndex:row];
    }
}


- (void)saveDate:(UIDatePicker *)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:kDateFormat];
    NSString *stringFromDate = [formatter stringFromDate:sender.date];
    
    self.dateTextField.text = stringFromDate;
    
}


- (IBAction)doneBarButtonItemTapped
{
    
    [self.noteTextView resignFirstResponder];
    [super doneBarButtonItemTapped];
}




@end
