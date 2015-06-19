//
//  BaseFormViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 2/28/13.
//
//

#import "BaseFormViewController.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"
#import "PIKAnalyticsManager.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
//#import "APNavigationController.h"

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)

@interface BaseFormViewController ()

@end

@implementation BaseFormViewController

@synthesize inputAccessoryViewToolbar = _inputAccessoryViewToolbar;
@synthesize inputViewDatePicker = _inputViewDatePicker;
@synthesize doneBarButtonItem = _doneBarButtonItem;
@synthesize dateFormatter = _dateFormatter;
@synthesize editMode;
@synthesize somethingChanged;




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.somethingChanged = NO;
    [self.tableView setAllowsSelection:YES];
    self.tableView.opaque = YES;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

}

-(void)back{
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self performSelector:@selector(showStatusBarAndNaviBar) withObject:self afterDelay:0.0];
    [super viewWillAppear:animated];
    //self.navigationItem.hidesBackButton = YES;
    //If we are not the root view controller, let's replace the back button. 
    if ([self.navigationController.viewControllers objectAtIndex:0] != self){
        UIImage *buttonImage = [UIImage imageNamed: ASSET_BY_IOS_VERSION(@"back_button_dark")];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    
    //self.navigationController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];

    //[((APNavigationController *)self.navigationController) removeAlert];
    [PIKAnalyticsManager sendAnalyticsToURLWithParams:[NSString stringWithFormat:@"pageview.cfm?book=%@user=%@&&chapter=%@&sbchapter=%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], ((User *)[AuthManager defaultManager].currentCredentials).id, NSStringFromClass([self class]), @""]];
}

- (void)showStatusBarAndNaviBar{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (IBAction)doneBarButtonItemTapped
{
    
    [self doneTapped:self.firstResponder];
}


- (IBAction)inputViewDatePickerValueChanged
{
    UITextField * field = self.firstResponder;
    NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:field];
    
    field.text = [formatter stringFromDate:self.inputViewDatePicker.date];
}


- (UITextField *)firstResponder
{
    for (UITextField * textField in self.fields) {
        if ([textField isFirstResponder]) {
            return textField;
        }
    }
    
    return nil;
}


- (void)doneTapped:(UITextField *)textField {
    
    [textField resignFirstResponder];
}



- (UIToolbar *)inputAccessoryViewToolbar
{
    if (!_inputAccessoryViewToolbar) {
        _inputAccessoryViewToolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
        _inputAccessoryViewToolbar.items = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], self.doneBarButtonItem];
        
        [_inputAccessoryViewToolbar sizeToFit];
        
        _inputAccessoryViewToolbar.barStyle = UIBarStyleBlack;
        _inputAccessoryViewToolbar.translucent = YES;
    }
    
    return _inputAccessoryViewToolbar;
}


- (UIDatePicker *)inputViewDatePicker
{
    return [self inputViewDatePickerWithTimeZone:[NSTimeZone systemTimeZone]];
}
- (UIDatePicker *)inputViewDatePickerWithTimeZone:(NSTimeZone *)timeZone
{
    if (!_inputViewDatePicker) {
        _inputViewDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
        //_inputViewDatePicker.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        [_inputViewDatePicker addTarget:self
                                 action:@selector(inputViewDatePickerValueChanged)
                       forControlEvents:UIControlEventValueChanged];
        [_inputViewDatePicker sizeToFit];
    }
    _inputViewDatePicker.timeZone = timeZone;
    
    return _inputViewDatePicker;
}


- (UIBarButtonItem *)doneBarButtonItem
{
    if (!_doneBarButtonItem) {
        _doneBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(doneBarButtonItemTapped)];
        _doneBarButtonItem.title =  @"Done";
        _doneBarButtonItem.style = UIBarButtonItemStyleDone;
    }
    
    return _doneBarButtonItem;
}


- (NSDateFormatter *)dateFormatter
{
    return [self dateFormatterWithTimeZone:[NSTimeZone systemTimeZone]];
}
- (NSDateFormatter *)dateFormatterWithTimeZone:(NSTimeZone *)timeZone
{
    if (!_dateFormatter)
    {
        _dateFormatter = [NSDateFormatter new];
    }
    
    _dateFormatter.timeZone = timeZone;
    
    return _dateFormatter;
}

- (NSDateFormatter *)configureDateFormatter:(NSDateFormatter *)formatter field:(UIView *)field
{
    if (field.tag == kFormViewControllerFieldDateTime) {
        formatter.dateFormat = kDateTimeFormat;
    }
    else if (field.tag == kFormViewControllerFieldDate) {
        formatter.dateFormat = kDateFormat;
    }
    else if (field.tag == kFormViewControllerFieldTime) {
        formatter.dateFormat = kTimeFormat;
    }
    
    return formatter;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)checkSomethingChanged:(id)sender {
}

-(void)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonPressedMsg{
  
    
//    [alertMsg show];
    NSLog(@"Button Pressed Message Tapped");
    
}


@end
