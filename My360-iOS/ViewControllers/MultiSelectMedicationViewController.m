//
//  MultiSelectMedicaionViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/7/13.
//
//

#import "MultiSelectMedicationViewController.h"
#import <APSDK/PatientSideEffectMedication.h>
#import <APSDK/PatientTreatment.h>
#import "SelectionListCell.h"
#import <APSDK/Medication+Remote.h>

@interface MultiSelectMedicationViewController ()

@end

@implementation MultiSelectMedicationViewController

@synthesize tableData;
@synthesize selectedTableData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void) viewDidDisappear:(BOOL)animated{
    
    [self saveTapped];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveTapped {
    
    
    NSArray *selectedMedications = [NSArray arrayWithArray:self.selectedTableData];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObject:selectedMedications] forKeys:[NSArray arrayWithObject:@"medicationList"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedMedicationList" object:nil userInfo:userInfo];
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
    
    PatientTreatment *patientTreatment = [self.tableData objectAtIndex:indexPath.row];
    
    
    if ([self.selectedTableData containsObject:patientTreatment]) {
        
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_Check_Box.png"]];
    }
    
    else {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CheckBox_Empty.png"]];
        
    }    
    
    cell.contentLabel.text = patientTreatment.medicationDenormalized;
    CGRect frame = cell.contentLabel.frame;
    frame.size.width = 200;
    cell.contentLabel.frame = frame;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    PatientTreatment *patientTreatment = [self.tableData objectAtIndex:indexPath.row];

    if ([self.selectedTableData containsObject:patientTreatment]) {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CheckBox_Empty.png"]];
        [self.selectedTableData removeObject:patientTreatment];
    }
    else {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_Check_Box.png"]];
        [self.selectedTableData addObject:patientTreatment];

    }
    
    //deselect so this method is called every time row is tapped
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
