//
//  ClinicianListPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/14/13.
//
//

#import "ClinicianListPageViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import <APSDK/PatientClinician+Remote.h>
#import "AuthManager+Rules.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "ContentCell.h"
#import "ClinicianSettingCell.h"
#import "FindClinicianViewController.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"
#import <APSDK/ClinicianCodeRequest.h>
#import <APSDK/ClinicianCodeRequest+Remote.h>
#import <APSDK/Patient+Remote.h>
#import "EditClinicianViewController.h"
#define K_LISTSTATUSFLAG @"N"
@interface ClinicianListPageViewController ()
{
    Boolean isFiltered;
    NSMutableArray *clinicalCodeRequestArray;
}
- (void)reloadClinicianListDataAnimated:(BOOL)animated;
- (IBAction)addClinicianButtonTapped;

@end


@implementation ClinicianListPageViewController
BOOL isLoaded_unRegClinicials, isLoadedClinicians;
@synthesize editMode;
@synthesize toolBar;

#pragma mark - Actions

- (IBAction)addClinicianButtonTapped {
    //[self performSegueWithIdentifier:@"ShowAddClincianPageViewController" sender:self];
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if (self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}
-(void)AddClincian {
    [self.toolBar hideToolBarInView:self.view animated:NO];
    [self.tableView setEditing:NO animated:NO];
    [self.tutorialView dismissViewAnimated:NO completion:nil];
    [self performSegueWithIdentifier:@"ShowAddClincianPageViewController" sender:self];
//    EditClinicianViewController *controller = [[EditClinicianViewController alloc]init];
//    controller.currentClinicians = [NSArray arrayWithArray:self.tableData];
//    [self.navigationController pushViewController:controller animated:YES];
    
     
//     presentViewController:controller animated:YES completion:nil];
    

}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowAddClincianPageViewController"])
    {
        
//        FindClinicianViewController *controller =(FindClinicianViewController *)[segue destinationViewController];

      EditClinicianViewController *controller = (EditClinicianViewController *)[segue destinationViewController];
      controller.currentClinicians = [NSArray arrayWithArray:self.tableData];
//        [self presentViewController:controller animated:YES completion:nil];
        
        
        
    }
}



#pragma mark - Private
- (void) loadUnRegisteredClinicians{
//    [self pushBusyOperation];
    // LOAD ALL THE PHYSICANS WAITING TO BE CONFIRMED FOR REGISTRATIONS PREVIOUSLY - svaz 5/12/14
    __block NSNumber *patientID = ((User *)[AuthManager defaultManager].currentCredentials).id;
    NSDictionary *params = @{@"patient_id":patientID, @"status_flag":K_LISTSTATUSFLAG};
    
    [ClinicianCodeRequest query:@"exact_match" params:params async:^(NSArray *objects, NSError *error) {
        self.listDataState = kDataStateReady;
        if (error) {
            [self popBusyOperation];
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else{ [self showMessage:[error localizedDescription] ? : @"Error"];
                NSLog(@"Error = %@", error);
            }
            
        } else {
            //success populate invars
            clinicalCodeRequestArray = [NSMutableArray new];
            [clinicalCodeRequestArray  addObjectsFromArray:objects];

            NSMutableArray *ar = [NSMutableArray new];
            for (ClinicianCodeRequest *ccr in objects) {
                
                NSMutableDictionary *ClinicalCodeReq= [NSMutableDictionary new];
                
                if ([ccr.patientId isEqualToNumber:patientID]) {
                    NSLog(@"======ccr.id = %@ ====== ", ccr.id);
                    NSString *_phone , *_fax, *_lastName, *_firstName, *_statusFlag;
                    [ClinicalCodeReq  setObject:ccr.id forKey:@"id"];
                    [ClinicalCodeReq  setObject:ccr.dateRequested forKey:@"dateRequested"];
                    [ClinicalCodeReq  setObject:ccr.patientId forKey:@"patientId"];
                    [ClinicalCodeReq  setObject:ccr.emailAddress forKey:@"emailAddress"];
                    
                    if (ccr.phone == nil) {
                        _phone = @"";
                    }else
                    {
                        _phone =ccr.phone ;
                    }
                    if (ccr.fax == nil) {
                        _fax = @"";
                    }else
                    {
                        _fax =ccr.fax ;
                    }
                    if (ccr.statusFlag == nil) {
                        _statusFlag = @"";
                    }else
                    {
                        _statusFlag =ccr.statusFlag ;
                    }
                    
                    if (ccr.lastName == nil) {
                        _lastName = @"";
                    }else
                    {
                        _lastName =ccr.lastName ;
                    }
                    
                    if (ccr.firstName == nil) {
                        _firstName = @"";
                    }else
                    {
                        _firstName =ccr.firstName ;
                    }
                    
                    
                    [ClinicalCodeReq  setObject:_firstName forKey:@"firstName"];
                    [ClinicalCodeReq  setObject:_lastName forKey:@"lastName"];
                    [ClinicalCodeReq  setObject:_statusFlag forKey:@"statusFlag"];
                    [ClinicalCodeReq  setObject:_phone forKey:@"phone"];
                    [ClinicalCodeReq  setObject:_fax forKey:@"fax"];
                    NSLog(@"Object ClinicalCodeReq = %@", ClinicalCodeReq);
                    [ar addObject:ClinicalCodeReq];
                }
            }
            //set flag
            isLoaded_unRegClinicials=YES;
            self.unRegisteredClinicians=ar;
            NSLog(@"loadUnRegisteredClinicians:unRegisteredClinicians.count %lu = %@",(unsigned long)self.unRegisteredClinicians.count, self.unRegisteredClinicians);
            [self.tableView reloadData];
            [self showViewDidAppear];
        }
        
    }];
    
//   [self popBusyOperation];
    
    
}

