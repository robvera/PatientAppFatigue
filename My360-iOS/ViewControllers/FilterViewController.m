//
//  FilterViewController.m
//  MSPatient
//
//  Created by David Benko on 5/24/13.
//
//

#import "FilterViewController.h"
#import <APSDK/TreatmentType+Remote.h>
#import "ContentCell.h"
#import "FPPopoverController.h"
#import "SBTableAlert.h"
#import "UIViewController+UI.h"
#import <APSDK/PatientTreatment+Remote.h>
#import <APSDK/Medication+Remote.h>
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "UITextField+APTextFieldExtensions.h"


@interface FilterViewController ()

@end

@implementation FilterViewController
@synthesize checksMedication;
@synthesize checksNonMedication;
@synthesize tableView = _tableView;
@synthesize multiCheck;
@synthesize multiCheckPicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tag = 1;
    [self.tableView setFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    
    self.multiCheckPicker = [[ALPickerView alloc]init];
    self.multiCheckPicker.delegate = self;
    
    [self resetMedicationChecks];
    [self resetTreatmentChecks];
}
#pragma mark - SBTableAlertDataSource

- (UITableViewCell *)tableAlert:(SBTableAlert *)tableAlert cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;
	
	cell = (ContentCell *) [self.tableView dequeueReusableCellWithIdentifier:nil];
    if(cell == nil)cell = [[ContentCell alloc]init];
    if (tableAlert.tag == 2){
        ((ContentCell *)cell).contentLabel.text = [self.checksNonMedication.allKeys objectAtIndex:indexPath.row];
        cell.accessoryType = [((NSNumber *)[self.checksNonMedication objectForKey:[self.checksNonMedication.allKeys objectAtIndex:indexPath.row]]) boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
    else if (tableAlert.tag == 3){
        ((ContentCell *)cell).contentLabel.text = [self.checksMedication.allKeys objectAtIndex:indexPath.row];
        cell.accessoryType = [((NSNumber *)[self.checksMedication objectForKey:[self.checksMedication.allKeys objectAtIndex:indexPath.row]]) boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
	return cell;
}

- (NSInteger)tableAlert:(SBTableAlert *)tableAlert numberOfRowsInSection:(NSInteger)section {
    if (tableAlert.tag == 2)
        return self.checksNonMedication.allKeys.count;
    else if(tableAlert.tag == 3) return self.checksMedication.allKeys.count;
    else return 0;
}

- (NSInteger)numberOfSectionsInTableAlert:(SBTableAlert *)tableAlert {
		return 1;
}

- (void)tableAlert:(SBTableAlert *)tableAlert didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (tableAlert.type == SBTableAlertTypeMultipleSelct) {
		UITableViewCell *cell = [tableAlert.tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = (cell.accessoryType == UITableViewCellAccessoryCheckmark) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
		[tableAlert.tableView deselectRowAtIndexPath:indexPath animated:YES];
	}
    
    if (tableAlert.tag == 2) {
        [self.checksNonMedication setObject:[NSNumber numberWithBool:![((NSNumber *)[self.checksNonMedication objectForKey:[self.checksNonMedication.allKeys objectAtIndex:indexPath.row]]) boolValue]] forKey:[self.checksNonMedication.allKeys objectAtIndex:indexPath.row]];
    }
    else if(tableAlert.tag == 3){
        [self.checksMedication setObject:[NSNumber numberWithBool:![((NSNumber *)[self.checksMedication objectForKey:[self.checksMedication.allKeys objectAtIndex:indexPath.row]]) boolValue]] forKey:[self.checksMedication.allKeys objectAtIndex:indexPath.row]];
    }
    
    [self.tableView reloadData];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
#pragma mark - TableView Data Source Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1)
        return 2;
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (tableView.tag == 1) {
        if (indexPath.row == 0) {
            [self showMedicationChoicesPicker];
        }
        else if (indexPath.row == 1){
            [self showNonMedicationChoicesPicker];
        }
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentCell *cell = (ContentCell *) [tableView dequeueReusableCellWithIdentifier:nil];
    if(cell == nil)cell = [[ContentCell alloc]init];
    if (tableView.tag == 1){
        switch (indexPath.row) {
            case 0:{
                cell.contentLabel.text = @"Medications";
                int count = 0;
                for (NSString *key in [self.checksMedication allKeys])
                    if([[self.checksMedication objectForKey:key] boolValue])
                        count++;
                if(count == 0) cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"empty-circle.png"]];
                else if(count > 0 && count < self.checksMedication.allKeys.count) cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"half-circle.png"]];
                else if(count == self.checksMedication.allKeys.count) cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"full-circle.png"]];
                break;
            }
            case 1:{
                cell.contentLabel.text = @"Non-Medications";
                int count = 0;
                for (NSString *key in [self.checksNonMedication allKeys])
                    if([[self.checksNonMedication objectForKey:key] boolValue])
                        count++;
                if(count == 0) cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"empty-circle.png"]];
                else if(count > 0 && count < self.checksNonMedication.allKeys.count) cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"half-circle.png"]];
                else if(count == self.checksNonMedication.allKeys.count) cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"full-circle.png"]];
                break;
            }
            default:
                cell.contentLabel.text = @"";
                break;
        }
    }
    return cell;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

