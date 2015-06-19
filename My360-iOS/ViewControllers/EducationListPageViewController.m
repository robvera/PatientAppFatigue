//
//  EducationListPageViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "EducationListPageViewController.h"
#import <APSDK/AuthManager.h>
#import <APSDK/PatientEducation+Remote.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "EducationCell.h"
#import "EducationViewController.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/EducationalReading+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PIKCommon.h"
#import "PikConstants.h"


@interface EducationListPageViewController ()


- (void)reloadEducationListDataAnimated:(BOOL)animated;

@end


@implementation EducationListPageViewController

@synthesize favorites;
@synthesize nonFavorites;

#pragma mark - Private

- (void)reloadEducationListDataAnimated:(BOOL)animated {
    
    if ([AppDelegate hasConnectivity])
    {
        
        [self pushBusyOperation];
        
        NSNumber *uid = ((User *)[AuthManager defaultManager].currentCredentials).id;
        // TODO PIK Example
        [PatientEducation myUnarchivedEducationsWithId:uid appId:nil offset:0 limit:INT_MAX async:^(NSArray *objects, NSError *error) {
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
                    NSMutableArray *tableDataTemp = [NSMutableArray arrayWithArray:objects];
                    NSMutableArray *favoritesTemp = [[NSMutableArray alloc]init];
                    NSMutableArray *nonFavoritesTemp = [[NSMutableArray alloc]init];
                    for(PatientEducation *p in tableDataTemp){
                        if ([p.favorite boolValue]) [favoritesTemp addObject:p];
                        else [nonFavoritesTemp addObject:p];
                    }
                    self.tableData = tableDataTemp;
                    self.favorites = favoritesTemp;
                    self.nonFavorites = nonFavoritesTemp;
                    [self.tableView reloadData];
                    [self popBusyOperation];
                }
            } else [self popBusyOperation];
        }];
        
        /*[PatientEducation myUnarchivedEducationsWithId:uid offset:0 limit:INT_MAX async:^(NSArray *objects, NSError *error) {
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
                NSMutableArray *tableDataTemp = [NSMutableArray arrayWithArray:objects];
                NSMutableArray *favoritesTemp = [[NSMutableArray alloc]init];
                NSMutableArray *nonFavoritesTemp = [[NSMutableArray alloc]init];
                for(PatientEducation *p in tableDataTemp){
                    if ([p.favorite boolValue]) [favoritesTemp addObject:p];
                    else [nonFavoritesTemp addObject:p];
                }
                self.tableData = tableDataTemp;
                self.favorites = favoritesTemp;
                self.nonFavorites = nonFavoritesTemp;
                [self.tableView reloadData];
                [self popBusyOperation];
            }
            } else [self popBusyOperation];
       }];*/
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
}


#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return @"Favorite Education";
            break;
        case 1:
            return @"Assigned Education";
            break;
        default:
            return @"";
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return self.favorites.count;
            break;
        case 1:
            return self.nonFavorites.count;
            break;
        default:
            return 0;
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    int SPECIAL_HEIGHT = 100;
    int NORMAL_HEIGHT = 44;
// Modefied to stop showing special height rvera 6/11/14   
//    if (indexPath.section == 1 && indexPath.row == 1) {
//        return SPECIAL_HEIGHT;
//    }
    //   *****         -  iOs 8 cleanup svaz 1/23/2015   -end
