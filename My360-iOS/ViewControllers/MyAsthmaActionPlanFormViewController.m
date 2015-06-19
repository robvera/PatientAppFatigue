//
//  MyAsthmaActionPlanFormViewController.m
//  My360-iOS
//
//  Created by Savio Vaz on 10/9/14.
//   From : https://github.com/u10int/URBSegmentedControl
//

#import "MyAsthmaActionPlanFormViewController.h"
#import "UIViewController+UI.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/AuthManager.h>
#import "BaseFormViewController.h"
#import <APSDK/User.h>
#import "ConfigurationManager.h"
#import "URBSegmentedControl.h"
#import "UIColor+APColorExtension.h"
#import "MyAsthmaActionMedicationTableViewController.h"
#import "PIKCommon.h"
#import <Quartzcore/Quartzcore.h>

@interface MyAsthmaActionPlanFormViewController ()<UIPickerViewDelegate, UIPickerViewDataSource >

@property (strong, nonatomic) URBSegmentedControl *asthmaSeveritySegmentControl ;
@end

@implementation MyAsthmaActionPlanFormViewController
NSInteger flashCount;
NSTimer *flashTimer;
UIColor * saveBarButtonOriginalColor;
@synthesize myPatientAsthmaObject;

#pragma mark - PRIVATE
- (void)createUISegmentControl{
    // For more information on this segment control visit below
    //   From : https://github.com/u10int/URBSegmentedControl
    
    // use UIAppearance to set styles on control
	[[URBSegmentedControl appearance] setSegmentBackgroundColor:[UIColor greenColor]];
	
	
	// items to be used for each segment (same as UISegmentControl) for all instances
    NSArray *titles = [NSArray arrayWithObjects:[@"Mild Intermediate" uppercaseString], [@"Mild Persistent" uppercaseString], [@"Moderate Persistent" uppercaseString], [@"Severe Persistent" uppercaseString] , nil];
    
    self.asthmaSeveritySegmentControl = [[URBSegmentedControl alloc] initWithTitles:titles];
    [self.asthmaSeveritySegmentControl addTarget:self action:@selector(handleSelection:) forControlEvents:UIControlEventValueChanged];
	self.asthmaSeveritySegmentControl.frame = CGRectMake(60 , 100 , 220.0, 160.0);
	self.asthmaSeveritySegmentControl.layoutOrientation = URBSegmentedControlOrientationVertical;
	self.asthmaSeveritySegmentControl.imageEdgeInsets = UIEdgeInsetsMake(6.0, 6.0, 6.0, 6.0);
	[self.scrollView addSubview:self.asthmaSeveritySegmentControl];
    [self.asthmaSeveritySegmentControl setBaseColor: [UIColor navBarBlue]];
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)handleSelection:(id)sender {
    
    [sender setSegmentBackgroundColor:[self getSegmentColor:[sender selectedSegmentIndex]]];
}

#pragma mark - SAVING !!!
- (void) saveHighlighter{
    
    self.saveBarButton.tintColor = [UIColor redColor];
    self.saveBarButton.title = @"Saved!";
    flashCount++;
    if (flashCount > 7) {
        [flashTimer invalidate];
        self.saveBarButton.tintColor =saveBarButtonOriginalColor;
        self.saveBarButton.title = @"Save";
        flashCount = 0;
    }
}

