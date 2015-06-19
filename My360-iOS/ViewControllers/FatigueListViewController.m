//
//  FatigueListViewController.m
//  My360-iOS
//
//  Created by Roberto M. Vera on 5/20/15.
// Modified by Savio Vaz 6/16/15
//
//
#import <APSDK/Patient+Remote.h>
#import <APSDK/AuthManager.h>
#import <APSDK/PatientJournal+Remote.h>
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import <APSDK/PatientFatigueAnswer.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import <APSDK/PatientFatigueResult.h>
#import <APSDK/PatientFatigueResult+Remote.h>
#import "FatigueCell.h"
#import <APSDK/User.h>
#import <APSDK/Symptom.h>
#import "AuthManager+Rules.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"

//#import "EditJournalResultPageViewController.h"
//#import "FatigueListViewController.h"
#import "FatigueListViewController.h"
#import "LoadingTableViewCell.h"
//#import "JournalCell.h"
#import "PikConstants.h"




@interface FatigueListViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem * addFatigueButtonBarButtonItem;

- (IBAction)addFatigueButtonTapped;
- (void)reloadFatigueListDataAnimated:(BOOL)animated;

@end

@implementation FatigueListViewController

@synthesize reloadDataOnLoad;


#pragma mark - Actions

- (IBAction)addFatigueButtonTapped
{
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if(self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}

-(void)toolBarAdd{
    [self performSegueWithIdentifier:@"AddFatigueTableViewController" sender:self];
    [self.toolBar hideToolBarInView:self.view animated:NO];
    [self.tableView setEditing:NO animated:YES];
    [self.tutorialView dismissViewAnimated:NO completion:nil];
}
-(void)toolBarDelete{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark - Private

- (void)reloadFatigueListDataAnimated:(BOOL)animated {
    
    if ([AppDelegate hasConnectivity])
    {
        
        [self pushBusyOperation];
        
        if (reloadDataOnLoad){
            [self.tableData removeAllObjects];
            [self.tableView reloadData];
        }
        __block NSArray *history = [self.tableData copy];
        
        NSMutableDictionary *params = [NSMutableDictionary new];
        Patient *me = [Patient new];
        me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
        [params setObject:me.id forKey:@"patient_id"];
        
        
       
        //PatientFatigueResult has the Question and the Answer
        [PatientFatigueResult query:@"exact_match" params:params offset:self.tableData.count limit:kListLength async:^(NSArray * objects, NSError * error) {
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
                    [self.tableData removeAllObjects];
                    [self.tableData addObjectsFromArray:history];
                    [self.tableData addObjectsFromArray:objects];
                    if (objects.count > kListLength - 1) {
                        [self.tableData removeLastObject];
                    } else {
                        self.listDataState = kDataStateFull;
                    }
                    [self.tableView reloadData];
                    //            - ios cleanup svaz 1/12/15
                    //                       [self resize:self.tableView
                    //                                 to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
                    //                                               self.tableData.count * self.tableView.rowHeight +
                    //                                               (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
                    //                           animated:animated];
                    //            - ios cleanup svaz 1/12/15  -end
                    
                    [self popBusyOperation];
                    
                    if(!HAS_DATA){
                        [self.toolBar showToolBarInView:self.view animated:NO];
                        CGRect frame = self.view.bounds;
                        frame.origin.y += self.toolBar.frame.size.height;
                        //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
                        int tutorialX = 0;
                        if (IS_IPAD) {
                            tutorialX =+150;
                        }
                        
                        
                        self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                        [self.view addSubview:self.tutorialView];
                        
                        UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+tutorialX, 200, 300, 40)];
                        newLabel.text = @"Tap to start adding survey";
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
            
           // JournalCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Default"];
            FatigueCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Default"];
            
            PatientFatigueResult * object = [self.tableData objectAtIndex:indexPath.row];
            NSString *dateString = [[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] stringFromDate:object.createdOn];

            cell.dateLabel.text =  dateString;
            cell.contentLabel.text = [NSString stringWithFormat:@"Patient ID: %@", object.physicalSubscale];
            cell.secondaryLabel.text = [NSString stringWithFormat:@"Is Completed: %@",[object.isCompleted stringValue]];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
    }
    
    return nil;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.tableView) {
        if (indexPath.section == 1 && self.listDataState == kDataStateReady) {
            ((LoadingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).state = kLoadingTableViewCellStateBusy;
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            self.listDataState = kDataStateLoading;
            [self reloadFatigueListDataAnimated:YES];
        }
        else {
            
            //[self performSegueWithIdentifier:@"ShowEditJournalPageViewController" sender:[self.tableData objectAtIndex:indexPath.row]];
            [self performSegueWithIdentifier:@"EditFatigueTableViewController" sender:[self.tableData objectAtIndex:indexPath.row]];
        }
    }
}

- (void) showPicker{
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        if ([AppDelegate hasConnectivity])
        {
            //PatientJournal * patienjournal = [self.tableData objectAtIndex:indexPath.row];
            PatientFatigueResult * patientfatigue = [self.tableData objectAtIndex:indexPath.row];
            
            patientfatigue.archived = @1;
            [self pushBusyOperation];
            __unsafe_unretained FatigueListViewController * _self = self;
            
            [patientfatigue updateAsync:^(id obj, NSError * error) {
                if (error) {
                    [_self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [_self showMessage:@"Survey record failed to delete."];
                } else {
                    [_self popBusyOperation];
                    
                    //[_self showMessage:@"Treatment record successfully deleted."];
                    [_self.tableData removeAllObjects];
                    [_self reloadFatigueListDataAnimated:NO];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //AddFatigueTableViewController
    NSLog(@"Sender = %@", sender);
    if ([segue.identifier isEqualToString:@"EditFatigueTableViewController"]) {
        
        
//        FatigueDetailTableViewController *controller = (FatigueDetailTableViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
        
        //controller.editMode = YES;
        FatigueDetailTableViewController2 *controller = [segue destinationViewController];
        controller.patientFatigueResultObject = sender;
        controller.delegate = self;
        
//        ((FatigueDetailTableViewController *)segue.destinationViewController).patientFatigueResultObject = sender;
//        ((FatigueDetailTableViewController *)segue.destinationViewController).editMode = YES;
//        ((FatigueDetailTableViewController *)segue.destinationViewController).delegate = self;
    }
    //else if ([segue.identifier isEqualToString:@"ShowAddTableViewController"]) {
    //  TableViewController *controller = (TableViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
    else if ([segue.identifier isEqualToString:@"AddFatigueTableViewController"]) {
        
        
//        ((FatigueDetailTableViewController *)segue.destinationViewController).patientFatigueResultObject = nil;
//        FatigueDetailTableViewController *controller = [FatigueDetailTableViewController  new];
//        controller.patientFatigueResultObject = nil;
//        FatigueDetailTableViewController *controller = (FatigueDetailTableViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
        
        FatigueDetailTableViewController2 *controller = [segue destinationViewController];
        controller.patientFatigueResultObject = nil;
//        ((controller *)segue.destinationViewController).editMode = YES;
        controller.delegate = self;

//        controller.editMode = NO;
       // controller.delegate = self;
        
        
    }
}

//test - savio

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.reloadDataOnLoad = YES;
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"My Fatigue", @"My Fatigue")];
    
    //[self loadMoodData];
    //[self loadSymptomData];
    //[self loadAbilityData];
    
    //            -  iPad cleanup rvera 4/27/14
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.frame = self.view.bounds;
    //        end     -  iPad cleanup rvera 4/27/14
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addObservers];
    
    if(reloadDataOnLoad)
    {
        //[self refreshAnimated:animated];
        [self reloadFatigueListDataAnimated:animated];
        self.reloadDataOnLoad = NO;
        
    }
}


#pragma mark - Data

-(void)userInteractedWithViewController:(FatigueDetailTableViewController2 *)controller{
    self.reloadDataOnLoad = YES;
}
-(void)back {
    [super back];
}

@end
