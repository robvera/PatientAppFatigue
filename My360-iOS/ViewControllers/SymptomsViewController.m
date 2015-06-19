//
//  SymptomsViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 2/28/13.
//
//

#import "SymptomsViewController.h"
#import <APSDK/Symptom.h>
#import "UIColor+APColorExtension.h"
#import "SelectionListCell.h"
#import <QuartzCore/QuartzCore.h>
#import "ConfigurationManager.h"   //svaz added for alert
#import <APSDK/Setting+Remote.h> //svaz added for alert
#import "ConfigurationManager.h"
#import "PikConstants.h"

#define ROW_TYPE_SECTION @"SECTION"
#define ROW_TYPE_CONTENT @"CONTENT"

@interface SymptomsViewController ()

@end

@implementation SymptomsViewController

@synthesize tableData;
@synthesize sectionedTableData;
@synthesize expandedSections;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionedTableData = [[NSMutableDictionary alloc] init];
    self.expandedSections = [[NSMutableDictionary alloc]init];
    
    BOOL found;
    
    for (Symptom *symptom in self.tableData) {
        //NSString *category = symptom.category;    //RV New lable on API for SymtomsCat comented 6/8/15
        NSString *category = symptom.symptomCat;
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
        
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];  //was sortId
        [[self.sectionedTableData objectForKey:key] sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        [self.expandedSections setObject:[NSNumber numberWithBool:FALSE] forKey:key];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int count = 0;
    for (NSString *key in [self.expandedSections allKeys]) {
        if ([[self.expandedSections objectForKey:key] isEqualToNumber:[NSNumber numberWithBool:FALSE]]) {
            count++;
        }
        else {
            count += [(NSMutableArray *)[self.sectionedTableData objectForKey:key] count] + 1;
        }
    }
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSMutableArray *expandedRows = [[NSMutableArray alloc]init];
    NSMutableArray *rowTypes = [[NSMutableArray alloc]init];
    
    for (NSString *key in [[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]){
        if ([[self.expandedSections objectForKey:key] isEqualToNumber:[NSNumber numberWithBool:FALSE]]) {
            [expandedRows addObject:key];
            [rowTypes addObject:ROW_TYPE_SECTION];
        }
        else{
            [expandedRows addObject:key];
            [rowTypes addObject:ROW_TYPE_SECTION];
            for (Symptom *obj in (NSMutableArray*)[self.sectionedTableData objectForKey:key]) {
                [expandedRows addObject:obj];
                [rowTypes addObject:ROW_TYPE_CONTENT];
            }
        }
    }
    tableView.backgroundColor = [UIColor colorWithRed:28/255.0f green:96/255.0f blue:168/255.0f alpha:1.0f];
    tableView.separatorColor = [UIColor blackColor];
    cell.contentLabel.backgroundColor = [UIColor clearColor];
    cell.accessoryView.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    [cell.backgroundView removeFromSuperview];
    [cell.accessoryView removeFromSuperview];
    if ([[rowTypes objectAtIndex:indexPath.row] isEqualToString:ROW_TYPE_SECTION]) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentLabel.textColor = [UIColor whiteColor];
        cell.contentView.backgroundColor = [UIColor colorWithRed:28/255.0f green:96/255.0f blue:168/255.0f alpha:1.0f];
        cell.contentLabel.text = (NSString *)[expandedRows objectAtIndex:indexPath.row];
        UIImageView *accView;
        if([[self.expandedSections objectForKey:(NSString *)[expandedRows objectAtIndex:indexPath.row]] isEqualToNumber:[NSNumber numberWithBool:FALSE]]){
            accView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"plus.png"]];
        }
        else {
            accView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minus.png"]];
        }
        
        
        cell.accessoryView = accView;
        
    }
    else{
        cell.contentLabel.textColor = [UIColor blackColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.accessoryView = nil;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.contentLabel.text = ((Symptom *)[expandedRows objectAtIndex:indexPath.row]).name;
        UIView* myBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        myBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@""] stretchableImageWithLeftCapWidth:24 topCapHeight:15]]; //@"bg_dropdown.png"
        [cell setBackgroundView:myBackgroundView];
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *expandedRows = [[NSMutableArray alloc]init];
    NSMutableArray *rowTypes = [[NSMutableArray alloc]init];
    for (NSString *key in [[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]){
        if ([[self.expandedSections objectForKey:key] isEqualToNumber:[NSNumber numberWithBool:FALSE]]) {
            [expandedRows addObject:key];
            [rowTypes addObject:ROW_TYPE_SECTION];
        }
        else{
            [expandedRows addObject:key];
            [rowTypes addObject:ROW_TYPE_SECTION];
            for (Symptom *obj in (NSMutableArray*)[self.sectionedTableData objectForKey:key]) {
                [expandedRows addObject:obj];
                [rowTypes addObject:ROW_TYPE_CONTENT];
            }
        }
    }
    if ([[rowTypes objectAtIndex:indexPath.row]isEqualToString:ROW_TYPE_SECTION]) {
        BOOL expand = [[self.expandedSections objectForKey:[expandedRows objectAtIndex:indexPath.row]] isEqualToNumber:[NSNumber numberWithBool:TRUE]] ? TRUE : FALSE;
        [self.expandedSections setObject:[NSNumber numberWithBool:!expand]forKey:[expandedRows objectAtIndex:indexPath.row]];

        [UIView transitionWithView: self.tableView
                          duration: 0.35f
                           options: UIViewAnimationOptionAllowAnimatedContent
                        animations: ^(void)
         {
             [self.tableView reloadData];
         }
                        completion: ^(BOOL isFinished)
         {
         }];
    }
    else {
        
        Symptom *symptom = (Symptom *)[expandedRows objectAtIndex:indexPath.row];
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: symptom, @"symptom", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedSymptom" object:nil userInfo:userInfo];
        NSLog(@"Selectd symptom *********** = %@", symptom.name);
        // begin add svaz
        //        We'd like to show it again for the following symptoms:
        //        fever, bleeding, trouble breathing, or shortness of breath
        
//        if ([[[ConfigurationManager sharedManager] appID] integerValue] == IPF)
//        {
//            [self showSpecificSymptoms:[symptom.name uppercaseString]];
//        // endadd svaz
//        }
    }
    
    
}

-(BOOL)isRowExpanded:(int)row{
    return true;
}


// Added to show alert for global 911 call - svaz
- (void)showWarning:(NSString*) currentSymptom{
    
    //Symptoms
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alert"
                                                         ofType:@"dat"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if ([jsonString rangeOfString:currentSymptom].location != NSNotFound){
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

// Added to show alert for specific symptoms - Rvera 12-08-14
- (void)showSpecificSymptoms:(NSString*) currentSymptom{
    
    //Symptoms
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"alert"
                                                         ofType:@"dat"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if ([jsonString rangeOfString:currentSymptom].location != NSNotFound){
        NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[[ConfigurationManager sharedManager] appID], nil] forKeys:[NSArray arrayWithObjects:@"app_id", nil]];
        [Setting exactMatchWithParams:params offset:0 limit:10 async:^(NSArray *objects, NSError *error) {
           // Setting *globals;
            if (!error) {
                if ([objects count] > 0) {
                  //  globals = [objects objectAtIndex:0]; // there should only be one
                    UIAlertView *alert = [[UIAlertView alloc]init];
                    alert.title = @"Warning!";
                    alert.message = @"Please call your physician if these symptoms are occurring, which is an indication of an exacerbation.";
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
