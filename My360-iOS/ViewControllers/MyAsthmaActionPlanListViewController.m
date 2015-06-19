//
//  MyAsthmaActionPlanListViewController.m
//  My360-iOS
//
//  Created by Savio Vaz on 10/9/14.
//
//

#import "MyAsthmaActionPlanListViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import <APSDK/Symptom.h>
#import "AuthManager+Rules.h"
#import "MyAsthmaActionPlanFormViewController.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "ConfigurationManager.h"
#import "JournalCell.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"
#import <APSDk/PatientAsthma+Remote.h>
#import <APSDk/PatientAsthma.h>

@interface MyAsthmaActionPlanListViewController ()
@property (nonatomic, weak) IBOutlet UIBarButtonItem * addButtonBarButtonItem;
@property (nonatomic, strong) NSNumber *myActionPlanID;
- (IBAction)addButtonTapped;
- (void)reloadListDataAnimated:(BOOL)animated;

@end

@implementation MyAsthmaActionPlanListViewController
@synthesize reloadDataOnLoad;



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}




#pragma mark - Actions

- (IBAction)addButtonTapped
{
    self.myActionPlanID =0;
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if(self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}

-(void)toolBarAdd{
    self.myActionPlanID = 0;
    self.myPatientAsthmaObject = [PatientAsthma new];
    [self performSegueWithIdentifier:@"showPlanSegue" sender:self];
    [self.toolBar hideToolBarInView:self.view animated:NO];
    [self.tableView setEditing:NO animated:YES];
    [self.tutorialView dismissViewAnimated:NO completion:nil];
}
-(void)toolBarDelete{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark - Private

- (void)reloadListDataAnimated:(BOOL)animated {
    
    if ([AppDelegate hasConnectivity])
    {
        
        [self pushBusyOperation];
        
        if (reloadDataOnLoad){
            [self.tableData removeAllObjects];
            [self.tableView reloadData];
        }
        __block NSArray *history = [self.tableData copy];
        
        NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
        
        [params setObject:[[ConfigurationManager sharedManager] appID] forKey:@"app_id"];
        NSNumber *patientID = ((User *)[AuthManager defaultManager].currentCredentials).id;
        [params setObject:patientID forKey:@"patient_id"];
        
        [PatientAsthma query:@"exact_match" params:params offset:self.tableData.count limit:2000 async:^(NSArray * objects, NSError * error) {
            if (self.navigationController.topViewController == self) {
                self.listDataState = kDataStateReady;
                if (error) {
                    [self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [self showMessage:[error localizedDescription] ? : @"Error"];
                } else {
                    
                    
                    
                    
                    // Added to sort by Name insensetively - svaz
                    NSSortDescriptor *sortDescriptor;
                    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"asthmaActionDate"
                                                                 ascending:NO
                                      ];
                    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
                    NSArray *sortedArray = [objects sortedArrayUsingDescriptors:sortDescriptors];
                    
                    [self.tableData removeAllObjects];
                    [self.tableData addObjectsFromArray:history];
                    [self.tableData addObjectsFromArray:sortedArray];
                    if (objects.count > kListLength - 1) {
                        [self.tableData removeLastObject];
                    } else {
                        self.listDataState = kDataStateFull;
                    }
                    [self.tableView reloadData];
//                    [self resize:self.tableView
//                              to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
//                                            self.tableData.count * self.tableView.rowHeight +
//                                            (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
//                        animated:animated];
                    [self popBusyOperation];
                    
                    if(!HAS_DATA){
                        [self.toolBar showToolBarInView:self.view animated:NO];
                        //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
                        int tutorialX = 0;
                        if (IS_IPAD) {
                            tutorialX =+150;
                        }
                        
                            CGRect frame = self.view.bounds;
                            frame.origin.y += self.toolBar.frame.size.height;
                       
                            self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                            [self.view addSubview:self.tutorialView];
                            
                            UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+tutorialX, 200, 300, 40)];
                            newLabel.text = @"Tap to start adding action plans";
                            newLabel.backgroundColor = [UIColor clearColor];
                            newLabel.textColor = [UIColor whiteColor];
                            [self.tutorialView addSubview:newLabel];
                            
                            Arrow *newArrow = [[Arrow alloc]init];
                            newArrow.head = CGPointMake(105+tutorialX, 5);
                            newArrow.tail = CGPointMake(105+tutorialX, 200);
                            [self.tutorialView addArrow:newArrow];
                        
                    }
                    
                }
            } else [self popBusyOperation];
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    
    
//    NSLog(@"count = %lu", (unsigned long)self.tableData.count);
    
    return self.tableData.count;
}

- (NSInteger)numberOfSections{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"count = %lu", (unsigned long)self.tableData.count);
    
    if (tableView == self.tableView) {
        if (indexPath.section == 1) {
            LoadingTableViewCell * cell = (LoadingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Loading"];

            if (self.listDataState == kDataStateLoading) {
                cell.state = kLoadingTableViewCellStateBusy;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.state = kLoadingTableViewCellStateReady;
                cell.selectionStyle = UITableViewCellSelectionStyleGray;
            }

            return cell;

        }
        else {
        
        UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        
        
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:@"cell"];
        }
        PatientAsthma * object = [self.tableData objectAtIndex:indexPath.row];
        NSString *dateString = [[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] stringFromDate:object.asthmaActionDate];
        
        cell.textLabel.text =  dateString;
        cell.detailTextLabel.text = @"";// [object.id stringValue];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    PatientAsthma * object = [self.tableData objectAtIndex:indexPath.row];
    // set   AsthmaSeverity
    NSInteger asthmaSeverity = [object.asthmaSeverity integerValue];
    NSString *asthmaSeverityValue;
    switch (asthmaSeverity) {
        case 0:
            asthmaSeverityValue = @"Mild Intermediate";
            cell.detailTextLabel.backgroundColor = [UIColor whiteColor];
            break;
        case 1:
            asthmaSeverityValue = @"Mild Persistent";
            cell.detailTextLabel.backgroundColor = [UIColor yellowColor];
            break;
            
        case 2:
            asthmaSeverityValue = @"Moderate Persistent";
            cell.detailTextLabel.backgroundColor = [UIColor orangeColor];
            break;
            
        case 3:
            asthmaSeverityValue = @"Severe Persistent";
            cell.detailTextLabel.backgroundColor = [UIColor redColor];
            break;
            
        default:
            asthmaSeverityValue = @"Mild Intermediate";
            break;
    }
    
    
    
    
//    cell.detailTextLabel.text =asthmaSeverityValue ;
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showPlanSegue"]) {
        
        MyAsthmaActionPlanFormViewController *vc = [segue destinationViewController];
        if ([self.myActionPlanID isEqualToNumber: [NSNumber numberWithInt:0]]  || self.myActionPlanID == nil) {
            vc.editMode = NO;
        }else{
            vc.editMode = YES;
        }
        
        
        vc.myActionPlanID=self.myActionPlanID;
        vc.myPatientAsthmaObject =  self.myPatientAsthmaObject;
        
    }
    else if ([segue.identifier isEqualToString:@"showNewPlanSegue"]) {
        MyAsthmaActionPlanFormViewController *controller = (MyAsthmaActionPlanFormViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
        controller.editMode = NO;
        
    }
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //get the selected row to pass to next VC
    //    PatientJournal * object = [self.tableData objectAtIndex:indexPath.row];
    PatientAsthma    * object = [self.tableData objectAtIndex:indexPath.row];
    self.myActionPlanID =object.id;
    self.myPatientAsthmaObject = object;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.tableView) {
        if (indexPath.section == 1 && self.listDataState == kDataStateReady) {
            ((LoadingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).state = kLoadingTableViewCellStateBusy;
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            self.listDataState = kDataStateLoading;
            [self reloadListDataAnimated:YES];
        }
        else {
    
            NSLog(@"***KEY ID= main list%@", self.myActionPlanID);
            [self performSegueWithIdentifier:@"showPlanSegue" sender:self];
        }
    }
}






- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        if ([AppDelegate hasConnectivity])
        {
            //#warning CHANGE TO ACTION PLAN OBJECT
            PatientAsthma * patientAsthmaObject = [self.tableData objectAtIndex:indexPath.row];
            
            
            //            patientAsthma.archived = @1;
            [self pushBusyOperation];
            //            __unsafe_unretained JournalListViewController * _self = self;
//            __unsafe_unretained MyAsthmaActionPlanListViewController * _self = self;
            
            [patientAsthmaObject destroyAsync:^(id object, NSError *error) {
                
                if (error) {
                    [self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [self showMessage:@"Treatment record failed to delete."];
                } else {
                    [self popBusyOperation];
                    
                    //[_self showMessage:@"Treatment record successfully deleted."];
                    [self.tableData removeAllObjects];
                    [self reloadListDataAnimated:NO];
                }
            }];
            
        }
        else
        {
            [AppDelegate showNoConnecttivityAlert];
        }
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
}


#pragma mark - UIViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.reloadDataOnLoad = YES;
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"My Action Plan", @"My Plan")];
    
}

