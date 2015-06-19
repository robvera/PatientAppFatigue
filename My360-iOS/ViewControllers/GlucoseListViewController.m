//
//  GlucoseListViewController.m
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/26/13.
//
//

#import "GlucoseListViewController.h"
#import "UIViewController+UI.h"
#import <APSDK/PatientGlucose+Remote.h>
#import "PikConstants.h"
#import "ConfigurationManager.h"
#import "LoadingTableViewCell.h"
#import "GlucoseCell.h"
#import <APSDK/APObject+Remote.h>
#import "EditGlucosePageViewController.h"
#import "UIColor+APColorExtension.h"
#import "PikConstants.h"
#import "PIKCommon.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>

@interface GlucoseListViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem * addGlucoseButtonBarButtonItem;

- (IBAction)addGlucoseButtonTapped;
- (void)reloadGlucoseListDataAnimated:(BOOL)animated;

@end

@implementation GlucoseListViewController

@synthesize reloadDataOnLoad;

#pragma mark - Actions

- (IBAction)addGlucoseButtonTapped
{
    [self.toolBar showHideToolBarInView:self.view animated:YES];
    if(self.toolBar.hidden) [self.tableView setEditing:NO animated:YES];
}

-(void)toolBarAdd{
    [self performSegueWithIdentifier:@"ShowAddGlucosePageViewController" sender:self];
    [self.toolBar hideToolBarInView:self.view animated:NO];
    [self.tableView setEditing:NO animated:YES];
    [self.tutorialView dismissViewAnimated:NO completion:nil];
}
-(void)toolBarDelete{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)reloadGlucoseListDataAnimated:(BOOL)animated
{
    
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
//        [params setObject:[self.dateFormatter stringFromDate:self.fromDate] forKey:@"from_date"];
//        [params setObject:[self.dateFormatter stringFromDate:self.toDate] forKey:@"to_date"];
        NSNumber *patientID = ((User *)[AuthManager defaultManager].currentCredentials).id;
        [params setObject:patientID forKey:@"patient_id"];
        
        [PatientGlucose query:@"my_unarchived_glucose" params:params offset:self.tableData.count limit:100 async:^(NSArray *objects, NSError *error) {


       // [PatientGlucose myUnarchivedGlucoseWithId:nil appId:[[StatusManager sharedInstance] appID] fromDate:self.fromDate toDate:self.toDate offset:self.tableData.count limit:kListLength async:^(NSArray *objects, NSError *error) {
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
                    
                    if (!self.defaultPatientGlucoseSet) {
                        self.defaultPatientGlucose = [self.tableData firstObject];
                        self.defaultPatientGlucoseSet = YES;
                    }
                    
                    if (objects.count > kListLength - 1) {
                        [self.tableData removeLastObject];
                    }
                    else {
                        self.listDataState = kDataStateFull;
                    }
                    
                    
                    NSSortDescriptor *dateSorter = [[NSSortDescriptor alloc] initWithKey:@"glucoseOn" ascending:YES];
                    NSSortDescriptor *intradaySorter = [[NSSortDescriptor alloc] initWithKey:@"timeFrameSortId" ascending:YES];
                    
                    [self.tableData sortUsingDescriptors:[NSArray arrayWithObjects:dateSorter, intradaySorter, nil]];

                    
                    [self.tableView reloadData];
//            - ios cleanup svaz 1/12/15
//                    [self resize:self.tableView to:CGSizeMake(CGRectGetWidth(self.tableView.frame), self.tableData.count * self.tableView.rowHeight + (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight)) animated:animated];
//            - ios cleanup svaz 1/12/15 -end
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
                            
                            UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(40+tutorialX, 160, 300, 40)];
                            [newLabel setFont:[UIFont systemFontOfSize:14.0]];
                            newLabel.text =@"Tap start adding glucose, insulin and";
                            newLabel.backgroundColor = [UIColor clearColor];
                            newLabel.textColor = [UIColor whiteColor];
                            
                            UILabel *newLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(40+tutorialX, 180, 300, 40)];
                            [newLabel2 setFont:[UIFont systemFontOfSize:14.0]];
                            newLabel2.text =@" and carbohydrate measurements";
                            newLabel2.backgroundColor = [UIColor clearColor];
                            newLabel2.textColor = [UIColor whiteColor];
                            
                            
                            [self.tutorialView addSubview:newLabel];
                            [self.tutorialView addSubview:newLabel2];
                            Arrow *newArrow = [[Arrow alloc]init];
                            newArrow.head = CGPointMake(80+tutorialX, 5);
                            newArrow.tail = CGPointMake(80+tutorialX, 150);
                            [self.tutorialView addArrow:newArrow];
                         
//                        PIKCommon *c = [PIKCommon sharedInstance];
//                        [ c popLayerMessage:self.view message:@"Thank you, your email has been sent. it will be doctor's name, address, etc. in case they do not have their clinician code. sort of a heads up... "];
                        
                    }
                 
                }
            } else {
                [self popBusyOperation];
            }
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
            GlucoseCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Default"];
            
            [cell configureWith:[self.tableData objectAtIndex:indexPath.row]];
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
            [self reloadGlucoseListDataAnimated:YES];
        }
        else {
            
            [self performSegueWithIdentifier:@"ShowEditGlucosePageViewController" sender:[self.tableData objectAtIndex:indexPath.row]];
        }
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
            PatientGlucose * patientGlucose = [self.tableData objectAtIndex:indexPath.row];
            
            
            patientGlucose.archived = @1;
            [self pushBusyOperation];
            __unsafe_unretained GlucoseListViewController * _self = self;
            
            [patientGlucose updateAsync:^(id obj, NSError * error) {
                if (error) {
                    [_self popBusyOperation];
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else [_self showMessage:@"Glucose record failed to delete."];
                } else {
                    [_self popBusyOperation];
                    
                    //[_self showMessage:@"Treatment record successfully deleted."];
                    [_self.tableData removeAllObjects];
                    [_self reloadGlucoseListDataAnimated:NO];
                }
            }];
        }
        else
        {
            [AppDelegate showNoConnecttivityAlert];
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}