-(void)resetMedicationChecks {
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.checksNonMedication = [[NSMutableDictionary alloc]init];
    for (TreatmentType *tt in ad.treatmentTypeData)
        if (![tt.id isEqualToNumber:@1])[self.checksNonMedication setObject:[NSNumber numberWithBool:NO] forKey:tt.name];
}
-(void)resetTreatmentChecks {
    
    if (self.checksMedication == nil || self.checksMedication.allKeys.count == 0) {
        self.checksMedication = [[NSMutableDictionary alloc]init];
        NSArray * cache = [PatientTreatment query:@"my_medications" params:nil async:^(NSArray *objects, NSError *error) {
            if(!error){
                NSArray *patientMedications = [NSArray arrayWithArray:objects];
                for (PatientTreatment *pt in patientMedications){
                    [self.checksMedication setObject:[NSNumber numberWithBool:NO] forKey:pt.medicationDenormalized];
                }
                
            }
        }];
        if(cache.count > 0) {
            for (PatientTreatment *pt in cache){
                [self.checksMedication setObject:[NSNumber numberWithBool:NO] forKey:pt.medicationDenormalized];
            }
        }
    }
    else {
        for (int i = 0; i < self.checksMedication.allKeys.count; i++){
            [self.checksMedication setObject:[NSNumber numberWithBool:NO] forKey:[self.checksMedication.allKeys objectAtIndex:i]];
        }
    }
    
}

-(void)showNonMedicationChoices {
    self.multiCheck	= [[SBTableAlert alloc] initWithTitle:@"Multiple Select" cancelButtonTitle:@"OK" messageFormat:@"Select treatments"];
    [self.multiCheck setType:SBTableAlertTypeMultipleSelct];
    [self.multiCheck setTag:2];
	[self.multiCheck setDelegate:self];
	[self.multiCheck setDataSource:self];
	
	[self.multiCheck show];
}
-(void)showMedicationChoices {
    self.multiCheck	= [[SBTableAlert alloc] initWithTitle:@"Multiple Select" cancelButtonTitle:@"OK" messageFormat:@"Select medications"];
    [self.multiCheck setType:SBTableAlertTypeMultipleSelct];
    [self.multiCheck setTag:3];
	[self.multiCheck setDelegate:self];
	[self.multiCheck setDataSource:self];
	
	[self.multiCheck show];
}

#pragma mark - Picker
-(void)showNonMedicationChoicesPicker {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    frame.origin.y += [[UIScreen mainScreen] bounds].size.height;
    
    UIView *wrapper = [[UIView alloc]initWithFrame:frame];
    
    CGRect pickerFrame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 216, 0, 0);
    self.multiCheckPicker = [[ALPickerView alloc] initWithFrame:pickerFrame];
    self.multiCheckPicker.delegate = self;
    self.multiCheckPicker.tag = 2;
    
    UIToolbar *pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.multiCheckPicker.frame.origin.y -44, 320, 44)];
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissMultiPicker)];
    [barItems addObject:doneBtn];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    wrapper.tag = 9987;
    [wrapper addSubview:self.multiCheckPicker];
    [wrapper addSubview:pickerDateToolbar];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:wrapper];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         CGRect frame = wrapper.frame;
                         frame.origin.y -= [[UIScreen mainScreen] bounds].size.height;
                         [wrapper setFrame:frame];
                     }
                     completion:nil
     ];
}
-(void)showMedicationChoicesPicker {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    frame.origin.y += [[UIScreen mainScreen] bounds].size.height;
    
    UIView *wrapper = [[UIView alloc]initWithFrame:frame];
    
    CGRect pickerFrame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 216, 0, 0);
    self.multiCheckPicker = [[ALPickerView alloc] initWithFrame:pickerFrame];
    self.multiCheckPicker.delegate = self;
    self.multiCheckPicker.tag = 3;
    
    UIToolbar *pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.multiCheckPicker.frame.origin.y -44, 320, 44)];
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissMultiPicker)];
    [barItems addObject:doneBtn];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    wrapper.tag = 9987;
    [wrapper addSubview:self.multiCheckPicker];
    [wrapper addSubview:pickerDateToolbar];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:wrapper];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         CGRect frame = wrapper.frame;
                         frame.origin.y -= [[UIScreen mainScreen] bounds].size.height;
                         [wrapper setFrame:frame];
                     }
                     completion:nil
     ];
}