- (void)reloadClinicianListDataAnimated:(BOOL)animated {
    
    if ([AppDelegate hasConnectivity])
    {
        [self pushBusyOperation];
        
        [self loadUnRegisteredClinicians];
        
        __block NSArray *history = [self.tableData copy];
        [PatientClinician query:@"my_clinicians" params:nil offset:self.tableData.count limit:kListLength async:^(NSArray *objects, NSError *error) {
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
                    for(PatientClinician *p in self.tableData){
                        if(![p isRelationshipLoaded:@"clinician"]){
                            [p loadRelationship:@"clinician" async:^(NSError *error) {
                                NSLog(@"%@ Error Loading Relationship: %@",NSStringFromClass([self class]),[error localizedDescription]);
                            }];
                        }
                    }
                    NSLog(@"tableData count: reloadClinicianListDataAnimated  %lu",(unsigned long)self.tableData.count);
                    
                    isLoadedClinicians=YES;
                    [self.tableView reloadData];
//   *****         -  iOs 8 cleanup svaz 1/16/2015
                    //                    [self resize:self.tableView
                    //                              to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
                    //                                            self.tableData.count * self.tableView.rowHeight +
                    //                                            (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
                    //                        animated:animated];
//   *****         -  iOs 8 cleanup svaz 1/16/2015   -end
                    
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
                                if(self.tutorialView == nil){
                                    self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                                    [self.view addSubview:self.tutorialView];
                                    
                                    UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+tutorialX, 200, 300, 40)];
                                    newLabel.text = @"Tap to start adding Care Team";
                                    newLabel.backgroundColor = [UIColor clearColor];
                                    newLabel.textColor = [UIColor whiteColor];
                                    [self.tutorialView addSubview:newLabel];
                                    
                                    Arrow *newArrow = [[Arrow alloc]init];
                                    newArrow.head = CGPointMake(105+tutorialX, 5);
                                    newArrow.tail = CGPointMake(105+tutorialX, 200);
                                    [self.tutorialView addArrow:newArrow];
                                }
                         
                        }
            }
            } 
              
     
            else [self popBusyOperation];
        }];
//        [self popBusyOperation];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    
    
}


#pragma mark - UITableViewDataSource