#pragma mark - UIViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowEditGlucosePageViewController"]) {
        ((EditGlucosePageViewController *)segue.destinationViewController).patientGlucose = sender;
        ((EditGlucosePageViewController *)segue.destinationViewController).editMode = YES;
        ((EditGlucosePageViewController *)segue.destinationViewController).defaultPatientGlucose  =sender;
    }
    // New          - svaz 5/7/14
    else if ([segue.identifier isEqualToString:@"ShowAddGlucosePageViewController"]) {
        EditGlucosePageViewController *controller = (EditGlucosePageViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
        controller.editMode = NO;
//        controller.defaultPatientGlucose = self.defaultPatientGlucose;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.defaultPatientGlucoseSet = NO;
    
    //add a third button to the toolbar
    UIBarButtonItem *filterButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: ASSET_BY_IOS_VERSION(@"icon_filter_filled")] style:UIBarButtonItemStylePlain target:self action:@selector(showFilterView:)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSMutableArray *array = [self.toolBar.items mutableCopy];
    [array addObject:filterButtonItem];
    [array addObject:flexibleSpace];
    
    self.toolBar.items = array;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedNotification:) name:@"reloadView" object:nil];
    
    self.reloadDataOnLoad =YES;
    self.navigationItem.title = [AppDelegate interpolateString:NSLocalizedString(@"Blood Sugar Tracker", @"Blood Sugar Tracker")];  //My Diabetes
    
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:kDateFormat];

    [self setDefaultDates];
    
    
  /*
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    gregorian.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate: today];
    [components setHour: 0];
    [components setMinute: 0];
    [components setSecond: 0];
    
    NSDate *newDate = [gregorian dateFromComponents: components];

    NSLog(@"newDate: %@", newDate);
*/

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addObservers];
    
    if (reloadDataOnLoad){
        //[self refreshAnimated:animated];
        [self reloadGlucoseListDataAnimated:animated];
        self.reloadDataOnLoad = NO;
    }
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"reloadView" object:nil];

}