- (IBAction)savePressed:(id)sender
{
    [self pushBusyOperation];
//    NSLog(@"tobaccoTriggerSwitch for %hhd", self.tobaccoTriggerSwitch.isOn);
    NSLog(@"savePressed for %@",  self.myActionPlanID);
    
    [self setPatientAsthmaObject2Save];
    
    if (self.editMode) {
        
        //UPDATE ROW
        
        NSError *err = nil;
        [self.myPatientAsthmaObject update:&err];
        
        if(err){
            if(ERROR_CODE_401(err)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else {
                
                [self showMessage:@"Asthma Action record failed to save."];
            }
            //return  ;
        }
        else {
            NSLog(@"Update successful ***********");
            self.myActionPlanID =self.myPatientAsthmaObject.id;
            flashTimer = [NSTimer scheduledTimerWithTimeInterval:0.90
                                                          target:self
                                                        selector:@selector(saveHighlighter)
                                                        userInfo:nil
                                                         repeats:YES];
            
        }
        [self popBusyOperation];
        
    }else{
        //INSERT ROW
        //        somethingChanged
        NSError *err;
        
        [self.myPatientAsthmaObject create:&err];
        if (err) {
            if(ERROR_CODE_401(err)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else {
                [self popBusyOperation];
                [self showMessage:@"Asthma Medication record failed to add."];
                
            }
        } else {
            
            NSLog(@"self.myPatientAsthmaObject = %@ ID === %@",self.myPatientAsthmaObject.asthmaActionDate,self.myPatientAsthmaObject.id );
            
            // set id for next VC
            self.myActionPlanID =self.myPatientAsthmaObject.id;
            self.editMode = YES;  // now vc is in Edit mode
            
            flashTimer = [NSTimer scheduledTimerWithTimeInterval:0.40
                                                          target:self
                                                        selector:@selector(saveHighlighter)
                                                        userInfo:nil
                                                         repeats:YES];
            
            
        }
        
        [self popBusyOperation];
        
        
        
        
        
        /// ***********  SVAZ works below but need synch not asynch
        
        //        [self.myPatientAsthmaObject  createAsync:^(id obj, NSError * error) {
        //            if (error) {
        //                [self popBusyOperation];
        //                if(ERROR_CODE_401(error)) {
        //                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        //                    [app showSessionTerminatedAlert];
        //                }
        //                else [self showMessage:@"Lab result/test record failed to add."];
        //            } else {
        //                //                [self popBusyOperation];
        //                //[_self showMessage:@"Alerts record successfully saved."];
        //                NSLog(@"createAsync New Success  %@", obj  );
        //                //                [self dismissViewControllerAnimated:YES completion:nil];
        //                [self.navigationController popViewControllerAnimated:YES];
        //
        //
        //            }
        //        }];
        
        
    }
    
    
    
    
    [self popBusyOperation];
    
}


- (void) setPatientAsthmaObject2Save{
    
    if ([self.asthmaActionDate.text isEqualToString:@""]) {
        [self showMessage:@"Please enter a valid date"];
        return;
    }
    
    
    NSDateFormatter *df = [self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    [self.myPatientAsthmaObject setAsthmaActionDate: [df   dateFromString:self.asthmaActionDate.text]];
    
    self.myPatientAsthmaObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
    self.myPatientAsthmaObject.appId = [[ConfigurationManager sharedManager] appID]  ;
    
    [self.myPatientAsthmaObject setPostedDate: [NSDate date]];
    
    // set   AsthmaSeverity
    [self.myPatientAsthmaObject setAsthmaSeverity:[NSNumber numberWithInt:self.asthmaSeveritySegmentControl.selectedSegmentIndex ]];
    
    //Set LT Data
    [self.myPatientAsthmaObject setLongTermMedication: self.LTMedication.text  ];
    [self.myPatientAsthmaObject setLongTermDose: self.LTDose.text  ];
    [self.myPatientAsthmaObject setLongTermFrequency:self.LTFrequency.text  ];
    
    //Set Quick Relief
    [self.myPatientAsthmaObject setQuickMedication: self.QRMedication.text  ];
    [self.myPatientAsthmaObject setQuickDose: self.QRDose.text  ];
    [self.myPatientAsthmaObject setQuickFrequency: self.QRFrequency.text  ];
    
    //Set PE
    [self.myPatientAsthmaObject setPeMedication:self.PEMedication.text  ];
    [self.myPatientAsthmaObject setPeDose: self.PEDose.text  ];
    [self.myPatientAsthmaObject setPeFrequency: self.PEFrequency.text  ];
    
    //    [self.myPatientAsthmaObject setReminderToTakeMedicine:(self.reminder2TakeMedicine.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0])];
    //
    //
    //    [self.myPatientAsthmaObject setCarrymedication:(self.reminder2TakeMedicine.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0])];
    //
    //    [self.myPatientAsthmaObject setAssistwithmedication:(self.reminder2TakeMedicine.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0])];
    
    //TRIGGER SWITCHES
    
    
    NSNumber *isOn  = (self.tobaccoTriggerSwitch.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0]);
    [self.myPatientAsthmaObject setTriggerTobacco:isOn];
    
    isOn  = (self.pesticideTriggerSwitch.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0]);
    [self.myPatientAsthmaObject setTriggerPesticide:isOn];
    [self.myPatientAsthmaObject setTriggerAnimals:(self.pesticideTriggerSwitch.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0])];
    [self.myPatientAsthmaObject setTriggerAnimals:self.animalsTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerBirds:self.birdsTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    
    
    [self.myPatientAsthmaObject setTriggerDust:self.dustTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerCleansers:self.cleansersTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerCarExhaust:self.carexhaustTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerPerfume:self.perfumeTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    
    
    [self.myPatientAsthmaObject setTriggerMold:self.moldTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerCockroach:self.cockroachTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerColdair:self.coldairTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    [self.myPatientAsthmaObject setTriggerExcercise:self.exerciseTriggerSwitch.on ? self.yesNumber  : self.noNumber];
    
    [self.myPatientAsthmaObject setTriggerOther: self.otherTrigger.text  ];
    
    //    //PEAKFLOW
    [self.myPatientAsthmaObject setPeakFlowPersonalBest:[NSNumber numberWithInt:[self.personalBestPeakFlow.text intValue]]];
    
    //Feel Good
    [self.myPatientAsthmaObject setInstructionsFeelGoodMedication: self.feelGoodMedication.text  ];
    [self.myPatientAsthmaObject setInstructionsFeelGoodDose: self.feelGoodDose.text  ];
    [self.myPatientAsthmaObject setInstructionsFeelGoodTrigger: self.feelGoodTrigger.text  ];
    
    //    //Not feel good
    [self.myPatientAsthmaObject setInstructionsNotFeelGoodMedication: self.notFeelGoodmedication.text  ];
    [self.myPatientAsthmaObject setInstructionsNotFeelGoodSymptom: self.notFeelGoodSymptom.text  ];
    
    //Feel Awful
    [self.myPatientAsthmaObject setInstructionsAwfulMedicationOne: self.feelAwfulMedication1.text  ];
    [self.myPatientAsthmaObject setInstructionsAwfulMedicationTwo: self.feelAwfulMedication2.text  ];
    
}

- (void)inputViewDatePickerValueChanged{
    NSDateFormatter *dateFormatter = [self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSString *strDate = [dateFormatter stringFromDate:self.inputViewDatePicker.date];
    self.asthmaActionDate.text = strDate;
    [self.asthmaActionDate resignFirstResponder];
    
}

#pragma mark - VC Methods
- (void) viewWillAppear:(BOOL)animated{
    self.asthmaSeveritySegmentControl.selectedSegmentIndex =  [self.myPatientAsthmaObject.asthmaSeverity integerValue];
    
    [self.asthmaSeveritySegmentControl setSegmentBackgroundColor:[self getSegmentColor:[self.myPatientAsthmaObject.asthmaSeverity integerValue]]];
    
}

- (void)viewDidLoad
{
    NSLog(@"***KEY= %@ Form", self.myActionPlanID);
    [super viewDidLoad];
    PIKCommon *c =  [PIKCommon sharedInstance];
    
    [c popLayerMessageWithInterval:self.view message:@"Call 9-1-1 if you have trouble walking or talking due to shortness of breath or if your lips and/or fingernails are gray or blue." NSTimeInterval:7.0];
    
    self.yesNumber = [NSNumber numberWithInt:1];
    self.noNumber = [NSNumber numberWithInt:0];
    saveBarButtonOriginalColor = self.saveBarButton.tintColor;
    
    //    [flashTimer invalidate];
    
    
    //    self.peakFlowView.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithRed:0.9 green:0.0 blue:0.0 alpha:1]);
    //    self.peakFlowView.layer.borderWidth = 2.0f;
    //    self.medicationsView.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithRed:0.9 green:0.0 blue:0.0 alpha:1]);
    //    self.medicationsView.layer.borderWidth = 2.0f;
    //
    
    
    CGFloat borderWidth = 2.0f;
    
    self.peakFlowView.frame = CGRectInset(self.peakFlowView.frame, -borderWidth, -borderWidth);
    self.peakFlowView.layer.borderColor = [UIColor blackColor].CGColor;
    self.peakFlowView.layer.borderWidth = borderWidth;
    
    self.medicationsView.frame = CGRectInset(self.medicationsView.frame, -borderWidth, -borderWidth);
    self.medicationsView.layer.borderColor = [UIColor blackColor].CGColor;
    self.medicationsView.layer.borderWidth = borderWidth;
    
    self.triggersView.frame = CGRectInset(self.triggersView.frame, -borderWidth, -borderWidth);
    self.triggersView.layer.borderColor = [UIColor blackColor].CGColor;
    self.triggersView.layer.borderWidth = borderWidth;
    
    self.greenView.frame = CGRectInset(self.greenView.frame, -borderWidth, -borderWidth);
    self.greenView.layer.borderColor = [UIColor greenColor].CGColor;
    self.greenView.layer.borderWidth = borderWidth;
    
    self.yellowView.frame = CGRectInset(self.yellowView.frame, -borderWidth, -borderWidth);
    self.yellowView.layer.borderColor = [UIColor yellowColor].CGColor;
    self.yellowView.layer.borderWidth = borderWidth;
    
    self.redView.frame = CGRectInset(self.redView.frame, -borderWidth, -borderWidth);
    self.redView.layer.borderColor = [UIColor redColor].CGColor;
    self.redView.layer.borderWidth = borderWidth;
    
    //uiscroll resign
    UITapGestureRecognizer *tapScroll = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapScroll.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapScroll];
    
    //Set up fields
    self.inputViewDatePicker.datePickerMode = UIDatePickerModeDate;
    self.asthmaActionDate.tag = kFormViewControllerFieldDate;
    self.asthmaActionDate.inputView = self.inputViewDatePicker;
    
    self.LTMedication.inputAccessoryView = self.inputToolbar;
    self.LTMedication.returnKeyType = UIReturnKeyNext;
    self.LTDose.inputAccessoryView = self.inputToolbar;
    self.LTDose.returnKeyType = UIReturnKeyNext;
    self.LTFrequency.inputAccessoryView = self.inputToolbar;
    self.LTFrequency.returnKeyType = UIReturnKeyNext;
    
    self.QRMedication.inputAccessoryView = self.inputToolbar;
    self.QRMedication.returnKeyType = UIReturnKeyNext;
    self.QRDose.inputAccessoryView = self.inputToolbar;
    self.QRDose.returnKeyType = UIReturnKeyNext;
    self.QRFrequency.inputAccessoryView = self.inputToolbar;
    self.QRFrequency.returnKeyType = UIReturnKeyNext;
    
    self.PEMedication.inputAccessoryView = self.inputToolbar;
    self.PEMedication.returnKeyType = UIReturnKeyNext;
    self.PEDose.inputAccessoryView = self.inputToolbar;
    self.PEDose.returnKeyType = UIReturnKeyNext;
    self.PEFrequency.inputAccessoryView = self.inputToolbar;
    self.PEFrequency.returnKeyType = UIReturnKeyNext;
    
    self.personalBestPeakFlow.tag = kFormViewControllerFieldNumber;
    self.personalBestPeakFlow.inputAccessoryView = self.inputToolbar;
    self.personalBestPeakFlow.returnKeyType = UIReturnKeyNext;
    
    self.otherTrigger.inputAccessoryView = self.inputToolbar;
    self.otherTrigger.returnKeyType = UIReturnKeyNext;
    
    self.feelGoodMedication.inputAccessoryView = self.inputToolbar;
    self.feelGoodMedication.returnKeyType = UIReturnKeyNext;
    self.feelGoodDose.inputAccessoryView = self.inputToolbar;
    self.feelGoodDose.returnKeyType = UIReturnKeyNext;
    self.feelGoodTrigger.inputAccessoryView = self.inputToolbar;
    self.feelGoodTrigger.returnKeyType = UIReturnKeyNext;
    
    self.notFeelGoodSymptom.inputAccessoryView = self.inputToolbar;
    self.notFeelGoodSymptom.returnKeyType = UIReturnKeyNext;
    self.notFeelGoodmedication.inputAccessoryView = self.inputToolbar;
    self.notFeelGoodmedication.returnKeyType = UIReturnKeyNext;
    
    self.feelAwfulMedication1.inputAccessoryView = self.inputToolbar;
    self.feelAwfulMedication1.returnKeyType = UIReturnKeyNext;
    self.feelAwfulMedication2.inputAccessoryView = self.inputToolbar;
    self.feelAwfulMedication2.returnKeyType = UIReturnKeyNext;
    self.feelAwfulCall.inputAccessoryView = self.inputToolbar;
    self.feelAwfulCall.returnKeyType = UIReturnKeyNext;
    
    if ([self.myActionPlanID isEqualToNumber:[NSNumber numberWithInt:0]]) {
        // NEW ROW
        [self resetForm];
        
    }else{
        //edit mode
        [self reloadVC];
        
    }
    [self createUISegmentControl];
}

-(void)back {
    //    [super back];
    NSLog(@"back");
    [self savePressed:nil];
}

// RETRIEVE DATA AND SET
- (void) reloadVC{
    
    [self pushBusyOperation];
    NSLog(@"reloadVC = %@", self.myPatientAsthmaObject);
    
    self.LTMedication.text = self.myPatientAsthmaObject.longTermMedication;
    NSString *dateString = [[self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]] stringFromDate:self.myPatientAsthmaObject.asthmaActionDate];
    self.asthmaActionDate.text = dateString;
    
    self.LTMedication.text = self.myPatientAsthmaObject.longTermMedication;
    self.LTDose.text = self.myPatientAsthmaObject.longTermDose;
    self.LTFrequency.text = self.myPatientAsthmaObject.longTermFrequency;
    
    self.QRMedication.text = self.myPatientAsthmaObject.quickMedication;
    self.QRDose.text = self.myPatientAsthmaObject.quickDose;
    self.QRFrequency.text = self.myPatientAsthmaObject.quickFrequency;
    
    self.PEMedication.text = self.myPatientAsthmaObject.peMedication;
    self.PEDose.text = self.myPatientAsthmaObject.peDose;
    self.PEFrequency.text = self.myPatientAsthmaObject.peFrequency;
    
    [self.tobaccoTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerTobacco intValue] == 0)  ? NO:YES];
    [self.pesticideTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerPesticide intValue] == 0)  ? NO:YES];
    
    [self.animalsTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerAnimals intValue] == 0)  ? NO:YES];
    
    //
    [self.birdsTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerBirds intValue] == 0)  ? NO:YES];
    [self.dustTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerDust intValue] == 0)  ? NO:YES];
    [self.cleansersTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerCleansers intValue] == 0)  ? NO:YES];
    
    [self.carexhaustTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerCarExhaust intValue] == 0)  ? NO:YES];
    [self.perfumeTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerPerfume intValue] == 0)  ? NO:YES];
    [self.moldTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerMold intValue] == 0)  ? NO:YES];
    
    //
    [self.exerciseTriggerSwitch setOn:([self.myPatientAsthmaObject.triggerExcercise intValue] == 0)  ? NO:YES];
    
    self.otherTrigger.text  = self.myPatientAsthmaObject.triggerOther;
    
    //Peak Flow
    self.personalBestPeakFlow.text = [self.myPatientAsthmaObject.peakFlowPersonalBest stringValue] ;
    [self calculatePeakFlow];
    
    //FEEL GOOD - GREEN
    self.feelGoodDose.text = self.myPatientAsthmaObject.instructionsFeelGoodDose;
    
    self.feelGoodMedication.text = self.myPatientAsthmaObject.instructionsFeelGoodMedication;
    
    self.feelGoodTrigger.text = self.myPatientAsthmaObject.instructionsFeelGoodTrigger;
    
    //Do not Feel Good - YELLOW
    self.notFeelGoodmedication.text = self.myPatientAsthmaObject.instructionsNotFeelGoodMedication;
    
    self.notFeelGoodSymptom.text = self.myPatientAsthmaObject.instructionsNotFeelGoodSymptom;
    
    // FEEL AWFUL - RED
    self.feelAwfulMedication1.text = self.myPatientAsthmaObject.instructionsAwfulMedicationOne;
    
    self.feelAwfulMedication2.text = self.myPatientAsthmaObject.instructionsAwfulMedicationTwo;
    
    self.feelAwfulCall.text = self.myPatientAsthmaObject.instructionsAwfulCall ;
    
    [self popBusyOperation];
}



