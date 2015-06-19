//
//  MedicationViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/4/13.
//
//

#import "MedicationViewController.h"
#import <APSDK/Medication.h>
#import "SelectionListCell.h"
#import "ConfigurationManager.h"   //svaz added for alert
#import <APSDK/Setting+Remote.h> //svaz added for alert
#import "PikConstants.h"
#import "ConfigurationManager.h"
#import "TutorialView.h"

#import <APSDK/AuthManager.h>
#import "AuthManager+Rules.h"
#import "PIKAnalyticsManager.h"




//#import "APNavigationController.h"

@interface MedicationViewController ()

@end

@implementation MedicationViewController

@synthesize tableData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.showBrandNames = YES;
    searchItems = [[NSMutableArray alloc] init];
    sectionHeaders = [[NSMutableArray alloc]init];
    sectionDefinition = [[NSMutableDictionary alloc]init];
    
    //Add the search bar
    self.tableView.tableHeaderView = searchBar;
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.delegate = self;
    searching = NO;
    letUserSelectRow = YES;
    
    //            -  iPad cleanup rvera 4/27/15
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.frame = self.view.bounds;
    //        end     -  iPad cleanup rvera 4/27/15
    
}
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView setContentOffset:CGPointMake(0, 44)];
    [self organizeData];
    [self.tableView reloadData];
    //[((APNavigationController *)self.navigationController) removeAlert];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchTapped
{
    //user tapped button to see the alternative list
    //update the button label and reload the table
    /*self.showBrandNames = !self.showBrandNames;
    
    if (self.showBrandNames) {
        self.rightBarButtonItem.title = @"Generic";
    }
    else {
        self.rightBarButtonItem.title = @"Brand Name";
    }
    
    [self.tableView reloadData];*/
    
}

#pragma mark - Property Override

-(void)organizeData{
    [sectionHeaders removeAllObjects];
    [sectionDefinition removeAllObjects];
    for(Medication *obj in self.tableData){
        NSString *section = [[obj.name substringWithRange:(NSRange){0,1}] capitalizedString];
        if (![sectionHeaders containsObject:section]) {
            [sectionHeaders addObject:section];
        }
        // First time - insert - svaz
        if([sectionDefinition objectForKey:section] == nil){
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            [arr addObject:obj];
            [sectionDefinition setObject:arr forKey:section];
           
        }
        else {
            // after the 1st time - svaz
               [(NSMutableArray *)[sectionDefinition objectForKey:section] addObject:obj];
        }
    }
    
    [sectionHeaders sortUsingSelector:@selector(compare:)];
    [sectionHeaders insertObject:UITableViewIndexSearch atIndex:0];
}




#pragma mark - UISearchBar

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
    
    searching = YES;
    letUserSelectRow = NO;
    self.tableView.scrollEnabled = NO;
    
    //Add the done button.
    /*self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                               target:self action:@selector(doneSearching_Clicked:)];*/
}
- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    //Remove all objects first.
    [searchItems removeAllObjects];
    
    if([searchText length] > 0) {
        
        searching = YES;
        letUserSelectRow = YES;
        self.tableView.scrollEnabled = YES;
        [self searchTableView];
    }
    else {
        
        searching = NO;
        letUserSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }
    
    [self.tableView reloadData];
}
- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [self searchTableView];
    
}

- (void) searchTableView {
    NSString *searchText = searchBar.text;
    NSMutableArray *searchArray = [[NSMutableArray alloc] init];
    
    NSArray *array = [tableData copy];
    [searchArray addObjectsFromArray:array];
    
    for (Medication *med in searchArray)
    {
        NSRange brandRange = [med.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if (brandRange.length > 0)
            [searchItems addObject:med];
    }
    searchArray = nil;
}
- (void) doneSearching_Clicked:(id)sender {
    
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    
    letUserSelectRow = YES;
    searching = NO;
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    self.tableView.scrollEnabled = YES; 
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)  return @"";
    else return [sectionHeaders objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    if(searching)
        return nil;
    
    return sectionHeaders;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    if(searching)
        return -1;
    
    if(index == 0){
        [self.tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    
    return index;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(searching) return 1;
    else return [sectionHeaders count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searching) return [searchItems count];
    else return [((NSMutableArray *)[sectionDefinition objectForKey:[sectionHeaders objectAtIndex:section]]) count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    Medication *medication;
    if(searching)medication = [searchItems objectAtIndex:indexPath.row];
    else medication = [(NSMutableArray *)[sectionDefinition objectForKey:[sectionHeaders objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    /*
     * Blank out old data from formerly dequeued cells
     * This will stop old values from reappearing when the cells are reused and the new data is blank.
     */
    
    cell.contentLabel.text = @"";
    cell.secondaryLabel.text = @"";
    
    // Now set new data when it exists in the new, cleaned cells.
    cell.contentLabel.text = medication.name;
    
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //   *****         -  iOs 8 cleanup svaz 1/16/2015   -end
//    return 44;
    return kRowHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Medication *medication;
    if(searching)medication = [searchItems objectAtIndex:indexPath.row];
    else medication = [(NSMutableArray *)[sectionDefinition objectForKey:[sectionHeaders objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];

    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: medication, @"medication", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedMedication" object:nil userInfo:userInfo];
    if ([[[ConfigurationManager sharedManager] appID] integerValue] == HepC)
    {
        [self showWarning:[medication.name uppercaseString]]; // Calls the alert message --rvera 9/5/14
    }
}
- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(letUserSelectRow)
        return indexPath;
    else
        return nil;
}

//// Added to show alert for specific Medication on the alertTreatmentMedication.adt file  - rvera 9/5/14
- (void)showWarning:(NSString*) currentMedication{
    
    //Medications
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alerttreatmentmedication"
                                                         ofType:@"dat"];
    NSString *_jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if ([_jsonString rangeOfString:currentMedication].location != NSNotFound){
        NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[[ConfigurationManager sharedManager] appID], nil] forKeys:[NSArray arrayWithObjects:@"app_id", nil]];
        [Setting exactMatchWithParams:params offset:0 limit:10 async:^(NSArray *objects, NSError *error) {
            //Setting *globals;     //Not a global alert --rvera
            if (!error) {
                if ([objects count] > 0) {
                   // globals = [objects objectAtIndex:0]; // there should only be one
                    UIAlertView *alert = [[UIAlertView alloc]init];
                    alert.title = @"Warning!";
                    alert.message = @"Take this medication with food to ensure the drug is properly absorbed in your body."; //globals.severeSymptomMsg
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
