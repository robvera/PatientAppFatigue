//
//  TreatmentTypeViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/4/13.
//
//

#import "TreatmentTypeViewController.h"
#import <APSDK/TreatmentType.h>
#import "SelectionListCell.h"
#import "PikConstants.h"

@interface TreatmentTypeViewController ()

@end

@implementation TreatmentTypeViewController


@synthesize tableData;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    self.tableData = [self.tableData sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];

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
    
    //            - ios cleanup svaz 1/23/15
//    return 44.0;
    return kRowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    TreatmentType *treatmentType = [self.tableData objectAtIndex:indexPath.row];
    
    cell.contentLabel.text = treatmentType.name;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TreatmentType *treatmentType = [self.tableData objectAtIndex:indexPath.row];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: treatmentType, @"treatmentType", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedTreatmentType" object:nil userInfo:userInfo];
}

@end
