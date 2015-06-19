//
//  APFilterPopup.m
//  MSPatient
//
//  Created by David Benko on 5/23/13.
//
//

#import "APFilterPopup.h"
#import <QuartzCore/QuartzCore.h>
#import "UITextField+APTextFieldExtensions.h"
#import "PikConstants.h"
#import "PasswordViewController.h"

@implementation APFilterPopup

@synthesize popup;
@synthesize startDate;
@synthesize endDate;

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
@synthesize list;
@synthesize filterButton;
@synthesize clearButton;
@synthesize takenFilter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        CGFloat width = screenWidth - 20;
        CGFloat height = 350;
        
        UIView *alphaLayer = [[UIView alloc]initWithFrame:self.bounds];
        alphaLayer.backgroundColor = [UIColor blackColor];
        alphaLayer.alpha = 0.7;
        
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(dismissView)];
        [alphaLayer addGestureRecognizer:singleFingerTap];
        
        [self addSubview:alphaLayer];
        
        self.popup = [[UIView alloc]initWithFrame:CGRectMake((screenWidth / 2) - (width / 2), (screenHeight / 2) - (height / 2), width, height)];
        popup.backgroundColor = [UIColor whiteColor];
        self.popup.layer.masksToBounds = NO;
        self.popup.layer.cornerRadius = 10;
        self.popup.layer.shadowOffset = CGSizeMake(5, -4);
        self.popup.layer.shadowRadius = 2;
        self.popup.layer.shadowOpacity = 0.2;
        [self addSubview:popup];
        
        [self.inputViewDatePicker addTarget:self action:@selector(inputViewDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        //UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        //[self.popup addGestureRecognizer:gestureRecognizer];
        
        self.takenFilter = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 10, self.popup.bounds.size.width - 20, 25)];
        //            -  MSAA cleanup svaz 11/27/14
//        This line below has no effect & depricated in 7.0
//        [self.takenFilter setSegmentedControlStyle:UISegmentedControlStyleBordered];
        //        end    -  MSAA cleanup svaz 11/27/14
        
        [self.takenFilter insertSegmentWithTitle:@"All" atIndex:ALL_ADHERENCE_TAKEN_STATUS animated:NO];
        [self.takenFilter insertSegmentWithTitle:@"Taken" atIndex:TAKEN_ADHERENCE_TAKEN_STATUS animated:NO];
        [self.takenFilter insertSegmentWithTitle:@"Missed" atIndex:MISSED_ADHERENCE_TAKEN_STATUS animated:NO];
        [self.takenFilter setSelectedSegmentIndex:0];
        
        self.filterButton = [[UIButton alloc]initWithFrame:CGRectMake((self.popup.frame.size.width / 2) - ((self.popup.frame.size.width - 10) / 2),self.popup.frame.size.height - 50,self.popup.frame.size.width / 2 - 10,40)];
        [self.filterButton setTitle:@"Apply Filter" forState:UIControlStateNormal];
        [self.filterButton setBackgroundImage:[UIImage imageNamed:@"ToolBar.png"] forState:UIControlStateNormal];
        self.filterButton.layer.cornerRadius = 10;
        self.filterButton.layer.masksToBounds = YES;
        [self.popup addSubview:filterButton];
        
        CGRect rect = filterButton.frame;
        rect.origin.x += rect.size.width + 10;
        
        self.clearButton = [[UIButton alloc]initWithFrame:rect];
        [self.clearButton setTitle:@"Clear Filter" forState:UIControlStateNormal];
        [self.clearButton setBackgroundImage:[UIImage imageNamed:@"ToolBar.png"] forState:UIControlStateNormal];
        self.clearButton.layer.cornerRadius = 10;
        clearButton.layer.masksToBounds = YES;
        [self.popup addSubview:self.clearButton];
        
        CGRect startDateFrame = CGRectMake(10, 50, self.popup.frame.size.width / 2 - 15, 30);
        CGRect endDateFrame = CGRectMake(startDateFrame.origin.x + startDateFrame.size.width + 10, 50, self.popup.frame.size.width / 2 - 15, 30);
        
        self.startDate = [[UITextField alloc]initWithFrame:startDateFrame];
        //startDate.delegate = fvc;
        self.startDate.placeholder = @"Start Date";
        //startDate.inputView = self.inputViewDatePicker;
        [self.startDate setBorderStyle:UITextBorderStyleBezel];
        self.endDate.inputAccessoryView = self.inputAccessoryViewToolbar;
        [self.popup addSubview:self.startDate];
        
        self.endDate = [[UITextField alloc]initWithFrame:endDateFrame];
        //endDate.delegate = fvc;
        //endDate.inputView = self.inputViewDatePicker;
        self.endDate.placeholder = @"End Date";
        self.endDate.inputAccessoryView = self.inputAccessoryViewToolbar;
        [self.endDate setBorderStyle:UITextBorderStyleBezel];
        [self.popup addSubview:self.endDate];
        
        self.startDate.delegate = self;//fvc;
        self.startDate.inputView = self.inputViewDatePicker;
        self.startDate.inputAccessoryView = self.inputAccessoryViewToolbar;
        self.endDate.delegate = self;//fvc;
        self.endDate.inputView = self.inputViewDatePicker;
        
        /*CGRect fvcFrame = CGRectMake(10, 100, 280, 100);
        [fvc.view setFrame:fvcFrame];
        [fvc.tableView setFrame:fvcFrame];
        [fp.popup addSubview:fvc.tableView];*/
        rect = self.popup.frame;
        rect.origin.x +=rect.size.width;
        rect.size.height = 22;
        rect.size.width = 22;
        rect.origin.y -= (rect.size.height / 2);
        rect.origin.x -=(rect.size.width / 2) + 5;
        
        UIButton *close = [[UIButton alloc]initWithFrame:rect];
        [close setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [close addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:close];
        
        [self.popup addSubview:self.takenFilter];
        
        [self createInputAccessoryView];
        
        [self dateFormatter];
        [self.dateFormatter setDateFormat:kDateFormat];

        
    }
    return self;
}

