//
//  MultiSelectSymptomViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/18/13.
//
//

#import "MultiSelectSymptomViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import <APSDK/Symptom.h>
#import "UIViewController+UI.h"
#import "SelectionListCell.h"
#import "UIColor+APColorExtension.h"

#import "ConfigurationManager.h"   //svaz added for alert
#import <APSDK/Setting+Remote.h> //svaz added for alert
#import "PikConstants.h"

@interface MultiSelectSymptomViewController ()

@end

@implementation MultiSelectSymptomViewController{
    NSString *jsonString;
}

@synthesize tableData;
@synthesize selectedTableData;
@synthesize sectionedTableData;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self sortData];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alert"
                                                         ofType:@"dat"];
     jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveTapped {
    
    NSMutableArray *selectedSymptoms = [NSMutableArray arrayWithArray:self.selectedTableData];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: selectedSymptoms, @"symptomList", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedSymptomList" object:nil userInfo:userInfo];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self saveTapped];
}


-(void)sortData
{
    self.sectionedTableData = [[NSMutableDictionary alloc] init];
    
    BOOL found;
    
    for (Symptom *symptom in self.tableData) {
        //NSString *category = symptom.category;
        NSString *category = symptom.symptomCat; //RV New lable on API for SymtomsCat, TestTypeCat and medicationCat comented 6/8/15
        found = NO;
        
        //see if we already have the category
        for (NSString *sectionLabel in [self.sectionedTableData allKeys]) {
            if ([sectionLabel isEqualToString:category]) {
                found = YES;
                break;
            }
        }
        
        //category was not found so create a new array for it
        if (!found) {
            [self.sectionedTableData setValue:[[NSMutableArray alloc] init] forKey:category];
            
        }
        
        [[self.sectionedTableData objectForKey:category] addObject:symptom];
    }
    
    // Sort each section array
    for (NSString *key in [self.sectionedTableData allKeys])
    {
        
        //NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];      //was sortId
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];      //added teh caseInsensitiveCompare to compare the Upercase from the Lowcase -- rvera 11/15/14
        [[self.sectionedTableData objectForKey:key] sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    //[self.expandedSections setObject:[NSNumber numberWithBool:FALSE] forKey:key];
    
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [[self.sectionedTableData allKeys] count];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.sectionedTableData valueForKey:[[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Symptom *symptom = [[self.sectionedTableData valueForKey:[[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
/////Roberto----
    
    if (cell == nil) {
        //svaz changed  to SelectionListCell 4/18/14
        cell = [[SelectionListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, 104)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
    }
//////
    
    if ([self.selectedTableData containsObject:symptom]) {
        
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_Check_Box.png"]];
    }
    else {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CheckBox_Empty.png"]];
        
    }
    
/////Roberto----
    cell.contentLabel.textColor = [UIColor blackColor];
    cell.contentLabel.adjustsFontSizeToFitWidth = TRUE;
    cell.contentLabel.textAlignment = NSTextAlignmentLeft;//UITextAlignmentLeft;   - removed -svaz 9/4/14
    cell.contentLabel.font = [UIFont systemFontOfSize:11];
    cell.contentLabel.lineBreakMode = NSLineBreakByWordWrapping ;//UILineBreakModeWordWrap; -removed -svaz 9/4/14
    cell.contentLabel.numberOfLines = 2;
    cell.contentLabel.text = symptom.name;

///////
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 24)];
    headerView.backgroundColor = [UIColor darkBlue];
    
    UILabel *sectionTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 320, 20)];
    sectionTitle.textColor = [UIColor whiteColor];
    sectionTitle.backgroundColor = [UIColor clearColor];
    sectionTitle.text = [[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
    
    [headerView addSubview:sectionTitle];
    
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 24;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    Symptom *symptom = [[self.sectionedTableData valueForKey:[[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    
    if ([self.selectedTableData containsObject:symptom]) {
        
        [self.selectedTableData removeObject:symptom];
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CheckBox_Empty.png"]];
    }
    else {
        
        [self.selectedTableData addObject:symptom];
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_Check_Box.png"]];
        
        
        if ([[[ConfigurationManager sharedManager] appID] integerValue] == IPF)
        {
           //[self showWarningSymptoms:[symptom.name uppercaseString]]; // Calls the alert showWarningSymptoms message --rvera 11/5/14
             [self showAllSymptomsWarning:[symptom.name uppercaseString]]; // Calls the alert showAllSymptomsWarning message --rvera 12/8/14
        }else{
            // begin add svaz
            //        We'd like to show it again for the following symptoms:
            //        fever, bleeding, trouble breathing, or shortness of breath
            [self showWarning:[symptom.name uppercaseString]]; // end add svaz
        }
  }
    
    //deselect so this method is called every time row is tapped
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


// Added to show alert for specific symptoms - svaz
- (void)showWarning:(NSString*) currentSymptom{

    //Symptoms
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alert"
                                                     ofType:@"dat"];
    NSString *_jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if ([_jsonString rangeOfString:currentSymptom].location != NSNotFound){
        NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[[ConfigurationManager sharedManager] appID], nil] forKeys:[NSArray arrayWithObjects:@"app_id", nil]];
        [Setting exactMatchWithParams:params offset:0 limit:10 async:^(NSArray *objects, NSError *error) {
            Setting *globals;
            if (!error) {
                if ([objects count] > 0) {
                    globals = [objects objectAtIndex:0]; // there should only be one
                    UIAlertView *alert = [[UIAlertView alloc]init];
                    alert.title = @"Warning!";
                    alert.message = globals.severeSymptomMsg;
                    [alert addButtonWithTitle:@"OK"];
                    [alert setCancelButtonIndex:0];
                    [alert setTag:1];
                    [alert show];
                }
            }
        }];
        
    }

}




// Added to show alert for Specific Symptoms on the alert ONLY FOR IPF   - rvera 9/5/14
// Added to show alert for Specific Symptoms on the alert ONLY FOR IPF   - rvera 9/5/14
// Added to show alert for Specific Symptoms on the alert ONLY FOR IPF   - rvera 9/5/14

//- (void)showWarningSymptoms:(NSString*) specificsymptoms{
//    
//    //Medications
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alert"
//                                                         ofType:@"dat"];
//    NSString *_jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    
//    if ([_jsonString rangeOfString:specificsymptoms].location != NSNotFound){
//        NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[[ConfigurationManager sharedManager] appID], nil] forKeys:[NSArray arrayWithObjects:@"app_id", nil]];
//        [Setting exactMatchWithParams:params offset:0 limit:10 async:^(NSArray *objects, NSError *error) {
//            //Setting *globals;     //Not a global alert --rvera
//            if (!error) {
//                if ([objects count] > 0) {
//                    // globals = [objects objectAtIndex:0]; // there should only be one
//                    UIAlertView *alert = [[UIAlertView alloc]init];
//                    alert.title = @"Warning!";
//                    alert.message = @"Call your physician if these symptoms are occurring."; //globals.severeSymptomMsg
//                    [alert addButtonWithTitle:@"OK"];
//                    [alert setCancelButtonIndex:0];
//                    [alert setTag:1];
//                    [alert show];
//                }
//            }
//        }];
//        
//    }
//} // END of showWarningSymptoms


- (void)showAllSymptomsWarning:(NSString*) specificsymptoms{
   
    NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[[ConfigurationManager sharedManager] appID], nil] forKeys:[NSArray arrayWithObjects:@"app_id", nil]];
        [Setting exactMatchWithParams:params offset:0 limit:10 async:^(NSArray *objects, NSError *error) {
            if (!error) {
                if ([objects count] > 0) {
                    UIAlertView *alert = [[UIAlertView alloc]init];
                    alert.title = @"Warning!";
                    alert.message = @"Persistent symptoms despite interventions advised by physician"; //globals.severeSymptomMsg
                    [alert addButtonWithTitle:@"OK"];
                    [alert setCancelButtonIndex:0];
                    [alert setTag:1];
                    [alert show];
                }
            }
        }];
        
    }
//} // END of showWarningSymptoms




@end