//    return NORMAL_HEIGHT;
    
    return kRowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        /*if (indexPath.section == 1) {
            LoadingTableViewCell * cell = (LoadingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Loading"];
            
            if (self.listDataState == kDataStateLoading) {
                cell.state = kLoadingTableViewCellStateBusy;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.state = kLoadingTableViewCellStateReady;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            return cell;
        }
        else {*/
       
        EducationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Default"];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        
        CGRect labelFrame = cell.contentLabel.frame;
        labelFrame.origin.x = 55; // was 65
        labelFrame.size.width = 240; // added insted of the 2 line break. -- rvera 8/15/14
        cell.contentLabel.frame = labelFrame;
        
        PatientEducation * object;
        
        for (long i = [cell.contentView.subviews count] - 1; i>=0; i--)
            if ([[cell.contentView.subviews objectAtIndex:i] isKindOfClass:[UIButton class]])
                [[cell.contentView.subviews objectAtIndex:i] removeFromSuperview];
        
        UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(10, 0, 40, 40)];
        button.tag = indexPath.row;
        
        if(indexPath.section == 0){
            object = (self.favorites.count -1 >= indexPath.row) ? [self.favorites objectAtIndex:indexPath.row] : nil;
            [button addTarget:self action:@selector(makeNotFavorite:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if(indexPath.section == 1){
            object = (self.nonFavorites.count -1 >= indexPath.row) ? [self.nonFavorites objectAtIndex:indexPath.row] : nil;
            [button addTarget:self action:@selector(makeFavorite:) forControlEvents:UIControlEventTouchUpInside];
        }
        [button setBackgroundImage:[UIImage imageNamed:[object.favorite boolValue] ? @"favorite.png" : @"unfavorite.png"] forState:UIControlStateNormal];
        [cell.contentView addSubview:button];
        
        cell.contentLabel.numberOfLines = 1;    // added insted of the 2 line break. -- rvera 8/15/14
        cell.contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;    // added insted of the 2 line break. -- rvera 8/15/14
        [cell.contentLabel setFont: [UIFont fontWithName:nil size:12]];     // added insted of the 2 line break. -- rvera 8/15/14
        cell.contentLabel.text = object.educationalReadingDenormalized;
        [cell.contentLabel setTextColor: [object.unread boolValue] ? [UIColor redColor] : [UIColor blackColor]];
        
        NSLog(@"cell.contentLabel.text: %@",cell.contentLabel.text);
        
        
            return cell;
       // }
    }
    
    return nil;
}

-(void)makeFavorite:(id)sender {
    PatientEducation *pe = (PatientEducation *)[self.nonFavorites objectAtIndex:((UIButton *)sender).tag];
    
    pe.favorite = [NSNumber numberWithBool:YES];
    
    [pe updateAsync:^(id object, NSError *error) {
        if(error)NSLog(@"%@",error);
        else {
            [self.nonFavorites removeObject:pe];
            [self.favorites addObject:pe];
            [self.tableView reloadData];
        }
    }];
    
}

-(void)makeNotFavorite:(id)sender {
    PatientEducation *pe = (PatientEducation *)[self.favorites objectAtIndex:((UIButton *)sender).tag];
    
    pe.favorite = [NSNumber numberWithBool:NO];
    
    [pe updateAsync:^(id object, NSError *error) {
        if(error)NSLog(@"%@",error);
        else{
            [self.favorites removeObject:pe];
            [self.nonFavorites addObject:pe];
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.tableView) {
        /*if (indexPath.section == 1 && self.listDataState == kDataStateReady) {
            ((LoadingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).state = kLoadingTableViewCellStateBusy;
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            self.listDataState = kDataStateLoading;
            [self reloadEducationListDataAnimated:YES];
        }
        else {*/
            PatientEducation *pe;
            if(indexPath.section == 0){
                pe = [self.favorites objectAtIndex:indexPath.row];
            }
            else if(indexPath.section == 1){
                pe = [self.nonFavorites objectAtIndex:indexPath.row];
            }
            NSDictionary *params = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObject:pe.id] forKeys:[NSArray arrayWithObject:@"patient_education_id"]];
            [PatientEducation query:@"set_one_read" params:params async:^(NSArray *objects, NSError *error) {
                if(error)NSLog(@"%@",error);
            }];
             [self performSegueWithIdentifier:@"ShowEducationPageViewController" sender:pe];
       // }
    }
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
            PatientEducation * patientEducation = [self.tableData objectAtIndex:indexPath.row];
            
            patientEducation.archived = @1;
            [self pushBusyOperation];
            __unsafe_unretained EducationListPageViewController * _self = self;
            
            [patientEducation updateAsync:^(id obj, NSError * error) {
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
                    [_self reloadEducationListDataAnimated:NO];
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowEducationPageViewController"]) {
        ((EducationViewController *)segue.destinationViewController).patientEducation = sender;
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toolBar = [[APToolBar alloc]initWithView:self.view];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *delbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toolBarDelete)];
    self.toolBar.items = [NSArray arrayWithObjects:flexible, delbutton,flexible,nil];
    [self.view addSubview:self.toolBar];
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"Patient Education", @"Patient Education")];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(openToolbar)];
    
    CGRect frame = self.view.bounds;
    frame.size.height -= 80;
    self.tableView.frame = frame;
    self.favorites = [[NSMutableArray alloc]init];
    self.nonFavorites = [[NSMutableArray alloc]init];
    
    [[PIKCommon sharedInstance] popLayerMessageWithInterval:self.view message:@"WiFi or data connection is required" NSTimeInterval:3.00];
    
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
    
//    Commented so that it would not cut off = svaz 12/15/14
//   [self refreshAnimated:animated];
    
    if (!self.tableData.count) {
        [self reloadEducationListDataAnimated:animated];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [PatientEducation query:@"set_read" params:nil async:^(NSArray *objects, NSError *error) {
        if(error)NSLog(@"%@",error);
    }];
    [super viewWillDisappear:animated];
}

-(void)back {
    [super back];
}


@end
