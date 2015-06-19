//
//  AdherenceListViewController.m
//  MSPatient
//
//  Created by David Benko on 5/21/13.
//
//

#import "AdherenceListViewController.h"
#import <APSDK/PatientAdherenceLog+Remote.h>
#import <APSDK/APObject+Remote.h>
#import "LoadingTableViewCell.h"
#import "DatedContentCell.h"
#import <APSDK/PatientTreatment+Remote.h>
#import <APSDK/TreatmentType+Remote.h>
#import <APSDK/Medication+Remote.h>
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "APFilterPopup.h"
#import "EditAdherencePageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FilterViewController.h"
#import <APSDK/APObject+RemoteRelationships.h>
#import "UITextField+APTextFieldExtensions.h"
#import "APFilterPopup.h"
#import "PikConstants.h"
#import "AdherenceCell.h"


@interface AdherenceListViewController ()
- (void)reloadAlertListDataAnimated:(BOOL)animated;
@end

@implementation AdherenceListViewController
@synthesize adherence;
@synthesize fvc;
@synthesize treatmentNames;
@synthesize popup;

- (void)reloadAlertListDataAnimated:(BOOL)animated {
    if ([AppDelegate hasConnectivity])
    {
        [self pushBusyOperation];
        [self loadMissingTreatmentReasonData];
        __block NSArray * history = [self.tableData copy];
        [PatientAdherenceLog query:@"my_adherence_logs" params:nil offset:self.tableData.count limit:kListLength async:^(NSArray * objects, NSError * error) {
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
//                        [self resize:self.tableView
//                                  to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
//                                                self.tableData.count * self.tableView.rowHeight +
//                                                (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
//                            animated:animated];
//            - ios cleanup svaz 1/12/15  -end
                [self popBusyOperation];
                        
                        
                        if((!HAS_DATA) && (!isFiltered)){
                            [self.toolBar showToolBarInView:self.view animated:NO];
                            //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
//
                            int tutorialX1 = 0;
                            int tutorialX2=0;
                            if (IS_IPAD) {
                                tutorialX1 =+110;
                                tutorialX2 =+330;
                            }
                                CGRect frame = self.view.bounds;
                                frame.origin.y += self.toolBar.frame.size.height;
                                if(self.tutorialView == nil){
                                    self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                                    [self.view addSubview:self.tutorialView];
                                    
                                    UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(-50+tutorialX1, 100, 300, 40+tutorialX1)];
                                    newLabel.text = @"Tap to start adding\nadherence logs";
                                    newLabel.backgroundColor = [UIColor clearColor];
                                    newLabel.numberOfLines = 2;
                                    newLabel.textAlignment = NSTextAlignmentCenter;
                                    newLabel.textColor = [UIColor whiteColor];
                                    [self.tutorialView addSubview:newLabel];
                                    
                                    UILabel *filterLabel = [[UILabel alloc]initWithFrame:CGRectMake(-50+tutorialX2, 230, 300, 40+tutorialX1)];
                                    filterLabel.text = @"Tap to start\nfiltering results";
                                    filterLabel.backgroundColor = [UIColor clearColor];
                                    filterLabel.numberOfLines = 2;
                                    filterLabel.textAlignment = NSTextAlignmentCenter;
                                    filterLabel.textColor = [UIColor whiteColor];
                                    [self.tutorialView addSubview:filterLabel];
                                    
                                    Arrow *newArrow = [[Arrow alloc]init];
                                    newArrow.head = CGPointMake(80+tutorialX1, 5);
                                    newArrow.tail = CGPointMake(80+tutorialX1, 100);
                                    [self.tutorialView addArrow:newArrow];
                                    
                                    Arrow *filterArrow = [[Arrow alloc]init];
                                    filterArrow.head = CGPointMake(245+tutorialX2, 5);
                                    filterArrow.tail = CGPointMake(160+tutorialX2, 250);
                                    [self.tutorialView addArrow:filterArrow];
                                }
                            
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

- (void)reloadFilteredAlertListData{
    if ([AppDelegate hasConnectivity])
    {
        [self pushBusyOperation];
        NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
        
        
        if (self.popup.takenFilter.selectedSegmentIndex != ALL_ADHERENCE_TAKEN_STATUS) {
            [params setObject:(self.popup.takenFilter.selectedSegmentIndex == TAKEN_ADHERENCE_TAKEN_STATUS) ? @"true" : @"false" forKey:@"took_medication"];
        }
        
        if(self.popup.startDate.text.length != 0){
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:kDateFormat];
            
            NSDate *startDate = [formatter dateFromString:self.popup.startDate.text];
            
            [formatter setDateFormat:@"yyyy-MM-dd"];
            
            [params setObject:[formatter stringFromDate:startDate] forKey:@"start_date"];
        }
        
        if(self.popup.endDate.text.length != 0 ){
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:kDateFormat];
            
            NSDate *endDate = [formatter dateFromString:self.popup.endDate.text];
            
            [formatter setDateFormat:@"yyyy-MM-dd"];
            [params setObject:[formatter stringFromDate:endDate] forKey:@"end_date"];
        }
        //TODO: get ID's
        __block NSString *treatments = @"";
        for(NSString *key in fvc.checksNonMedication.allKeys)
            if([((NSNumber*)[fvc.checksNonMedication objectForKey:key]) boolValue]){
                NSMutableDictionary *attrs = [[NSMutableDictionary alloc]init];
                [attrs setObject:key forKey:@"name"];
                NSString *historyString = [treatments copy];
                __block bool ready = false;
                NSArray *cache1 = [TreatmentType query:@"exact_match" params:attrs async:^(NSArray *objects, NSError *error) {
                    if (error == nil) {
                        if(objects.count > 0){
                            treatments = [historyString stringByAppendingFormat:@"%d,",[((TreatmentType *)[objects objectAtIndex:0]).id intValue]];
                            ready = true;
                        }
                    }
                }];
                if(cache1.count > 0){
                    treatments = [treatments stringByAppendingFormat:@"%d,",[((TreatmentType *)[cache1 objectAtIndex:0]).id intValue]];
                    ready = true;
                }
                NSRunLoop *theRL = [NSRunLoop currentRunLoop];
                while ((!(ready)) && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
            }
        
        __block NSString *medications = @"";
        for(NSString *key in fvc.checksMedication.allKeys)
            if([((NSNumber*)[fvc.checksMedication objectForKey:key]) boolValue]){
                NSMutableDictionary *attrs = [[NSMutableDictionary alloc]init];
                [attrs setObject:key forKey:@"name"];
                NSString *historyString = [medications copy];
                __block bool ready = false;
                NSArray *cache1 = [Medication query:@"exact_match" params:attrs async:^(NSArray *objects, NSError *error) {
                    if (error == nil) {
                        if(objects.count > 0){
                            medications = [historyString stringByAppendingFormat:@"%d,",[((TreatmentType *)[objects objectAtIndex:0]).id intValue]];
                            ready = true;
                        }
                    }
                }];
                if(cache1.count > 0){
                    medications = [medications stringByAppendingFormat:@"%d,",[((TreatmentType *)[cache1 objectAtIndex:0]).id intValue]];
                    ready = true;
                }
                NSRunLoop *theRL = [NSRunLoop currentRunLoop];
                while ((!(ready)) && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
            }

        if(medications.length > 0){
            medications = [medications substringToIndex:[medications length]-1];
            [params setObject:medications forKey:@"medication_ids"];
            NSMutableDictionary *attrs = [[NSMutableDictionary alloc]init];
            [attrs setObject:@"Medication" forKey:@"name"];
            NSString *historyString = [treatments copy];
            __block bool ready = false;
            NSArray *cache1 = [TreatmentType query:@"exact_match" params:attrs async:^(NSArray *objects, NSError *error) {
                if (error == nil) {
                    if(objects.count > 0){
                        treatments = [historyString stringByAppendingFormat:@"%d,",[((TreatmentType *)[objects objectAtIndex:0]).id intValue]];
                        ready = true;
                    }
                }
            }];
            if(cache1.count > 0){
                treatments = [treatments stringByAppendingFormat:@"%d,",[((TreatmentType *)[cache1 objectAtIndex:0]).id intValue]];
                ready = true;
            }
            NSRunLoop *theRL = [NSRunLoop currentRunLoop];
            while ((!(ready)) && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
        }
        if(treatments.length > 0){
            treatments = [treatments substringToIndex:[treatments length]-1];
            [params setObject:treatments forKey:@"treatment_type_ids"];
        }
        [self loadMissingTreatmentReasonData];
        __block NSArray * history = [self.tableData copy];
        NSArray *cache = [PatientAdherenceLog query:@"filter_scope" params:params offset:self.tableData.count limit:kListLength async:^(NSArray * objects, NSError * error) {
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
                dispatch_queue_t queue = dispatch_queue_create("com.mspatient.loadadherencelistfiltered",NULL);
                dispatch_queue_t main = dispatch_get_main_queue();
                dispatch_async(queue,^{
                    [self.tableData removeAllObjects];
                    [self.tableData addObjectsFromArray:history];
                    [self.tableData addObjectsFromArray:objects];
                    if (objects.count > kListLength - 1) {
                        [self.tableData removeLastObject];
                    } else {
                        self.listDataState = kDataStateFull;
                    }
                    dispatch_async(main,^{
                        [self.tableView reloadData];
//   *****         -  iOs 8 cleanup svaz 1/16/2015   -
//                        [self resize:self.tableView
//                                  to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
//                                                self.tableData.count * self.tableView.rowHeight +
//                                                (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
//                            animated:YES];
//   *****         -  iOs 8 cleanup svaz 1/16/2015   -end
                        
                        [self popBusyOperation];
                    });
                });
            }
            }
        }];
        if(cache.count > 0){
            [self.tableData addObjectsFromArray:cache];
            if (cache.count > kListLength - 1) {
                [self.tableData removeLastObject];
            } else {
                self.listDataState = kDataStateFull;
            }
            
            [self.tableView reloadData];
//   *****         -  iOs 8 cleanup svaz 1/16/2015
//            [self resize:self.tableView
//                      to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
//                                    self.tableData.count * self.tableView.rowHeight +
//                                    (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
//                animated:YES];
//   *****         -  iOs 8 cleanup svaz 1/16/2015   -end
            
            [self popBusyOperation];
        }
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    } else{
        return self.tableData.count;
    }
    
}

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
            //[self.tableView reloadData];
        }
        else {
            AdherenceCell *cell = [[AdherenceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Default"];//(AdherenceCell *) [tableView dequeueReusableCellWithIdentifier:@"Default"];
            PatientAdherenceLog * object = nil;
            if(self.tableData.count !=0 && self.tableData.count -1 >= indexPath.row){
                object = (PatientAdherenceLog *)[self.tableData objectAtIndex:indexPath.row];
            }
            NSString *dateString = [[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] stringFromDate:object.logOn];
            cell.dateLabel.text = dateString;
            //cell.dateLabel.textColor = [UIColor orangeColor];
            cell.dateLabel.backgroundColor = [UIColor clearColor];
            //self.tableView.contentInset = UIEdgeInsetsMake(0, 20, 0, 0);
            //self.tableView.contentInset = UIEdgeInsetsMake(self.tableView.contentInset.top, 5, self.tableView.contentInset.bottom, self.tableView.contentInset.right);
            //self.tableView.separatorInset = UIEdgeInsetsMake(0, 16, 0, 0);
            
            if ([object.treatmentTypeDenormalized isEqualToString:@"Medication"]) {
                //cell.contentLabel.text = ((PatientTreatment *)[self.treatmentNames objectForKey:object.patientTreatmentId]).medication.name;
                cell.contentLabel.text = object.medicationDenormalized;
                //cell.contentLabel.textColor = [UIColor blueColor];
            }
            else {
                cell.contentLabel.text = object.treatmentTypeDenormalized;
                //cell.contentLabel.textColor = [UIColor blueColor];
            }
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[object.tookMedication boolValue] ? @"ThumbsUp.png" : @"ThumbsDown.png"]];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
            //cell.backgroundColor = [UIColor orangeColor];
            
            
            NSLog(@"%@, %@", dateString, object.medicationDenormalized);
            return cell;
            }
    }
   //[self.tableView reloadData];
    return nil;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        if (indexPath.section == 1 && self.listDataState == kDataStateReady) {
            ((LoadingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).state = kLoadingTableViewCellStateBusy;
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            self.listDataState = kDataStateLoading;
            [self reloadAlertListDataAnimated:YES];
        }
        else {
            self.adherence = (PatientAdherenceLog *)[self.tableData objectAtIndex:indexPath.row];
            [self performSegueWithIdentifier:@"editAdherence" sender:[self.treatmentNames objectForKey:((PatientAdherenceLog *)[self.tableData objectAtIndex:indexPath.row]).patientTreatmentId]];
        }
    }
    else if(tableView.tag == 443){
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{    
    if([segue.identifier isEqualToString:@"editAdherence"]){
        ((EditAdherencePageViewController *)segue.destinationViewController).patientAdherenceLog = self.adherence;
        ((EditAdherencePageViewController *)segue.destinationViewController).patientTreatment = (PatientTreatment *)sender;
        ((EditAdherencePageViewController *)segue.destinationViewController).editMode = YES;
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag == 443) return UITableViewCellEditingStyleNone;
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        if ([AppDelegate hasConnectivity])
        {
            PatientAdherenceLog * patientalert = [self.tableData objectAtIndex:indexPath.row];
            
            patientalert.archived = @1;
            [self pushBusyOperation];
            __unsafe_unretained AdherenceListViewController * _self = self;
            
            [patientalert updateAsync:^(id obj, NSError * error) {
                if (error) {
                    [_self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [_self showMessage:@"Treatment record failed to delete."];
                } else {
                    [_self popBusyOperation];
                    //[_self showMessage:@"Treatment record successfully deleted."];
                    [_self.tableData removeAllObjects];
                        if(isFiltered)
                            [self reloadFilteredAlertListData];
                        else
                            [self reloadAlertListDataAnimated:NO];
                }
            }];
        }
        else
        {
            [AppDelegate showNoConnecttivityAlert];
        }
    }
}

#pragma mark - UIViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    isFiltered = NO;
    self.toolBar = [[APToolBar alloc]initWithView:self.view];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(toolBarAdd)];
    UIBarButtonItem *delbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toolBarDelete)];
    UIBarButtonItem *filter = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: ASSET_BY_IOS_VERSION(@"icon_filter_filled")] style:UIBarButtonItemStylePlain target:self action:@selector(showFilterView:)];
    self.toolBar.items = [NSArray arrayWithObjects:flexible,addbutton,flexible, delbutton,flexible,filter,flexible, nil];
    [self.view addSubview:self.toolBar];

    
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"My Logs", @"My Logs")];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(openToolbar)];
    self.treatmentNames = [[NSMutableDictionary alloc]init];
    
    [self addObservers];
    fvc = [[FilterViewController alloc]init];
    //[self refreshAnimated:YES];
    
    //            -  iPad cleanup rvera 4/27/15
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.frame = self.view.bounds;
    //        end     -  iPad cleanup rvera 4/27/15
    
}