- (UIColor *)getSegmentColor:(NSInteger)selectedSegment{
    
    UIColor *c ;
    switch (  selectedSegment   ) {
            
        case 0:
            //"Mild Intermediate":
            
            c = [UIColor yellowColor];
            break;
        case 1:
            //@"Mild Persistent":
            
            c = [UIColor orangeColor];
            break;
        case 2:
            //@"Moderate Persistent":
            
            c = [UIColor colorWithRed:0.89 green:0.4 blue:0.5 alpha:1.0];
            break;
        case 3:
            //@"Severe Persistent":
            
            c = [UIColor redColor];
            break;
            
            
        default:
            break;
    }
    return c;
    
}

- (void) resetForm{
    NSLog(@"resetForm");
    
    self.LTMedication.text=@"";
    [self.LTDose resignFirstResponder];
    [self.LTFrequency resignFirstResponder];
    
    [self.QRMedication resignFirstResponder];
    [self.QRDose resignFirstResponder];
    [self.QRFrequency resignFirstResponder];
    
    [self.PEMedication resignFirstResponder];
    [self.PEDose resignFirstResponder];
    [self.PEFrequency resignFirstResponder];
    
    
    
    //    [self.reminder2TakeMedicine resignFirstResponder];
    //    [self.carryMedication resignFirstResponder];
    //    [self.assistWithMedication resignFirstResponder];
    
    [self.tobaccoTriggerSwitch setOn:NO];
    [self.pesticideTriggerSwitch setOn:NO];
    
    [self.animalsTriggerSwitch setOn:NO];
    [self.birdsTriggerSwitch setOn:NO];
    [self.dustTriggerSwitch setOn:NO];
    [self.cleansersTriggerSwitch setOn:NO];
    [self.carexhaustTriggerSwitch setOn:NO];
    [self.perfumeTriggerSwitch setOn:NO];
    
    [self.moldTriggerSwitch setOn:NO];
    [self.cockroachTriggerSwitch setOn:NO];
    [self.coldairTriggerSwitch setOn:NO];
    [self.exerciseTriggerSwitch setOn:NO];
    [self.otherTrigger resignFirstResponder];
    
    [self.personalBestPeakFlow resignFirstResponder];
    [self.eightyPercentPeakFlow resignFirstResponder];
    [self.fiftyPercentPeakFlow resignFirstResponder];
    
    [self.feelGoodMedication resignFirstResponder];
    [self.feelGoodDose resignFirstResponder];
    [self.feelGoodTrigger resignFirstResponder];
    
    [self.notFeelGoodSymptom resignFirstResponder];
    [self.notFeelGoodmedication resignFirstResponder];
    
    [self.feelAwfulMedication1 resignFirstResponder];
    [self.feelAwfulMedication2 resignFirstResponder];
    [self.feelAwfulCall resignFirstResponder];
    
}