- (void) viewDidAppear:(BOOL)animated{
    reloadDataOnLoad =YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addObservers];
    
    if(reloadDataOnLoad)
    {
        [self reloadListDataAnimated:animated];
        self.reloadDataOnLoad = NO;
    }
}


#pragma mark - Data

-(void)userInteractedWithViewController:(MyAsthmaActionPlanFormViewController *)controller{
    self.reloadDataOnLoad = YES;
}
-(void)back {
    [super back];
}

@end





/*
 
 baseURL=$(/usr/libexec/PlistBuddy -c "Print baseURL" ${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Configuration.plist)
 serverVersion=$(/usr/libexec/PlistBuddy -c "Print serverVersion" ${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Configuration.plist)
 appID=$(/usr/libexec/PlistBuddy -c "Print appID" ${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Configuration.plist)
 
 url="$baseURL$serverVersion"
 
 
 content=$(curl -L "$url/abilities?scope=active_abilities&query[app_id]=$appID" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/abilities.dat"
 
 content=$(curl -L "$url/dosage_uoms?query[app_id]=$appID&scope=active_dosage_uom" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/dosageuoms.dat"
 
 content=$(curl -L "$url/ingestion_methods?query[app_id]=$appID&scope=active_ingestion_methods" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/ingestionmethods.dat"
 
 content=$(curl -L "$url/lab_result_stats?query[app_id]=$appID&scope=active_lab_result_statuses" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/labresultstatuses.dat"
 
 content=$(curl -L "$url/medications?query[app_id]=$appID&scope=active_medications" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/medications.dat"
 
 content=$(curl -L "$url/missing_treatment_reasons?query[app_id]=$appID&scope=active_missing_treatments" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/missingtreatmentreasons.dat"
 
 content=$(curl -L "$url/moods?query[app_id]=$appID&scope=active_moods" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/moods.dat"
 
 content=$(curl -L "$url/side_effects?query[app_id]=$appID&scope=active_side_effects" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/sideeffects.dat"
 
 content=$(curl -L "$url/symptoms?query[app_id]=$appID&scope=active_symptoms" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/symptoms.dat"
 
 content=$(curl -L "$url/test_types?query[app_id]=$appID&scope=active_test_types" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/testtypes.dat"
 
 content=$(curl -L "$url/treatment_schedules?query[app_id]=$appID&scope=active_treatment_schedules" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/treatmentschedules.dat"
 
 content=$(curl -L "$url/treatment_types?query[app_id]=$appID&scope=active_treatment_types" --globoff)
 echo $content > "${PROJECT_DIR}/My360-iOS/_AsthmaPatient/Data/treatmenttypes.dat"
 */