- (NSString*)tableView: (UITableView*)tableView titleForHeaderInSection: (NSInteger)section {
    if(section == 1){
        return @"Clinicians Awaiting Code";
    }
    else if(section == 0){
        return @"Registered Clinicians";
    }else{
        
        return @"";
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(section == 1)
    {
        NSLog(@"numberOfRowsInSection: unRegisteredClinicians.count %lu",(unsigned long)self.unRegisteredClinicians.count);
        return self.unRegisteredClinicians.count;}
    else if(section == 0)
    {
        NSLog(@"tableData: self.tableData.count %lu",(unsigned long)self.tableData.count);
        return self.tableData.count;
        
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isLoaded_unRegClinicials || !isLoadedClinicians) {
        //exit if both are not loaded
        return [[UITableViewCell alloc]init];
    }
    
    // **** 4 PROTOTYPE CELLS IN THE TABLE VIEW          - svaz 5/12/14
    NSLog(@"indexPath.section = %ld",(long)indexPath.section);
    if (tableView == self.tableView) {
        if (indexPath.section == 1) {
            
            //            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            UITableViewCell *cell = [[UITableViewCell alloc]init];
            NSDictionary *unRegistered  = [self.unRegisteredClinicians objectAtIndex:indexPath.row];
            //            NSString *tweet = [unRegisteredClinicians objectAtIndex:indexPath.row];
            
            
            NSString *name = [[unRegistered objectForKey:@"firstName"] stringByAppendingFormat:@" %@" ,[unRegistered objectForKey:@"lastName"] ];
            [cell.textLabel setText:name];
            [cell.detailTextLabel setText:[unRegistered objectForKey:@"emailAddress"]];
            return cell;
     
        }
        else  if(indexPath.section == 0){
            
            // indexpath.section=0 here *****
            PatientClinician * object = [self.tableData objectAtIndex:indexPath.row];
            //editMode occures when the user taps the clinicians sync button
            if (self.editMode) {
                
                
                ClinicianSettingCell * cell = [[ClinicianSettingCell alloc] init];
                //                ClinicianSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Setting"];
                [cell configureWith:object];
                cell.contentLabel.text = object.clinicianNameDenormalized;
                 
                return cell;
            }
            else {
                ContentCell * cell = [[ContentCell alloc]init];
                //                ContentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Default"];
                cell.contentLabel.text = object.clinicianNameDenormalized;
                return cell;
            }
        }else{
            UITableViewCell *cell = [[UITableViewCell alloc]init];
            return cell;
        }
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat rowHeight = 44;
    if (self.editMode) rowHeight = 76;
    return rowHeight;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        NSLog(@"indexPath.section = %ld, self.listDataState=%u,,,%ld",(long)indexPath.section, self.listDataState,(long)indexPath.row);
        //&& self.listDataState == kDataStateReady
        
        if (indexPath.section == 1 && indexPath.row >= 0) {
            //            UNREGISTERED CLINICIANS
            
            EditClinicianViewController *edVC = [self.storyboard instantiateViewControllerWithIdentifier:@"editClinicianStory"];
            edVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            edVC.modalPresentationStyle = UIModalPresentationCurrentContext;
            NSDictionary *edict = [self.self.unRegisteredClinicians objectAtIndex:indexPath.row];
            edVC.dict_UnRegisteredClinician = edict;
            edVC.currentClinicians = self.tableData;
            [self.navigationController pushViewController:edVC animated:YES];
            
        }
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"indexPath.section = %ld, row =  %ld", (long)indexPath.section, (long)indexPath.row);
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if ([AppDelegate hasConnectivity])
        {
            if (indexPath.section == 0) {
                PatientClinician * patientClinician = [self.tableData objectAtIndex:indexPath.row];
                
                [self pushBusyOperation];
                __unsafe_unretained ClinicianListPageViewController * _self = self;
                
                // Delete Record from DB
                [patientClinician destroyAsync:^(id obj, NSError * error) {
                    if (error) {
                        [_self popBusyOperation];
                        if(ERROR_CODE_401(error)) {
                            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                            [app showSessionTerminatedAlert];
                        }
                        else {
                         [_self showMessage:@"Clinician failed to delete."];
                            NSLog(@"Clinician Delete Failure %@", error);
                        }
                    }
                    else {
                        [_self popBusyOperation];
                        
                        //[_self showMessage:@"Clinician successfully deleted."];
                        [_self.tableData removeAllObjects];
                        [_self reloadClinicianListDataAnimated:NO];
                    }
                }];
            }else if ( indexPath.section == 1){
                //un reg clinicians
                
//                ClinicianCodeRequest * ClinicianCodeRequest = [self.unRegisteredClinicians objectAtIndex:indexPath.row];
                
                ClinicianCodeRequest *clinicianCodeRequestObject2Delete =(ClinicianCodeRequest*) [clinicalCodeRequestArray objectAtIndex:indexPath.row];
                [self pushBusyOperation];
                __unsafe_unretained ClinicianListPageViewController * _self = self;
                // Delete Record from DB
                [clinicianCodeRequestObject2Delete destroyAsync:^(id obj, NSError * error) {
                    if (error) {
                        [_self popBusyOperation];
                        if(ERROR_CODE_401(error)) {
                            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                            [app showSessionTerminatedAlert];
                        }
                        else[_self showMessage:@"Clinician failed to delete."];
                    }
                    else {
                        [self.unRegisteredClinicians removeObjectAtIndex:indexPath.row];
                        [_self popBusyOperation];
                        
                        //[_self showMessage:@"Clinician successfully deleted."];
                        [_self.tableData removeAllObjects];
                        [_self reloadClinicianListDataAnimated:NO];
                    }
                }];
            }
        }
        else
        {
            [AppDelegate showNoConnecttivityAlert];
        }
    }
}

