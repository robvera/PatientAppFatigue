//
//  APFilterPopup.h
//  MSPatient
//
//  Created by David Benko on 5/23/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseFormViewController.h"
#import "AdherenceListViewController.h"

#define ALL_ADHERENCE_TAKEN_STATUS 0
#define TAKEN_ADHERENCE_TAKEN_STATUS 1
#define MISSED_ADHERENCE_TAKEN_STATUS 2


@interface APFilterPopup : UIView <UITextFieldDelegate>
@property (nonatomic, strong)UIView *popup;
@property (nonatomic, strong)UITextField *startDate;
@property (nonatomic, strong)UITextField *endDate;

@property (nonatomic) CGPoint originalOffset;
@property (nonatomic) CGRect kbRect;
@property (nonatomic) UIView *activeField;
@property (strong, nonatomic) UIToolbar *inputToolbar;
@property (nonatomic, strong, readonly) UIToolbar * inputAccessoryViewToolbar;
@property (nonatomic, strong, readonly) UIBarButtonItem * doneBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;
@property (nonatomic, strong, readonly) UIDatePicker * inputViewDatePicker;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) AdherenceListViewController *list;
@property (nonatomic, strong) UIButton *filterButton;
@property (nonatomic, strong) UIButton *clearButton;
@property (nonatomic, strong) UISegmentedControl *takenFilter;



-(void)dismissView;
- (NSDateFormatter *)dateFormatterWithTimeZone:(NSTimeZone *)timeZone;
- (UIDatePicker *)inputViewDatePickerWithTimeZone:(NSTimeZone *)timeZone;
- (IBAction)inputViewDatePickerValueChanged:(UIDatePicker *)datePicker;

@end