-(void)openToolbar{
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if(self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}

-(void)toolBarDelete{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

-(void)toolBarAdd{
    [self performSegueWithIdentifier:@"ShowTreatmentPickList" sender:self];
    [self.toolBar hideToolBarInView:self.view animated:NO];
    [self.tableView setEditing:NO animated:YES];
    [self.tutorialView dismissViewAnimated:NO completion:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableData removeAllObjects];
    if(isFiltered)[self reloadFilteredAlertListData];
    else [self reloadAlertListDataAnimated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.tableData removeAllObjects];
}
-(void)showFilterView:(id)sender{
    
    if(popup == nil)
        popup = [[APFilterPopup alloc]initWithFrame:[[[UIApplication sharedApplication] keyWindow] bounds]];
    else{
        popup.alpha = 1.0f;
        popup.hidden = NO;
    }
    self.inputViewDatePicker.datePickerMode = UIDatePickerModeDate;
    popup.startDate.inputView = self.inputViewDatePicker;
    popup.endDate.inputView = self.inputViewDatePicker;
    [popup.filterButton addTarget:self action:@selector(filterTable) forControlEvents:UIControlEventTouchUpInside];
    [popup.clearButton addTarget:self action:@selector(clearFilterTable) forControlEvents:UIControlEventTouchUpInside];
    CGRect fvcFrame = CGRectMake(10, 100, 280, 100);
    [fvc.view setFrame:fvcFrame];
    [fvc.tableView setFrame:fvcFrame];
    [popup.popup addSubview:fvc.tableView];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:(UIView *)popup];
        
}

-(void)filterTable {
    isFiltered = YES;
    [self.tableData removeAllObjects];
    [self reloadFilteredAlertListData];
    [self.popup dismissView];
}
-(void)clearFilterTable {
    isFiltered = NO;
    [self.tableData removeAllObjects];
    [self reloadAlertListDataAnimated:YES];
    [self.popup dismissView];
    self.popup.startDate.text = @"";
    self.popup.endDate.text = @"";
    self.popup.takenFilter.selectedSegmentIndex = ALL_ADHERENCE_TAKEN_STATUS;
    [self.fvc resetTreatmentChecks];
    [self.fvc resetMedicationChecks];
    [self.fvc.tableView reloadData];
}
- (void)loadMissingTreatmentReasonData
{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (![ad finishedLoadingReferenceData]) {
        //[ad loadReferenceData];
    }
}
- (IBAction)inputViewDatePickerValueChanged
{
    [self.popup inputViewDatePickerValueChanged:self.inputViewDatePicker];
}

@end
