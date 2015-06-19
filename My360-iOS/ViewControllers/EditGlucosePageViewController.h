//
//  EditGlucosePageViewController.h
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/26/13.
//
//

#import "BaseFormViewController.h"
#import <APSDK/PatientGlucose.h>

@interface EditGlucosePageViewController : BaseFormViewController


@property (strong, nonatomic) PatientGlucose *defaultPatientGlucose;

@property (nonatomic, strong) PatientGlucose * patientGlucose;
@property (nonatomic, strong) NSArray *glucoseLevelData;
@property (nonatomic, strong) NSArray *timeFrameData;

@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIPickerView *glucoseLevelPicker;
@property (strong, nonatomic) UIPickerView *timeFramePicker;


@property (nonatomic, weak) IBOutlet UITextField * dateTextField;
@property (nonatomic, weak) IBOutlet UITextField * timeFrameTextField;
@property (nonatomic, weak) IBOutlet UITextField * glucoseMeasurementTextField;
@property (nonatomic, weak) IBOutlet UITextField * glucoseLevelTextField;
@property (nonatomic, weak) IBOutlet UITextField * insulinAmountTextField;
@property (nonatomic, weak) IBOutlet UITextField * carbohydrateAmountTextField;
@property (nonatomic, weak) IBOutlet UITextView * noteTextView;

@end