- (BOOL)isNumeric:(NSString*)inputString{
    BOOL isValid = NO;
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:inputString];
    isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
    return isValid;
}

- (void)calculatePeakFlow{
    NSString *peakFlow = self.personalBestPeakFlow.text;
    
    if (peakFlow.length != 0 && [self isNumeric:peakFlow] == YES ) {
        
        int pk = [peakFlow intValue];
        int eightyPercent = pk * 0.8;
        int fiftyPercent = pk * 0.5;
        self.eightyPercentPeakFlow.text = [@(eightyPercent) stringValue];
        self.fiftyPercentPeakFlow.text = [@(fiftyPercent) stringValue];
        
        
    }
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.personalBestPeakFlow) {
        //[self calculatePeakFlow];
        
        PIKCommon *c =  [PIKCommon sharedInstance];
        [c popLayerMessageWithInterval:self.view message:@"Please enter your personal best peak flow and the others will be calculated for you" NSTimeInterval:6.0];
        
    }
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField == self.personalBestPeakFlow) {
        if ([self isNumeric:textField.text] ==NO){
            [self showMessage:@"Please enter a valid date"];
            return;
        }
        
        [self calculatePeakFlow];
    }
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    //    self.activeField = textField;
    NSLog(@"textFieldShouldBeginEditing");
    if (textField == self.asthmaActionDate) {
        NSDateFormatter *dateFormatter = [self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        NSString *strDate = [dateFormatter stringFromDate:self.inputViewDatePicker.date];
        self.asthmaActionDate.text = strDate;
        
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //    [self navigateNextTextField];
    NSLog(@"textFieldShouldReturn");
    return NO;
}
- (IBAction)keyboardDonePressed:(id)sender
{
    NSLog(@"keyboardDonePressed");
    [self.LTMedication resignFirstResponder];
    [self.LTDose resignFirstResponder];
    [self.LTFrequency resignFirstResponder];
    
    [self.QRMedication resignFirstResponder];
    [self.QRDose resignFirstResponder];
    [self.QRFrequency resignFirstResponder];
    
    [self.PEMedication resignFirstResponder];
    [self.PEDose resignFirstResponder];
    [self.PEFrequency resignFirstResponder];
    
    
    
    //    [self.reminder2TakeMedicine resignFirstResponder];
    //    [self.carryMedication resignFirstResponder];
    //    [self.assistWithMedication resignFirstResponder];
    
    [self.tobaccoTriggerSwitch resignFirstResponder];
    [self.pesticideTriggerSwitch resignFirstResponder];
    
    [self.animalsTriggerSwitch resignFirstResponder];
    [self.birdsTriggerSwitch resignFirstResponder];
    [self.dustTriggerSwitch resignFirstResponder];
    [self.cleansersTriggerSwitch resignFirstResponder];
    [self.carexhaustTriggerSwitch resignFirstResponder];
    [self.perfumeTriggerSwitch resignFirstResponder];
    
    [self.moldTriggerSwitch resignFirstResponder];
    [self.cockroachTriggerSwitch resignFirstResponder];
    [self.coldairTriggerSwitch resignFirstResponder];
    [self.exerciseTriggerSwitch resignFirstResponder];
    [self.otherTrigger resignFirstResponder];
    
    [self.personalBestPeakFlow resignFirstResponder];
    [self.eightyPercentPeakFlow resignFirstResponder];
    [self.fiftyPercentPeakFlow resignFirstResponder];
    
    [self.feelGoodMedication resignFirstResponder];
    [self.feelGoodDose resignFirstResponder];
    [self.feelGoodTrigger resignFirstResponder];
    
    [self.notFeelGoodSymptom resignFirstResponder];
    [self.notFeelGoodmedication resignFirstResponder];
    
    [self.feelAwfulMedication1 resignFirstResponder];
    [self.feelAwfulMedication2 resignFirstResponder];
    [self.feelAwfulCall resignFirstResponder];
    
    
}
- (void) tapped {
    NSLog(@"tapped");
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PickerView delegate



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //    if (pickerView isEqual:self.asthmaActionDate ){
    //        MissingTreatmentReason *reason = [self.missingTreatmentReasonData objectAtIndex:row];
    //        self.asthmaActionDate.text = reason.name;
    //        [self setDataValues];
    
    
    //         [self.asthmaActionDate selectRow:row inComponent:0 animated:YES];
    //    }
    
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"Title";
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}

- (IBAction)loadMedicationView:(id)sender {
    NSLog(@"Sender.tag %ld",(long)[sender tag]);
    if ([sender tag] == 100) {
        
        self.medicationType = @"LT";
    }else if  ([sender tag] == 200) {
        
        self.medicationType = @"QR";
    }else if  ([sender tag] == 300) {
        
        self.medicationType = @"PE";
    }
    
    
    NSDateFormatter *df = [self dateFormatterWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *asDate =[df   dateFromString:self.asthmaActionDate.text];
    if (   asDate == nil  || !asDate ) {
        
        //        [self showMessage:@"Please enter a valid date"];
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter a valid date." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return ;
    }else{
        [self savePressed:nil];
        [self performSegueWithIdentifier:@"showMedicationSegue" sender:self];
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMedicationSegue"]) {
        // save before going to the Form or elsewhere
        MyAsthmaActionMedicationTableViewController *vc = [segue destinationViewController];
        
        if ([self.myActionPlanID isEqualToNumber: [NSNumber numberWithInt:0]]) {
            vc.editMode = NO;
        }else{
            vc.editMode = YES;
        }
        
        vc.myActionPlanID=self.myActionPlanID;
        vc.myPatientAsthmaObject =  self.myPatientAsthmaObject;
        vc.medicationType=   self.medicationType;
    }
}

@end