-(void)doneBarButtonItemTapped{
    [self hideKeyboard];
}

-(void)hideKeyboard {
    [self.startDate resignFirstResponder];
    [self.endDate resignFirstResponder];
}

-(void)dismissView{
    [self dismissViewAnimated:YES];
}
-(void)dismissViewAnimated:(BOOL)animated{
    if(animated){
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionLayoutSubviews
                         animations:^{
                             self.alpha = 0.0f;
                         }
                         completion:^(BOOL success){
                             self.hidden = YES;
                         }
         ];
    }
    else{
        //[self removeFromSuperview];
        self.hidden = YES;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Input Methods


- (IBAction)inputViewDatePickerValueChanged:(UIDatePicker *)datePicker
{
    UITextField * field =  ([self.startDate isFirstResponder]) ? self.startDate : self.endDate;
    NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:field];
    
    field.text = [formatter stringFromDate:datePicker.date];
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


- (UITextField *)firstResponder
{
    
    /*if ([self.startDate isFirstResponder]){
        return self.startDate;
    }
    else return self.endDate;*/
    
    return nil;
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

- (void) navigatePreviousTextField{
//            -  MSAA cleanup svaz 11/27/14
}

#pragma mark - UITextView Navigation
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.startDate || textField == self.endDate) {
        NSDateFormatter * formatter = [self configureDateFormatter:self.dateFormatter field:textField];
        if (textField.text.length > 0)  self.inputViewDatePicker.date = [formatter dateFromString:textField.text];
        else textField.text = [formatter stringFromDate:self.inputViewDatePicker.date];
       
    }
    return YES;
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
    self.kbRect = [self convertRect:self.kbRect toView:nil];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, self.kbRect.size.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    int toolBarHeight = 44;
    int bufferHeight = 2;
    CGRect aRect = self.frame;
    aRect.size.height -= self.kbRect.size.height;
    aRect.size.height -= toolBarHeight;
    CGPoint fieldOrigin = activeField.frame.origin;
    fieldOrigin.y -= scrollView.contentOffset.y;
    fieldOrigin = [self convertPoint:fieldOrigin toView:self.superview];
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

@end