#pragma mark - UIViewController



//- (void) viewDidAppear:(BOOL)animated{

- (void) showViewDidAppear{
//    if(!HAS_DATA){
    NSLog(@"showViewDidAppear: unRegisteredClinicians=%lu, self.tableData.count = %lu", (unsigned long)self.unRegisteredClinicians.count, (unsigned long)self.tableData.count);
//    self.tutorialView = nil;
    if (self.unRegisteredClinicians.count > 0 ) {
        return;
    }else{
        NSLog(@"showViewDidAppear: unRegisteredClinicians=%lu, self.tableData.count = %lu", (unsigned long)self.unRegisteredClinicians.count, (unsigned long)self.tableData.count);

    }
    if( self.tableData.count > 0) {
        return;
    }else{
        NSLog(@"showViewDidAppear: unRegisteredClinicians=%lu, self.tableData.count = %lu", (unsigned long)self.unRegisteredClinicians.count, (unsigned long)self.tableData.count);

    }
    //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
    int tutorialX = 0;
    if (IS_IPAD) {
        tutorialX =+150;
    }

        [self.toolBar showToolBarInView:self.view animated:NO];
        CGRect frame = self.view.bounds;
        frame.origin.y += self.toolBar.frame.size.height;
        if(self.tutorialView == nil  ){
            self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
            [self.view addSubview:self.tutorialView];
            
            UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+tutorialX, 200, 300, 40)];
            newLabel.text = @"Tap to start adding Care Team";
            [newLabel  setFont:[UIFont systemFontOfSize:14]];
            newLabel.backgroundColor = [UIColor clearColor];
            newLabel.textColor = [UIColor whiteColor];
            [self.tutorialView addSubview:newLabel];
            
            Arrow *newArrow = [[Arrow alloc]init];
            newArrow.head = CGPointMake(105+tutorialX, 5);
            newArrow.tail = CGPointMake(105+tutorialX, 200);
            [self.tutorialView addArrow:newArrow];
        }
     

}


- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.toolBar = [[APToolBar alloc]initWithView:self.view];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddClincian)];
    UIBarButtonItem *delbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(startDeleteMode)];
    self.toolBar.items = [NSArray arrayWithObjects:flexible,addbutton,flexible, delbutton,flexible,nil];
    [self.view addSubview:self.toolBar];
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"Care Team", @"Care Team")];
    
}

-(void)startDeleteMode {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addObservers];
    self.editMode = YES;
    //[self refreshAnimated:animated];
    isLoaded_unRegClinicials=NO;
    isLoadedClinicians=NO;
    [self reloadClinicianListDataAnimated:animated];
}



@end
