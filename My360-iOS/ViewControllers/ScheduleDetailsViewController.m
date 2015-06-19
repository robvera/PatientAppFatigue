//
//  ScheduleDetailsViewController.m
//  MSPatient
//
//  Created by David Benko on 4/1/13.
//
//

#import "ScheduleDetailsViewController.h"
#import "SelectionListCell.h"
#import "ScheduleViewController.h"
#import "PikConstants.h"
#import "ConfigurationManager.h"

@interface ScheduleDetailsViewController ()

@property (nonatomic, weak) IBOutlet UITextField *currentScheduleDateTextField;
@property (nonatomic, weak) IBOutlet UITextField *treatmentScheduleTextField;

@end

@implementation ScheduleDetailsViewController

@synthesize treatmentScheduleData;
@synthesize treatmentSchedule;
@synthesize currentScheduleDate;
@synthesize nextScheduleDate;

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentScheduleDateTextField.placeholder = kFieldPlaceHolderText;
    self.currentScheduleDateTextField.tag = kFormViewControllerFieldDate;
   //self.startOnTextField.placeholder = kFieldPlaceHolderText;
    self.currentScheduleDateTextField.placeholder = @"Add";//  kFieldPlaceHolderText;
    
    self.inputViewDatePicker.datePickerMode = UIDatePickerModeDate;
    
    self.fields = @[self.currentScheduleDateTextField];
    
    for (UITextField * field in self.fields) {
        field.inputAccessoryView = self.inputAccessoryViewToolbar;
        
        if (field.tag == kFormViewControllerFieldDate){
            field.inputView = self.inputViewDatePicker;
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scheduleSelected:) name:@"selectedSchedule" object:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self refresh];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"ScheduleSegue"])
    {
        AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        ScheduleViewController *controller = (ScheduleViewController *)[segue destinationViewController];
        controller.tableData = ad.treatmentScheduleData;
    }
}
-(void)getScheduleDatesFromTextField:(UITextField* )textField {
    NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:textField];
    NSDate * textFieldDate = [formatter dateFromString:textField.text];
    if (textFieldDate != nil){
        [self setCurrentScheduleDate:textFieldDate];
        NSDate *blankDate = [[NSDate alloc]init];
        [self setNextScheduleDate:blankDate];
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectedSchedule" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (BOOL)saveTapped {
    
    // Make Sure required fields are not blank
//    NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:self.currentScheduleDateTextField];
//    NSDate * textFieldDate = [formatter dateFromString:self.currentScheduleDateTextField.text];
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:1];
//    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate: textFieldDate options:0];

    /*if (self.currentScheduleDateTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A schedule start date is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
        
    }
    else if (self.treatmentScheduleTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A schedule frequency required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
        
    }
    else if([nextDate compare:[NSDate date]] == NSOrderedAscending){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"You can not schedule a medication in the past." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }*/
    
    // Calculate schedule dates
    [self getScheduleDatesFromTextField:self.currentScheduleDateTextField];
    
    //Send new info to previous view. 
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: self.treatmentSchedule, @"schedule", self.currentScheduleDate, @"currentScheduleDate", self.nextScheduleDate, @"nextScheduleDate", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedScheduleDetails" object:nil userInfo:userInfo];
    
    return true;
}
/*
 * Resets field values
 */
- (void)refresh {
    if ([self isViewLoaded]) {
        self.currentScheduleDateTextField.text = [[self configureDateFormatter:[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] field:self.currentScheduleDateTextField] stringFromDate:self.currentScheduleDate];
        
        
        self.treatmentScheduleTextField.text = self.treatmentSchedule.name;
        [self getScheduleDatesFromTextField:self.currentScheduleDateTextField];
    }
    
    [self.tableView reloadData];
}

/*
 * Fires when user has completed a schedule frequency choice
 */
- (void)scheduleSelected:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"selectedSchedule"]){
        
        [self.navigationController popViewControllerAnimated:YES];
        
        NSDictionary *userInfo = notification.userInfo;
        
        self.treatmentSchedule = [userInfo objectForKey:@"schedule"];
        self.treatmentScheduleTextField.text = self.treatmentSchedule.name;
        
        [self.tableView reloadData];
        
        if ([[[ConfigurationManager sharedManager] appID] integerValue] == HepC
            ||[[[ConfigurationManager sharedManager] appID] integerValue] == MS
            ||[[[ConfigurationManager sharedManager] appID] integerValue] == MDD
            ||[[[ConfigurationManager sharedManager] appID] integerValue] == PD
            ||[[[ConfigurationManager sharedManager] appID] integerValue] == BC)
        {
            // add popup if "As NEEDED" is selected - svaz 9/19/14 - per Trello
            // Added here by rvera 10/10/14
            
            NSString *name = treatmentSchedule.name  ;
            //caseInsensitiveCompare
            if ([name isEqualToString:@"As needed"]) {
                
                UIAlertView *alert = [[UIAlertView alloc]init];
                alert.title = @"Alert!";
                alert.message = @"Although you may not know when the next dose for your \"As needed\" medication will be taken, please enter an estimated date.";
                alert.delegate = self;
                [alert addButtonWithTitle:@"OK"];
                [alert show];
                return;
            }
        }

        
    }
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == kFormViewControllerFieldDate) {
        if (textField.text.length > 0) {
            NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:textField];
            self.inputViewDatePicker.date = [formatter dateFromString:textField.text];
        }
        else {
            NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:textField];
            textField.text = [formatter stringFromDate:self.inputViewDatePicker.date];
        }
    }
    
    return YES;
}

-(void)back{
    if([self saveTapped]){
//            -  MSAA cleanup svaz 11/27/14
//        [super back];
    }
    else {
     return;
    }
}

@end
