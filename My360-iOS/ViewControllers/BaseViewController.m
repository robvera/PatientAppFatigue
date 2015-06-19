//
//  BaseViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 2/26/13.
//
//

#import "BaseViewController.h"
#import "PikConstants.h"
#import "UIView+APViewExtensions.h"
#import "UITextField+APTextFieldExtensions.h"
#import "PIKAnalyticsManager.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
#import "EditGlucosePageViewController.h"
#import "PasswordViewController.h"
//#import "APNavigationController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize inputToolbar;
@synthesize leftBarButton;
@synthesize rightBarButton;
@synthesize dateFormatter = _dateFormatter;;
@synthesize inputAccessoryViewToolbar = _inputAccessoryViewToolbar;
@synthesize doneBarButtonItem = _doneBarButtonItem;
@synthesize inputViewDatePicker = _inputViewDatePicker;
@synthesize activeField;
@synthesize originalOffset;
@synthesize scrollView;
@synthesize kbRect;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.scrollView.delegate = self;
    [self createInputAccessoryView];
    
    [self dateFormatter];
    [self.dateFormatter setDateFormat:kDateFormat];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [self performSelector:@selector(showStatusBarAndNaviBar) withObject:self afterDelay:0.0];
    [super viewWillAppear:animated];
    //self.navigationController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    //If we are not the root view controller, let's replace the back button.
    //self.navigationItem.hidesBackButton = YES;
    if ([self.navigationController.viewControllers objectAtIndex:0] != self){
        UIImage *buttonImage = [UIImage imageNamed:ASSET_BY_IOS_VERSION(@"back_button_dark")];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:buttonImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    //[self setNeedsStatusBarAppearanceUpdate];
    
    //[((APNavigationController *)self.navigationController) removeAlert];
    [PIKAnalyticsManager sendAnalyticsToURLWithParams:[NSString stringWithFormat:@"pageview.cfm?book=%@user=%@&&chapter=%@&sbchapter=%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], ((User *)[AuthManager defaultManager].currentCredentials).id, NSStringFromClass([self class]), @""]];
}
- (void)showStatusBarAndNaviBar{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
}
- (UIToolbar *)inputAccessoryViewToolbar
{
    if (!_inputAccessoryViewToolbar) {
        _inputAccessoryViewToolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
        _inputAccessoryViewToolbar.items = @[
                                             [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                             self.doneBarButtonItem
                                             ];
        
        _inputAccessoryViewToolbar.barStyle = UIBarStyleBlack;
        _inputAccessoryViewToolbar.translucent = YES;

        [_inputAccessoryViewToolbar sizeToFit];
    }
    
    return _inputAccessoryViewToolbar;
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

- (void) doneBarButtonItemTapped{
    
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

- (void) inputViewDatePickerValueChanged{
    
}

- (NSDateFormatter *)dateFormatter
{
    return [self dateFormatterWithTimeZone:[NSTimeZone systemTimeZone]];
}
- (NSDateFormatter *)dateFormatterWithTimeZone:(NSTimeZone *)timeZone
{
    if (!_dateFormatter) _dateFormatter = [NSDateFormatter new];
    _dateFormatter.timeZone = timeZone;
    
    return _dateFormatter;
}


-(void)createInputAccessoryView
{
    
    // create a done view + done button, attach to it a doneClicked action, and place it in a toolbar as an accessory input view...
    self.inputToolbar = [[UIToolbar alloc] init];
    self.inputToolbar.barStyle = UIBarStyleBlack;
    self.inputToolbar.translucent = YES;
    self.inputToolbar.tintColor = nil;
    [self.inputToolbar sizeToFit];
    
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone  target:self action:@selector(keyboardDonePressed:)];
    
    UIBarButtonItem* nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(navigateNextTextField)];
    
    UIBarButtonItem* prevButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(navigatePreviousTextField)];
  
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self.inputToolbar setItems:[NSArray arrayWithObjects:prevButton,nextButton,spacer, doneButton, nil]];
    
}

- (void) keyboardDonePressed:(id) passedIn{
    
}
#pragma mark - UITextView Navigation

-(void)navigateNextTextField{
    [self navigateTabChain:FALSE];
}
-(void)navigatePreviousTextField{
    [self navigateTabChain:TRUE];
}
-(void)navigateTabChain:(BOOL)reverse{
    /*
     * Find First Responder
     * If the current first responder is a UITextField, get the next textfield in the tab chain
     * make next textfield the first responder
     */
    id firstResponder = [self.view findFirstResponder];
    UITextField *currentTextField = [firstResponder isMemberOfClass:[UITextField class]] ? (UITextField *)firstResponder : nil;
    if (currentTextField != nil) {
        UITextField *next = nil;
        if(!reverse)next = currentTextField.nextTextField;
        else next = currentTextField.previousTextField;
        if(next != nil){
            [next becomeFirstResponder];
            [self resetScrollPositionForTyping:(next.frame.origin.y < currentTextField.frame.origin.y)];
        }
    }
    [firstResponder resignFirstResponder];
}
#pragma mark - Keyboard Handling
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGRect keyBoard = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    // Set Keyboard Frame Value
    self.kbRect = keyBoard;
    //Reset Scroll Position
    [self resetScrollPositionForTyping:NO];
}
- (void)resetScrollPositionForTyping:(BOOL)scrollToTop {
    self.kbRect = [self.view convertRect:self.kbRect toView:nil];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, self.kbRect.size.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    int toolBarHeight = 44;
    int bufferHeight = 2;
    CGRect aRect = self.view.frame;
    aRect.size.height -= self.kbRect.size.height;
    aRect.size.height -= toolBarHeight;
    CGPoint fieldOrigin = activeField.frame.origin;
    fieldOrigin.y -= scrollView.contentOffset.y;
    fieldOrigin = [self.view convertPoint:fieldOrigin toView:self.view.superview];
    originalOffset = scrollView.contentOffset;
    CGRect newFrame = activeField.frame;
    newFrame.origin.y += toolBarHeight + bufferHeight;
    if (!CGRectContainsPoint(aRect, fieldOrigin) ) {
        if(scrollToTop)
            [self.scrollView setContentOffset:CGPointZero animated:YES];
        else
            [scrollView scrollRectToVisible:newFrame animated:YES];
    }
}
- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    [scrollView setContentOffset:originalOffset animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.originalOffset = self.scrollView.contentOffset;
}
-(void)back{
    self.navigationItem.leftBarButtonItem.enabled = NO;
    [super.navigationController popViewControllerAnimated:YES];
}
@end
