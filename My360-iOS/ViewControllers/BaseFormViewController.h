//
//  BaseFormViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/28/13.
//
//

#import <UIKit/UIKit.h>

#define ERROR_CODE_401(error) [[error localizedDescription] isEqualToString:@"Unauthorized"] ? YES : NO

#define ASSET_BY_IOS_VERSION(filename) ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? [NSString stringWithFormat:@"%@_ios7.png",filename] : [NSString stringWithFormat:@"%@.png",filename]


@interface BaseFormViewController : UITableViewController  <UITextFieldDelegate>

@property (nonatomic, strong) NSArray * fields;
@property (nonatomic, assign, readonly) UITextField * firstResponder;
@property (nonatomic, strong, readonly) UIToolbar * inputAccessoryViewToolbar;
@property (nonatomic, strong, readonly) UIDatePicker * inputViewDatePicker;
@property (nonatomic, strong, readonly) UIBarButtonItem * doneBarButtonItem;
@property (nonatomic, strong, readonly) NSDateFormatter * dateFormatter;

@property BOOL somethingChanged;

@property BOOL editMode; //NO if user tapped New button - YES if user selected row in list


enum {
    kFormViewControllerFieldNone,
    kFormViewControllerFieldDate,
    kFormViewControllerFieldTime,
    kFormViewControllerFieldDateTime,
    kFormViewControllerFieldNumber,
    kFormViewControllerFieldDosage
};


- (IBAction)doneBarButtonItemTapped;
- (IBAction)closeButtonTapped:(id)sender;
- (IBAction)inputViewDatePickerValueChanged;
- (void)doneTapped:(UITextField *)textField;
- (NSDateFormatter *)configureDateFormatter:(NSDateFormatter *)formatter field:(UIView *)field;
- (NSDateFormatter *)dateFormatterWithTimeZone:(NSTimeZone *)timeZone;
- (UIDatePicker *)inputViewDatePickerWithTimeZone:(NSTimeZone *)timeZone;
- (void)back;
- (IBAction)buttonPressedMsg;

@end
