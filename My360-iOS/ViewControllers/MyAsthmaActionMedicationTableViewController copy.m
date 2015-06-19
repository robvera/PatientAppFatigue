//
//  AsthmaActionMedicationTableViewController.m
//  My360-iOS
//
//  Created by Savio Vaz on 10/23/14.
//
//

#import "MyAsthmaActionMedicationTableViewController.h"
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
//#import <APSDk/PatientAsthma+Remote.h>
//#import <APSDk/PatientAsthma.h>
#import "AsthmaActionMedicationTableViewCell.h"
#import <APSDk/PatientAsthmaActionMedication+Remote.h>
#import <APSDk/PatientAsthmaActionMedication.h>
#import "EditAsthmaMedicineViewController.h"



@interface MyAsthmaActionMedicationTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UIBarButtonItem * addButtonBarButtonItem;
//@property (nonatomic, strong) NSNumber *myActionPlanID;
- (IBAction)addButtonTapped;
- (void)reloadListDataAnimated:(BOOL)animated;

@end

@implementation MyAsthmaActionMedicationTableViewController
@synthesize reloadDataOnLoad;



#pragma mark - Actions

- (IBAction)addButtonTapped
{
//    self.myActionPlanID =0;
    self.editMode = NO;
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if(self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}

-(void)toolBarAdd{
//    self.myActionPlanID = 0;
    
    self.editMode=NO;
    self.myPatientAsthmaObject = [PatientAsthma new];
    [self performSegueWithIdentifier:@"showEditMedicationSegue" sender:self];
    [self.toolBar hideToolBarInView:self.view animated:NO];
    [self.tableView setEditing:NO animated:YES];
    [self.tutorialView dismissViewAnimated:NO completion:nil];
}
-(void)toolBarDelete{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark - Private

- (void)reloadListDataAnimated:(BOOL)animated {
    NSLog(@"***KEY ID Med List=%@", self.myActionPlanID);
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
        [params setObject:self.myActionPlanID forKey:@"patient_asthma_action_id_seq"];
        [params setObject:patientID forKey:@"patient_id"];
        [params setObject:self.medicationType forKey:@"medication_type"];
        
        
        
        [PatientAsthmaActionMedication query:@"exact_match" params:params offset:self.tableData.count limit:kListLength async:^(NSArray * objects, NSError * error) {
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
//                    NSSortDescriptor *sortDescriptor;
//                    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"posteddate"
//                                                                 ascending:NO
//                                      ];
//                    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
//                    NSArray *sortedArray = [objects sortedArrayUsingDescriptors:sortDescriptors];
                    
                 
                    
                    
                    
                    [self.tableData removeAllObjects];
                    [self.tableData addObjectsFromArray:history];
                    [self.tableData addObjectsFromArray:objects];
                    if (objects.count > kListLength - 1) {
                        [self.tableData removeLastObject];
                    } else {
                        self.listDataState = kDataStateFull;
                    }
                    [self.tableView reloadData];
                    [self resize:self.tableView
                              to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
                                            self.tableData.count * self.tableView.rowHeight +
                                            (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
                        animated:animated];
                    [self popBusyOperation];
                    
                    if(!HAS_DATA){
                        [self.toolBar showToolBarInView:self.view animated:NO];
                        CGRect frame = self.view.bounds;
                        frame.origin.y += self.toolBar.frame.size.height;
                        self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                        [self.view addSubview:self.tutorialView];
                        
                        UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 200, 300, 40)];
                        newLabel.text = @"Tap to start adding action plans";
                        newLabel.backgroundColor = [UIColor clearColor];
                        newLabel.textColor = [UIColor whiteColor];
                        [self.tutorialView addSubview:newLabel];
                        
                        Arrow *newArrow = [[Arrow alloc]init];
                        newArrow.head = CGPointMake(105, 5);
                        newArrow.tail = CGPointMake(105, 200);
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count = %d", self.tableData.count);
    return self.tableData.count;
}

//- (NSInteger)numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"count = %d", self.tableData.count);
//    return self.tableData.count;
//}

- (NSInteger)numberOfSections{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView == self.tableView) {
        static NSString *cellTableIdentifier = @"AsthmaActionMedicationCellIdentifier";
        
//        AsthmaActionMedicationTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
        UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
        
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AsthmaActionMedicationTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        
        PatientAsthmaActionMedication * object = [self.tableData objectAtIndex:indexPath.row];
        
        cell.textLabel.text =object.medication;
        cell.detailTextLabel.text =object.dose;

//        cell.medication.text = object.medication ;
//        cell.dose.text = object.dose;
//        cell.frequency.text = object.frequency ;
        
        
        NSLog(@"indexPath.row = %ld,  row id Objects = %@ medication = %@", (long)indexPath.row,object.id ,object.dose);
        return cell ;
  
    }
    
 
    
    return nil;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PatientAsthmaActionMedication * object = [self.tableData objectAtIndex:indexPath.row];
    self.PatientAsthmaActionMedicationObject =object ;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.tableView) {
        if (indexPath.section == 1 && self.listDataState == kDataStateReady) {
            ((LoadingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).state = kLoadingTableViewCellStateBusy;
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            self.listDataState = kDataStateLoading;
            [self reloadListDataAnimated:YES];
        }
        else {
            
            //            [self performSegueWithIdentifier:@"showPlanSegue" sender:[self.tableData objectAtIndex:indexPath.row]];
//            PatientAsthmaActionMedication    * object = [self.tableData objectAtIndex:indexPath.row];
            
            NSLog(@"Selected cell = %@", object.dose);
            self.currentAsthmaMedicationObject = object;
            self.editMode = YES;
            [self performSegueWithIdentifier:@"showEditMedicationSegue" sender:self];
        }
    }
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showPlanSegue"]) {
        
        
        MyAsthmaActionPlanFormViewController *vc = [segue destinationViewController];
        
        
        //        ((MyAsthmaActionPlanFormViewController *)segue.destinationViewController).myAction = sender;
        
        
//        if ([self.myActionPlanID isEqualToNumber: [NSNumber numberWithInt:0]]) {
//            vc.editMode = NO;
//        }else{
//            vc.editMode = YES;
//        }
        
        vc.editMode = self.editMode;
        vc.myActionPlanID=self.myActionPlanID;
        vc.myPatientAsthmaObject =  self.myPatientAsthmaObject;
        
    }
    else if ([segue.identifier isEqualToString:@"showNewPlanSegue"]) {
        MyAsthmaActionPlanFormViewController *controller = (MyAsthmaActionPlanFormViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
        controller.editMode = NO;
        //        controller.myActionPlanID = self.myActionPlanID ;
        //              controller.delegate = self;
    }
    
    
    
    
   
        else if ([segue.identifier isEqualToString:@"showEditMedicationSegue"]) {
            
            EditAsthmaMedicineViewController *vc = [segue destinationViewController];
            
            if (self.editMode) {
                vc.editMode = YES;
                NSLog(@"** EDIT  Medicine");
                vc.myActionPlanID = self.currentAsthmaMedicationObject.patientAsthmaActionIdSeq
                ;
                vc.currentAsthmaMedicationObject = self.currentAsthmaMedicationObject;
            }else{
                vc.editMode = NO;
                vc.myActionPlanID =self.myActionPlanID;
                vc.medicationType = self.medicationType;
                 NSLog(@"Add new Medicine");
            }
            
            
            
            
            
            
            
            }
        }

#pragma mark - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //get the selected row to pass to next VC
//    //    PatientJournal * object = [self.tableData objectAtIndex:indexPath.row];
//    PatientAsthmaActionMedication    * object = [self.tableData objectAtIndex:indexPath.row];
//    
//    NSLog(@"Selected cell = %@", object.dose);
////    self.myActionPlanID =object.id;
////    self.myPatientAsthmaObject = object;
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
////    if (tableView == self.tableView) {
////        if (indexPath.section == 1 && self.listDataState == kDataStateReady) {
////            ((LoadingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).state = kLoadingTableViewCellStateBusy;
////            [tableView deselectRowAtIndexPath:indexPath animated:YES];
////            
////            self.listDataState = kDataStateLoading;
////            [self reloadListDataAnimated:YES];
////        }
////        else {
////            
////            //            [self performSegueWithIdentifier:@"showPlanSegue" sender:[self.tableData objectAtIndex:indexPath.row]];
////            [self performSegueWithIdentifier:@"showPlanSegue" sender:self];
////        }
////    }
//}




- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        if ([AppDelegate hasConnectivity])
        {
            PatientAsthmaActionMedication * patientAsthma = [self.tableData objectAtIndex:indexPath.row];
            
            
            //            patientAsthma.archived = @1;
            [self pushBusyOperation];
            //            __unsafe_unretained JournalListViewController * _self = self;
            
            [patientAsthma destroyAsync:^(id object, NSError *error) {
                if (error) {
                    [self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [self showMessage:@"Treatment record failed to delete."];
                } else {
                    
                    
                    //[_self showMessage:@"Treatment record successfully deleted."];
                    [self.tableData removeAllObjects];
                    [self reloadListDataAnimated:NO];
                    [self popBusyOperation];
                }

                
            }];
            
            
//            [patientAsthma updateAsync:^(id obj, NSError * error) {
//                if (error) {
//                    [self popBusyOperation];
//                    if(ERROR_CODE_401(error)) {
//                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//                        [app showSessionTerminatedAlert];
//                    }
//                    else [self showMessage:@"Treatment record failed to delete."];
//                } else {
//                    [self popBusyOperation];
//                    
//                    //[_self showMessage:@"Treatment record successfully deleted."];
//                    [self.tableData removeAllObjects];
//                    [self reloadListDataAnimated:NO];
//                }
//            }];
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


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return 159;
//}


#pragma mark - UIViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.reloadDataOnLoad = YES;
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"My Asthma Action Plan", @"My Plan")];

    
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
        //[self refreshAnimated:animated];
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














//*****************
//*********** D O  N O T   D E L E T E
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
 
 
 insert into    "patient_asthma_action_medication"
 ("dose",
 "frequency",
 "medication",
 "medication_type",
 "patient_asthma_action_id_seq",
 "posted_date")
 
 values(
 '3 puffs'
 ,'PE 3'
 ,'3 times as needed'
 ,'PE'
 ,15
 ,'2014-10-10'
 
 )

 */