-(void)showFilterView:(id)sender
{
    NSLog(@"ShowFilterView");
    
    [[NSBundle mainBundle] loadNibNamed:@"DateFilterView" owner:self options:nil];
    

    self.filterView.backgroundColor = [UIColor transparentBlackColor];

    self.filterViewContentView.backgroundColor = [UIColor whiteColor];
    self.filterViewContentView.clipsToBounds = YES;
    self.filterViewContentView.layer.cornerRadius = 8;
    self.filterViewContentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.filterViewContentView.layer.borderWidth = 1.0f;

    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.maximumDate = [NSDate date];
    [self.datePicker addTarget:self action:@selector(saveDate:) forControlEvents:UIControlEventValueChanged];
    
    self.fromDateTextField.inputView = self.datePicker;
    self.fromDateTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.fromDateTextField.placeholder = kFieldPlaceHolderText;
    self.fromDateTextField.tag = kFormViewControllerFieldDate;
    
    self.toDateTextField.inputView = self.datePicker;
    self.toDateTextField.inputAccessoryView = self.inputAccessoryViewToolbar;
    self.toDateTextField.placeholder = kFieldPlaceHolderText;
    self.toDateTextField.tag = kFormViewControllerFieldDate;
    
    if (self.fromDate) {
        self.fromDateTextField.text = [self.dateFormatter stringFromDate:self.fromDate];

    }
    
    if (self.toDate) {
        self.toDateTextField.text = [self.dateFormatter stringFromDate:self.toDate];

    }

    [self.clearFilterButton setTitle:@"Use Defaults" forState:UIControlStateNormal];
    [self.clearFilterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.clearFilterButton.titleLabel.font = [UIFont boldSystemFontOfSize:kMediumFontSize];
    self.clearFilterButton.clipsToBounds = YES;
    self.clearFilterButton.layer.cornerRadius = 6.0f;
    self.clearFilterButton.backgroundColor = [UIColor darkBlue];
    [self.clearFilterButton addTarget:self action:@selector(clearButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.applyFilterButton setTitle:@"Apply Filter" forState:UIControlStateNormal];
    [self.applyFilterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.applyFilterButton.titleLabel.font = [UIFont boldSystemFontOfSize:kMediumFontSize];
    self.applyFilterButton.clipsToBounds = YES;
    self.applyFilterButton.layer.cornerRadius = 6.0f;
    self.applyFilterButton.backgroundColor = [UIColor darkBlue];
    [self.applyFilterButton addTarget:self action:@selector(applyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *closeTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeFilterView:)];
    closeTapGesture.delegate = self;
    [self.filterView addGestureRecognizer:closeTapGesture];
    

    CGRect viewRect = self.filterView.frame;

    viewRect.origin.y = viewRect.size.height;
    viewRect.size.height += 20;
    self.filterView.frame = viewRect;
    
    // add to window so everything is covered
    [self.view.window addSubview:self.filterView];
    
    //slide view in
    [UIView animateWithDuration:0.8 animations:^{
        
        CGRect viewRect = self.filterView.frame;
        viewRect.origin.y = 0;
        
        self.filterView.frame = viewRect;
        
    } completion:^(BOOL finished){
        
    }];
}


#pragma mark - TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

    if (textField == self.fromDateTextField) {
        
        if (textField.text.length == 0) {
            self.fromDateTextField.text = [self.dateFormatter stringFromDate:[NSDate date]];
            self.fromDate = [NSDate date];
            
        }
        else {
            self.datePicker.date = self.fromDate;
            
        }
    }
    else if (textField == self.toDateTextField) {
        
        if (textField.text.length == 0) {
            self.toDateTextField.text = [self.dateFormatter stringFromDate:[NSDate date]];
            self.toDate = [NSDate date];
            
        }
        else {
            self.datePicker.date = self.toDate;
            
        }
    }
    
    return YES;
}



#pragma mark - Actions
- (void)applyButtonTapped:(id)sender
{
    
    [UIView animateWithDuration:0.8 animations:^{
        
        CGRect viewRect = self.filterView.frame;
        
        viewRect.origin.y = viewRect.size.height;
        self.filterView.frame = viewRect;
        
    } completion:^(BOOL finished){
        
        [self.filterView removeFromSuperview];
        self.filterView = nil;
        
        self.reloadDataOnLoad = YES;
        [self reloadGlucoseListDataAnimated:NO];
        
    }];
}


- (void)saveDate:(UIDatePicker *)sender
{
    NSString *stringFromDate = [self.dateFormatter stringFromDate:sender.date];
   
    if (self.fromDateTextField.isFirstResponder) {
        self.fromDateTextField.text = stringFromDate;
        self.fromDate = sender.date;

    }
    else {
        self.toDateTextField.text = stringFromDate;
        self.toDate = sender.date;

    }
}


- (IBAction)doneBarButtonItemTapped
{
    
    [self.fromDateTextField resignFirstResponder];
    [self.toDateTextField resignFirstResponder];
}




- (void)clearButtonTapped:(id)sender
{
    
    [UIView animateWithDuration:0.8 animations:^{
        
        CGRect viewRect = self.filterView.frame;
        
        viewRect.origin.y = viewRect.size.height;
        self.filterView.frame = viewRect;
        
    } completion:^(BOOL finished){
        
        [self.filterView removeFromSuperview];
        self.filterView = nil;
        
        [self setDefaultDates];
        
        self.reloadDataOnLoad = YES;
        [self reloadGlucoseListDataAnimated:NO];
        
    }];
}



#pragma mark - Gesture Recognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isMemberOfClass:[UITapGestureRecognizer class]]) {
        
        if (touch.view == self.filterView){
            
            return YES;
        }
    }
    
    return NO;
}


- (void)closeFilterView:(UITapGestureRecognizer *)recognizer
{
    
    [UIView animateWithDuration:0.8 animations:^{
        
        CGRect viewRect = self.filterView.frame;
        
        viewRect.origin.y = viewRect.size.height;
        self.filterView.frame = viewRect;
        
    } completion:^(BOOL finished){
        
        [self.filterView removeFromSuperview];
        self.filterView = nil;
        
    }];
}


#pragma mark - Data
-(void)setDefaultDates
{
    self.toDate = [NSDate date];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:-1];
    self.fromDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self.toDate options:0];
    
}


- (void)recievedNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"reloadView"]){
        
        self.reloadDataOnLoad = YES;
    }
}





@end
