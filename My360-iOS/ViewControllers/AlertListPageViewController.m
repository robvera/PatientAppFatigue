//
//  AlertListPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "AlertListPageViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/PatientReminder+Remote.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import <APSDK/APObject+Remote.h>
#import <QuartzCore/QuartzCore.h>
#import <APSDK/MissingTreatmentReason+Remote.h>
#import "FPPopoverController.h"
#import <QuartzCore/QuartzCore.h>
#import <APSDK/PatientAdherenceLog+Remote.h>
#import <APSDK/PatientTreatment+Remote.h>
#import <APSDK/Patient+Remote.h>
#import <APSDK/MissingTreatmentReason+Remote.h>
#import "PatientReminderCells.h"
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"



@interface AlertListPageViewController ()

- (void)reloadAlertListDataAnimated:(BOOL)animated;

@end



@implementation AlertListPageViewController

@synthesize processAll;

#pragma mark - Private

- (void)reloadAlertListDataAnimated:(BOOL)animated {
    if ([AppDelegate hasConnectivity])
    {
        [self pushBusyOperation];
        __block NSArray * history = [self.tableData copy];
       [PatientReminder query:@"my_unarchived_alerts" params:nil offset:self.tableData.count limit:kListLength async:^(NSArray * objects, NSError * error) {
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
                    /*[self resize:self.tableView
                          to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
                                        self.tableData.count * 80)
                    animated:animated];*/
                        [self popBusyOperation];
                        
                        if(!HAS_DATA){
                            [self.toolBar showToolBarInView:self.view animated:NO];
                            //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
 
                            int tutorialX = 0;
                            int tutorialX2 = 0 ;
                            if (IS_IPAD) {
                                tutorialX =+290;
                                tutorialX2 =+160;
                            }
                                CGRect frame = self.view.bounds;
                                frame.origin.y += self.toolBar.frame.size.height;
                                if(self.tutorialView == nil){
                                    self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                                    [self.view addSubview:self.tutorialView];
                                    
                                    UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(140+tutorialX, 100, 150, 100)];
                                    newLabel.text = @"Tap to mark all medication reminders as 'taken'";
                                    newLabel.backgroundColor = [UIColor clearColor];
                                    newLabel.numberOfLines = 4;
                                    newLabel.textAlignment = NSTextAlignmentCenter;
                                    newLabel.textColor = [UIColor whiteColor];
                                    [self.tutorialView addSubview:newLabel];
                                    
                                    newLabel = [[UILabel alloc]initWithFrame:CGRectMake(40+tutorialX2, 180, 250, 200)];
                                    newLabel.text = @"You don't have any reminders! Reminders are automatically generated to help you remember lab results, treatments, educations, and even to log in!";
                                    newLabel.backgroundColor = [UIColor clearColor];
                                    newLabel.numberOfLines = 8;
                                    newLabel.textAlignment = NSTextAlignmentCenter;
                                    newLabel.textColor = [UIColor whiteColor];
                                    [self.tutorialView addSubview:newLabel];
                                    
                                    
                                    Arrow *newArrow = [[Arrow alloc]init];
                                    newArrow.head = CGPointMake(215+tutorialX, 5);
                                    newArrow.tail = CGPointMake(215+tutorialX, 100);
                                    [self.tutorialView addArrow:newArrow];
                                    
                                }
//                            }
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
        }
        else {
            PatientReminderCells *cell = (PatientReminderCells *) [tableView dequeueReusableCellWithIdentifier:@"Default"];
            PatientReminder * object = [self.tableData objectAtIndex:indexPath.row];
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"MMM dd, yyyy";
            NSString *dateString = [[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] stringFromDate:object.reminderOn];
            NSDate *temp = [formatter dateFromString:dateString];
            formatter.dateFormat = @"MMM dd";
            dateString = [formatter stringFromDate:temp];
            cell.dateLabel.text = dateString;
            cell.contentLabel.text = object.reminderMessage;
            cell.contentLabel.numberOfLines = 0;
            cell.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [cell.contentLabel setTextColor: [object.unread boolValue] ? [UIColor redColor] : [UIColor blackColor]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if(object.patientTreatmentId != nil && object.patientTreatmentId != NULL){
                if (((PatientReminderCells *)cell).yesButton == nil) {
                    CGRect yesFrame = CGRectMake(cell.contentLabel.frame.origin.x + cell.contentLabel.frame.size.width + 10,cell.dateLabel.frame.origin.y, 70, 25);
                    cell.yesButton = [[UIButton alloc]initWithFrame:yesFrame];
                    [cell.yesButton setImage:[UIImage imageNamed:@"ThumbsUp.png"] forState:UIControlStateNormal];
                    [cell.contentView addSubview:cell.yesButton];
                }
                if (((PatientReminderCells *)cell).noButton == nil) {
                    CGRect noFrame = CGRectMake(cell.contentLabel.frame.origin.x + cell.contentLabel.frame.size.width + 10, cell.dateLabel.frame.origin.y + 30, 70, 25);
                    cell.noButton = [[UIButton alloc]initWithFrame:noFrame];
                    [cell.noButton setImage:[UIImage imageNamed:@"ThumbsDown.png"] forState:UIControlStateNormal];
                    [cell.contentView addSubview:cell.noButton];
                }
                [((PatientReminderCells *)cell).yesButton setTag:indexPath.row];
                [((PatientReminderCells *)cell).noButton setTag:indexPath.row];
                [((PatientReminderCells *)cell).yesButton addTarget:self action:@selector(tookTreatment:) forControlEvents:UIControlEventTouchUpInside];
                [((PatientReminderCells *)cell).noButton addTarget:self action:@selector(didMissTreatment:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            else {
                [cell.noButton performSelectorOnMainThread:@selector(removeFromSuperview) withObject:nil waitUntilDone:NO];
                [((PatientReminderCells *)cell).yesButton removeFromSuperview];
                [((PatientReminderCells *)cell).noButton removeFromSuperview];
                ((PatientReminderCells *)cell).yesButton = nil;
                ((PatientReminderCells *)cell).noButton = nil;
            }
            //[cell.contentLabel sizeToFit];
            //[cell sizeToFit];
            return cell;
        }
    }
    
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
    }
    //NSLog(@"%@",((PatientReminderCells *)[tableView cellForRowAtIndexPath:indexPath]).contentLabel.text);
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        if ([AppDelegate hasConnectivity])
        {
            PatientReminder * patientalert = [self.tableData objectAtIndex:indexPath.row];
            
            patientalert.archived = @1;
            [self pushBusyOperation];
            __unsafe_unretained AlertListPageViewController * _self = self;
            
            [patientalert updateAsync:^(id obj, NSError * error) {
                if (error) {
                    [_self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [_self showMessage:@"Treatment record failed to delete."];
                } else {
                    //[_self showMessage:@"Treatment record successfully deleted."];
                    [_self.tableData removeAllObjects];
                    [_self reloadAlertListDataAnimated:NO];
                    [_self popBusyOperation];
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
    
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"My Reminders", @"My Reminders")];
    self.toolBar = [[APToolBar alloc]initWithView:self.view];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *delbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toolBarDelete)];
    
    UIImage *image = [UIImage imageNamed:ASSET_BY_IOS_VERSION(@"myRx")];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake( 0, 0, 20, 20 );
    [button setImage:image forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = YES;
    [button addTarget:self action:@selector(processAllAdherence) forControlEvents:UIControlEventTouchUpInside];
    processAll = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.toolBar.items = [NSArray arrayWithObjects:flexible, delbutton,flexible,processAll,flexible,nil];
    [self.view addSubview:self.toolBar];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(openToolbar)];
    
    
    CGRect frame = self.view.bounds;
    frame.size.height -= (49 + self.tableView.rowHeight);
    [self.tableView setFrame:frame];
    
    
    [self.view bringSubviewToFront:self.tableView];
    
}
-(void)tookTreatment:(id)sender{

    PatientReminder * patientalert = (PatientReminder *)[self.tableData objectAtIndex:((UIButton*)sender).tag];
    [self tookMedication:patientalert];

}
-(void)didMissTreatment:(id)sender{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    UIActionSheet *as = [[UIActionSheet alloc]init];
    as.title = @"Why did you miss your treatment?";
    as.delegate = self;
    as.tag = ((UIButton*)sender).tag;
    int count = 0;
    for (MissingTreatmentReason * mtr in ad.missingTreatmentReasonData){
        [as addButtonWithTitle:mtr.name];
        count++;
    }
    [as addButtonWithTitle:@"Cancel"];
    [as setCancelButtonIndex:count ];
    [as showInView:[[[UIApplication sharedApplication] windows] objectAtIndex:0]];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if(buttonIndex < [[ad missingTreatmentReasonData]count]){
        PatientReminder * patientalert = (PatientReminder *)[self.tableData objectAtIndex:actionSheet.tag];
        [self didNotTakeMedication:patientalert missingReason:[ad.missingTreatmentReasonData objectAtIndex:buttonIndex]];
    }
}

-(void)processAllAdherence{
    
    UIViewController *controller = [[UIViewController alloc]init];
    [controller.view setFrame:CGRectMake(0, 0, 180, 120)];
    UIView *view = [[UIView alloc]initWithFrame:controller.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    popover.contentSize = CGSizeMake(200,160);
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, view.frame.size.width - 20, 70)];
    label.text = @"Did you take ALL of the medications?";
    label.numberOfLines = 3;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [view addSubview:label];
    
    UIButton *yes = [[UIButton alloc]init];
    CGRect yesFrame = view.frame;
    yesFrame.size.height = 35;
    yesFrame.size.width = (view.frame.size.width - 15) / 2;
    yesFrame.origin.y = view.frame.size.height - yesFrame.size.height - 10;
    yesFrame.origin.x = 5;
    [yes setFrame:yesFrame];
    [yes addTarget:popover action:@selector(dismissPopoverWithAnimation) forControlEvents:UIControlEventTouchUpInside];
    [yes addTarget:self action:@selector(tookAllMedications) forControlEvents:UIControlEventTouchDown];
    [yes setTitle:@"Yes" forState:UIControlStateNormal];
    [yes setBackgroundImage:[UIImage imageNamed:@"ToolBar.png"] forState:UIControlStateNormal];
    yes.layer.cornerRadius = 10;
    yes.layer.masksToBounds = YES;
    [view addSubview:yes];
    
    UIButton *no = [[UIButton alloc]init];
    CGRect noFrame = view.frame;
    noFrame.size.height = 35;
    noFrame.size.width = (view.frame.size.width - 15) / 2;
    noFrame.origin.y = view.frame.size.height - noFrame.size.height - 10;
    noFrame.origin.x = yesFrame.size.width + 10;
    [no setFrame:noFrame];
    [no addTarget:popover action:@selector(dismissPopoverWithAnimation) forControlEvents:UIControlEventTouchUpInside];
    [no setTitle:@"Cancel" forState:UIControlStateNormal];
    [no setBackgroundImage:[UIImage imageNamed:@"ToolBar.png"] forState:UIControlStateNormal];
    no.layer.cornerRadius = 10;
    no.layer.masksToBounds = YES;
    [view addSubview:no];
    
    [controller.view addSubview:view];
    //the popover will be presented from the okButton view
    
    [popover presentPopoverFromView:[processAll valueForKey:@"view"]];
}

-(void)tookAllMedications{
    [PatientReminder query:@"process_all" params:nil async:^(NSArray *objects, NSError *error) {
        if(error)NSLog(@"%@",error);
        else{
            [self.tableData removeAllObjects];
            [self reloadAlertListDataAnimated:YES];
        }
    }];
}

-(void)tookMedication:(PatientReminder *)reminder{
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setObject:[NSString stringWithFormat:@"%d",[reminder.id intValue]] forKey:@"reminder_id"];
    [params setObject:[NSNumber numberWithBool:YES] forKey:@"took_medication"];
    
    [PatientReminder query:@"process_one" params:params async:^(NSArray *objects, NSError *error) {
        if(error)NSLog(@"%@",error);
        else{
            [self.tableData removeAllObjects];
            [self reloadAlertListDataAnimated:YES];
        }
    }];
}
-(void)didNotTakeMedication:(PatientReminder *)reminder missingReason:(MissingTreatmentReason *)reason{
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setObject:[NSString stringWithFormat:@"%d",[reminder.id intValue]] forKey:@"reminder_id"];
    [params setObject:[NSNumber numberWithBool:NO] forKey:@"took_medication"];
    [params setObject:(NSNumber *)reason.id forKey:@"reason_id"];
    
    [PatientReminder query:@"process_one" params:params async:^(NSArray *objects, NSError *error) {
        if(error)NSLog(@"%@",error);
        else{
            [self.tableData removeAllObjects];
            [self reloadAlertListDataAnimated:YES];
        }
    }];
}



-(void)openToolbar{
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if(self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}

-(void)toolBarDelete{
      [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addObservers];
    
    //[self refreshAnimated:animated];
    [self reloadAlertListDataAnimated:animated];
    UIApplication* app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = 0;
    [self setAlertTabBadge: (int)app.applicationIconBadgeNumber];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [PatientReminder query:@"set_read" params:nil async:^(NSArray *objects, NSError *error) {
        if(error)NSLog(@"%@",error);
    }];
    [super viewWillDisappear:animated];
}
- (void)notificationRecieved:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"recievedRemoteNotification"]){
        UIApplication* app = [UIApplication sharedApplication];
        [self setAlertTabBadge:app.applicationIconBadgeNumber];
    }
}

//            - ios cleanup svaz 1/21/15 - changed to long
-(void)setAlertTabBadge:(long)badgeNum{

    if (badgeNum > 0)
        [[[[[self tabBarController] tabBar] items]objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%ld",badgeNum]];
    else
        [[[[[self tabBarController] tabBar] items]objectAtIndex:1] setBadgeValue:nil];
}

//-(void)setAlertTabBadge:(int)badgeNum{
//    if (badgeNum > 0)
//    [[[[[self tabBarController] tabBar] items]objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%d",badgeNum]];
//    else
//    [[[[[self tabBarController] tabBar] items]objectAtIndex:1] setBadgeValue:nil];
//}

@end
