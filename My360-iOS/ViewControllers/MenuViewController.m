//
//  MenuViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "MenuViewController.h"
#import <APSDK/AuthManager.h>
#import "ClinicianListPageViewController.h"
#import "ConfigurationManager.h"

#import <APSDK/Ability+Remote.h>
#import <APSDK/DosageUom+Remote.h>
#import <APSDK/IngestionMethod+Remote.h>
#import <APSDK/LabResultStat+Remote.h>
#import <APSDK/Medication+Remote.h>
#import <APSDK/MissingTreatmentReason+Remote.h>
#import <APSDK/Mood+Remote.h>
#import <APSDK/SideEffect+Remote.h>
#import <APSDK/Symptom+Remote.h>
#import <APSDK/TestType+Remote.h>
#import <APSDK/TreatmentSchedule+Remote.h>
#import <APSDK/TreatmentType+Remote.h>

#import <APSDK/APObject+Remote.h>

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize logoutButtonCell;


- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [self.navigationController setNavigationBarHidden:NO];
    
    if (![[ConfigurationManager sharedManager] isOS7]) {
        //hide the background of the cell
        self.logoutButtonCell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return nil;
    }
    
    return [super tableView:tableView viewForHeaderInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return nil;
    }
    
    return [super tableView:tableView viewForFooterInSection:section];
}

*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"ShowClinicianPage"]) {
        
        ((ClinicianListPageViewController *)segue.destinationViewController).editMode = NO;
    }
}


- (IBAction)logoutButtonTapped
{
    
    [[AuthManager defaultManager] signOutAsync:^(id<Authorizable> object, NSError *error) {
        
        if (error) {
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else{
            [[[UIAlertView alloc] initWithTitle:@"Failure" message:@"There was an error. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
        }
        else {
            //success
            [self dismissViewControllerAnimated:NO completion:nil];
            AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            ad.sessionOpen = FALSE;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedLogout" object:nil userInfo:nil];
            [((AppDelegate*)[[UIApplication sharedApplication] delegate]) setRootLoginController];
            
        }
    }];
}



-(IBAction)closeButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if(indexPath) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}
@end