-(void)dismissMultiPicker {    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         CGRect frame = ((UIView *)[[[[UIApplication sharedApplication] delegate] window] viewWithTag:9987]).frame;
                         frame.origin.y += [[UIScreen mainScreen] bounds].size.height;
                         [((UIView *)[[[[UIApplication sharedApplication] delegate] window] viewWithTag:9987]) setFrame:frame];
                     }
                     completion:^(BOOL finished){
                                 [[[[[UIApplication sharedApplication] delegate] window] viewWithTag:9987] removeFromSuperview];
                    }
    ];

    
}

#pragma mark -
#pragma mark ALPickerView delegate methods




- (NSInteger)numberOfComponentsInPickerView:(ALPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(ALPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag == 2)
        return self.checksNonMedication.allKeys.count;
    else if(pickerView.tag == 3) return self.checksMedication.allKeys.count;
    else return 0;
    
}


- (NSInteger)numberOfRowsForPickerView:(ALPickerView *)pickerView {
    if (pickerView.tag == 2)
        return self.checksNonMedication.allKeys.count;
    else if(pickerView.tag == 3) return self.checksMedication.allKeys.count;
    else return 0;
}

- (NSString *)pickerView:(ALPickerView *)pickerView textForRow:(NSInteger)row {
	if (pickerView.tag == 2){
        return [self.checksNonMedication.allKeys objectAtIndex:row];
    }
    else if (pickerView.tag == 3){
        return [self.checksMedication.allKeys objectAtIndex:row];
    }
    else return @"";
}

- (BOOL)pickerView:(ALPickerView *)pickerView selectionStateForRow:(NSInteger)row {
    if (pickerView.tag == 2){
        return [(NSNumber *)[self.checksNonMedication objectForKey:[self.checksNonMedication.allKeys objectAtIndex:row]] boolValue];
    }
    else if (pickerView.tag == 3){
        return [(NSNumber *)[self.checksMedication objectForKey:[self.checksMedication.allKeys objectAtIndex:row]] boolValue];
    }
    else return false;
}

- (void)pickerView:(ALPickerView *)pickerView didCheckRow:(NSInteger)row {
	// Check whether all rows are checked or only one
    if (pickerView.tag == 2){
        if (row == -1)
            for (id key in [self.checksNonMedication allKeys])
                [self.checksNonMedication setObject:[NSNumber numberWithBool:YES] forKey:key];
        else
            [self.checksNonMedication setObject:[NSNumber numberWithBool:YES] forKey:[self.checksNonMedication.allKeys objectAtIndex:row]];
    }
    else if (pickerView.tag == 3){
        if (row == -1)
            for (id key in [self.checksMedication allKeys])
                [self.checksMedication setObject:[NSNumber numberWithBool:YES] forKey:key];
        else
            [self.checksMedication setObject:[NSNumber numberWithBool:YES] forKey:[self.checksMedication.allKeys objectAtIndex:row]];
    }
    [self.tableView reloadData];
}

- (void)pickerView:(ALPickerView *)pickerView didUncheckRow:(NSInteger)row {
	// Check whether all rows are unchecked or only one
    if (pickerView.tag == 2){
        if (row == -1)
            for (id key in [self.checksNonMedication allKeys])
                [self.checksNonMedication setObject:[NSNumber numberWithBool:NO] forKey:key];
        else
            [self.checksNonMedication setObject:[NSNumber numberWithBool:NO] forKey:[self.checksNonMedication.allKeys objectAtIndex:row]];
    }
    else if (pickerView.tag == 3){
        if (row == -1)
            for (id key in [self.checksMedication allKeys])
                [self.checksMedication setObject:[NSNumber numberWithBool:NO] forKey:key];
        else
            [self.checksMedication setObject:[NSNumber numberWithBool:NO] forKey:[self.checksMedication.allKeys objectAtIndex:row]];
    }
    [self.tableView reloadData];
}



@end
