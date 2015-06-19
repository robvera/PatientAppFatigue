//
//  SideEffectViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/7/13.
//
//

#import "SideEffectViewController.h"
#import <APSDK/SideEffect.h>
#import "SelectionListCell.h"
#import "ConfigurationManager.h"   //svaz added for alert
#import <APSDK/Setting+Remote.h> //svaz added for alert

@interface SideEffectViewController ()

@end

@implementation SideEffectViewController

@synthesize tableData;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    SideEffect *sideEffect = [self.tableData objectAtIndex:indexPath.row];
    
    cell.contentLabel.text = sideEffect.name;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideEffect *sideEffect = [self.tableData objectAtIndex:indexPath.row];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: sideEffect, @"sideEffect", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedSideEffect" object:nil userInfo:userInfo];
    
    [self showWarning:[sideEffect.name uppercaseString]]; // Calls the alert message --rvera 9/5/14

}

//// Added to show alert for specific Medication on the alertTreatmentMedication.adt file  - rvera 9/5/14
- (void)showWarning:(NSString*) currentSideEffect{
    
    //Medications
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alert"
                                                         ofType:@"dat"];
    NSString *_jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if ([_jsonString rangeOfString:currentSideEffect].location != NSNotFound){
        NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[[ConfigurationManager sharedManager] appID], nil] forKeys:[NSArray arrayWithObjects:@"app_id", nil]];
        [Setting exactMatchWithParams:params offset:0 limit:10 async:^(NSArray *objects, NSError *error) {
            Setting *globals;     //Not a global alert --rvera
            if (!error) {
                if ([objects count] > 0) {
                    globals = [objects objectAtIndex:0]; // there should only be one
                    UIAlertView *alert = [[UIAlertView alloc]init];
                    alert.title = @"Warning!";
                    alert.message = globals.severeSymptomMsg; //this message is the 911 popup
                    [alert addButtonWithTitle:@"OK"];
                    [alert setCancelButtonIndex:0];
                    [alert setTag:1];
                    [alert show];
                }
            }
        }];
        
    }
    
}

@end
