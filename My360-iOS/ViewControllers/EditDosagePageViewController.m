//
//  EditDosagePageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/6/13.
//
//

#import "EditDosagePageViewController.h"
#import "PikConstants.h"

@interface EditDosagePageViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet UITextField * dosageTextField;
@property (nonatomic, weak) IBOutlet UITextField * dosageUomTextField;

@end

@implementation EditDosagePageViewController

@synthesize dosageUom = _dosageUom;
@synthesize dosageUomPicker = _dosageUomPicker;



- (void)viewDidLoad
{
    [super viewDidLoad];

    //RV added label
    self.dosageTextField.placeholder = kFieldPlaceHolderText;
    //
    self.dosageTextField.text = [self.dosage stringValue];
    
    //RV added label
    self.dosageUomTextField.placeholder = kFieldPlaceHolderText;
    //
    
    self.dosageUomTextField.text = self.dosageUom.name;
    self.dosageUomTextField.tag = kFormViewControllerFieldNumber;
    
    self.fields = @[self.dosageTextField, self.dosageUomTextField];
    
    
    for (UITextField * field in self.fields) {
        field.inputAccessoryView = self.inputAccessoryViewToolbar;
        
        
        if (field.tag == kFormViewControllerFieldNumber){
            field.inputView = self.dosageUomPicker;
        }
    }
    
    //set defaults for required fields
    if (!self.editMode) {
        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        self.dosageUom = [ad.dosageUomData objectAtIndex:0];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (BOOL)saveTapped {
    
    /*if([self.dosageTextField.text length]< 1){
        UIAlertView *alert = [[UIAlertView alloc]init];
        [alert setMessage:@"A dosage amount is required."];
        [alert setTitle:@"Error!"];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
        return false;
    }
    
    
    if (self.dosageUomTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A unit of measure is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
        
    }*/
    
    
    NSNumber *dosage = [NSNumber numberWithFloat:[self.dosageTextField.text floatValue]];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: self.dosageUom, @"dosageUom", dosage, @"dosage", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedDosage" object:nil userInfo:userInfo];
    
    return true;

}


- (UIPickerView *)dosageUomPicker {
    if (!_dosageUomPicker) {
        _dosageUomPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        
        _dosageUomPicker.delegate = self;
        _dosageUomPicker.dataSource = self;
        _dosageUomPicker.showsSelectionIndicator = YES;
        
        [_dosageUomPicker sizeToFit];
    }
    
    return _dosageUomPicker;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (textField == self.dosageUomTextField) {
        if (textField.text.length > 0) {
            
            NSInteger row = [ad.dosageUomData indexOfObject:self.dosageUom];

            [self.dosageUomPicker selectRow:row inComponent:0 animated:YES];
        }
        else {
            self.dosageUom = [ad.dosageUomData objectAtIndex:0];
            textField.text = self.dosageUom.name;
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
    return ad.dosageUomData.count;
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    DosageUom *dosageUom = [ad.dosageUomData objectAtIndex:row];
    return dosageUom.name;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.dosageUom = [ad.dosageUomData objectAtIndex:row];
    self.dosageUomTextField.text = self.dosageUom.name;
    
}

-(void)back{
    if([self saveTapped])
    {
        self.navigationItem.leftBarButtonItem.enabled = NO;
        
    }
    else
        {return;}
}



@end
