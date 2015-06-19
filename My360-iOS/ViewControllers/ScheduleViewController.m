//
//  ScheduleViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/5/13.
//
//

#import "ScheduleViewController.h"
#import <APSDK/TreatmentSchedule.h>
#import "SelectionListCell.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import "ConfigurationManager.h"


@interface ScheduleViewController ()

@end

@implementation ScheduleViewController

@synthesize tableData;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sorter];
    
    self.tableData = [self.tableData sortedArrayUsingDescriptors:sortDescriptors];

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
    // Return the number of sections.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tableData.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//            - ios cleanup svaz 1/20/15
//    return 44.0;
    return kRowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    TreatmentSchedule *treatmentSchedule = [self.tableData objectAtIndex:indexPath.row];
    
    cell.contentLabel.text = treatmentSchedule.name;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TreatmentSchedule *treatmentSchedule = [self.tableData objectAtIndex:indexPath.row];

// add popup if "As NEEDED" is selected - svaz 9/19/14 - per Trello
// the popup was moved to  Schedule Detail VC  -rvera 10/10/14
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: treatmentSchedule, @"schedule", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedSchedule" object:nil userInfo:userInfo];
    
} //END of tableView method

@end
