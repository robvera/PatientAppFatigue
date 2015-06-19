//
//  BaseViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/26/13.
//
//

#import <UIKit/UIKit.h>

#define ERROR_CODE_401(error) [[error localizedDescription] isEqualToString:@"Unauthorized"] ? YES : NO

#define ASSET_BY_IOS_VERSION(filename) ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? [NSString stringWithFormat:@"%@_ios7.png",filename] : [NSString stringWithFormat:@"%@.png",filename]

@interface BaseViewController : UIViewController <UIScrollViewDelegate>

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

- (NSDateFormatter *)dateFormatterWithTimeZone:(NSTimeZone *)timeZone;
- (UIDatePicker *)inputViewDatePickerWithTimeZone:(NSTimeZone *)timeZone;
- (void)navigateNextTextField;
- (void)navigatePreviousTextField;
- (void)back;

@end
