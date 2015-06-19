//
//  MultiSelectMedicalConditionPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "MultiSelectMedicalConditionPageViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import <APSDK/PatientMedicalCondition.h>
#import <APSDK/PatientMedicalCondition+Remote.h>
#import <APSDK/MedicalCondition.h>
#import "UIViewController+UI.h"
#import "SelectionListCell.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>

#import "ConfigurationManager.h"   //rvera added for alert
#import <APSDK/Setting+Remote.h> //rvera added for alert
#import "PikConstants.h" //rvera added for alert



@interface MultiSelectMedicalConditionPageViewController ()

@end

@implementation MultiSelectMedicalConditionPageViewController

@synthesize tableData;
@synthesize selectedTableData;



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundView = nil;
    if ([[[ConfigurationManager sharedManager] appID] integerValue] == MDD)
    {
        [self medicationConditionMsg]; //This requested was by trello for MDD - 12/5/14 rvera
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)saveTapped {
    
    
    NSString *selectedMedicalConditionIds = @"";
    
    for (PatientMedicalCondition *patientMedicalCondition in self.selectedTableData) {
        
        selectedMedicalConditionIds = [selectedMedicalConditionIds stringByAppendingString:[patientMedicalCondition.medicalCondition.id stringValue]];
        selectedMedicalConditionIds = [selectedMedicalConditionIds stringByAppendingString:@", "];
        
    }
    if ([selectedMedicalConditionIds length] >= 2) selectedMedicalConditionIds = [selectedMedicalConditionIds substringToIndex:[selectedMedicalConditionIds length] - 2];

    
    PatientMedicalCondition *patientMedicalCondition = [PatientMedicalCondition new];
    
    patientMedicalCondition.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
    patientMedicalCondition.medicalConditionIds = selectedMedicalConditionIds;
    
    
    [self pushBusyOperation];
    __block MultiSelectMedicalConditionPageViewController * _self = self;
    //SAVING ON SERVER -svaz
    [patientMedicalCondition createAsync:^(id obj, NSError * error) {
        if (error) {
            [_self popBusyOperation];
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else [_self showMessage:@"Medical condition failed to add."];
        } else {
            [_self popBusyOperation];
            
            //[_self showMessage:@"Medical condition successfully added."];
        }
        
    }];
    
    return true;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    // Return the number of sections.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tableData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryView = nil;
    cell.contentLabel.text= @"";
    BOOL found = NO;
    MedicalCondition *medicalCondition = (MedicalCondition *)[self.tableData objectAtIndex:indexPath.row];
    //since the objects in the selected list differ in type from the what is displayed in
    //the list we must loop through to determine if it is selected
    for (PatientMedicalCondition *patientMedicalCondition in self.selectedTableData) {
        if ([patientMedicalCondition.medicalCondition.id intValue] == [medicalCondition.id intValue]) {
            found = YES;
            break;
        }
    }
    if (found) {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_Check_Box.png"]];
    }
    else {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CheckBox_Empty.png"]];
        
    }
    cell.contentLabel.text = medicalCondition.name;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    BOOL found = NO;
    
    MedicalCondition *medicalCondition = (MedicalCondition *)[self.tableData objectAtIndex:indexPath.row];
    for (PatientMedicalCondition *patientMedicalCondition in self.selectedTableData) {
        if ([patientMedicalCondition.medicalCondition.id intValue] == [medicalCondition.id intValue]) {
            [self.selectedTableData removeObject:patientMedicalCondition];
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CheckBox_Empty.png"]];
            found = YES;
            break;
        }
    }
    
    if (!found) {
        
        MedicalCondition *mc = [MedicalCondition new];
        mc.id = medicalCondition.id;
        mc.name = medicalCondition.name;
        mc.inactive = medicalCondition.inactive;
        
        PatientMedicalCondition *patientMedicalCondition = [PatientMedicalCondition new];
        patientMedicalCondition.medicalCondition = mc;
        patientMedicalCondition.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        [self.selectedTableData addObject:patientMedicalCondition];
        
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_Check_Box.png"]];
    }
    
    //deselect so this method is called every time row is tapped
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(void)back{
    if([self saveTapped]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedMedicationList" object:nil userInfo:nil];
    }
    else return;
}

//This requested was by trello for MDD - 12/5/14 rvera
- (IBAction)medicationConditionMsg{
    UIAlertView *alertMsg = [[UIAlertView alloc]initWithTitle: nil // @"ALERT!"
                                                      message: @"“Depression can worsen other health problems, like diabetes or hypertension. Conversely, a poorly controlled co-occurring condition, like alcoholism or diabetes, can worsen depressive symptoms.”"
                                                     delegate: nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [alertMsg show];
    NSLog(@"medicationCondition Message Tapped");
}


@end