// CREATE TABLE

/*
 
 create SEQUENCE patient_asthma_action_id_seq START 1;
 
 CREATE TABLE patient_asthma_action (
 id integer NOT NULL default nextval('patient_asthma_action_id_seq'::regclass),
 app_id INTEGER NOT NULL,
 patient_id INTEGER NOT NULL,
 posted_date DATE,
 
 asthma_action_date DATE not NULL,
 asthma_severity BOOLEAN  NOT NULL,
 
 
 long_term_medication TEXT ,
 long_term_dose  TEXT,
 long_term_frequency TEXT,
 
 quick_medication TEXT ,
 quick_dose  TEXT,
 quick_frequency TEXT,
 
 pe_medication TEXT ,
 pe_dose  TEXT,
 pe_frequency TEXT,
 peak_flow_personal_best integer,
 
 instructions_feel_good_dose text,
 instructions_feel_good_medication text,
 instructions_feel_good_trigger text,
 
 instructions_not_feel_good_symptom text,
 instructions_not_feel_good_medication text,
 
 instructions_awful_medication1 text,
 instructions_awful_medication2 text,
 instructions_awful_call text,
 
 trigger_tobacco BOOLEAN,
 trigger_pesticide  BOOLEAN,
 trigger_animals  BOOLEAN,
 trigger_birds  BOOLEAN,
 trigger_dust  BOOLEAN,
 trigger_cleansers  BOOLEAN,
 trigger_car_exhaust  BOOLEAN,
 trigger_perfume  BOOLEAN,
 trigger_mold  BOOLEAN,
 trigger_cockroach  BOOLEAN,
 trigger_coldair  BOOLEAN,
 trigger_excercise  BOOLEAN,
 trigger_other  text
 
 
 );
 */

// Second table
/*
 CREATE SEQUENCE patient_asthma_action_medication_id_seq start 1;
 
 create table patient_asthma_action_medication
 (id integer not null default nextval('patient_asthma_action_medication_id_seq'::regclass),
 patient_asthma_action_id_seq integer not null ,
 medication TEXT,
 dose TEXT ,
 frequency TEXT,
 medication_type CHAR(10),
 posted_date DATE )
 
 */
