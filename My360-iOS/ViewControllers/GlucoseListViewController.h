//
//  GlucoseListViewController.h
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/26/13.
//
//

#import <UIKit/UIKit.h>
#import <APSDK/PatientGlucose.h>
#import "BaseTableViewController.h"

@interface GlucoseListViewController : BaseTableViewController <UIGestureRecognizerDelegate, UITextFieldDelegate> {
}


@property (strong, nonatomic) NSDate *fromDate;
@property (strong, nonatomic) NSDate *toDate;
@property (strong, nonatomic) PatientGlucose *defaultPatientGlucose;

@property BOOL defaultPatientGlucoseSet;

@property (nonatomic, assign) bool reloadDataOnLoad;

@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@property (weak, nonatomic) IBOutlet UIView *filterView;
@property (weak, nonatomic) IBOutlet UIView *filterViewContentView;
@property (weak, nonatomic) IBOutlet UITextField *fromDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *toDateTextField;

@property (weak, nonatomic) IBOutlet UIButton *clearFilterButton;
@property (weak, nonatomic) IBOutlet UIButton *applyFilterButton;



@end
