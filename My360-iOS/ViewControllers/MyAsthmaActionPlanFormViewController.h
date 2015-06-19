//
//  MyAsthmaActionPlanFormViewController.h
//  My360-iOS
//
//  Created by Savio Vaz on 10/9/14.
//
//

#import "BaseViewController.h"

#import <APSDk/PatientAsthma+Remote.h>
#import <APSDk/PatientAsthma.h>
#import "NSDate+APDateExtension.h"
#import  <APSDK/PatientAsthmaActionMedication+Remote.h>
@interface MyAsthmaActionPlanFormViewController : BaseViewController <UITextFieldDelegate, UITextFieldDelegate >
@property (weak, nonatomic) IBOutlet UIScrollView *LTScrollView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;


@property (weak, nonatomic) IBOutlet UIView *peakFlowView;

@property (weak, nonatomic) IBOutlet UIView *medicationsView;
@property (weak, nonatomic) IBOutlet UIView *triggersView;
 
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (nonatomic, strong) PatientAsthma *myPatientAsthmaObject;

@property (nonatomic,strong) NSNumber *myActionPlanID;
@property (nonatomic, strong) id  myAction;
@property (nonatomic) BOOL editMode;

@property (weak, nonatomic) IBOutlet UITextField *asthmaActionDate;
@property (nonatomic,strong) NSString *medicationType;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *asthmaSeverity;
@property (weak, nonatomic) IBOutlet UITextField *LTMedication;
@property (weak, nonatomic) IBOutlet UITextField *LTDose;
@property (weak, nonatomic) IBOutlet UITextField *LTFrequency;

@property (weak, nonatomic) IBOutlet UITextField *QRMedication;
@property (weak, nonatomic) IBOutlet UITextField *QRDose;
@property (weak, nonatomic) IBOutlet UITextField *QRFrequency;


@property (weak, nonatomic) IBOutlet UITextField *PEMedication;
@property (weak, nonatomic) IBOutlet UITextField *PEDose;
@property (weak, nonatomic) IBOutlet UITextField *PEFrequency;


//@property (weak, nonatomic) IBOutlet UISwitch *reminder2TakeMedicine;
//@property (weak, nonatomic) IBOutlet UISwitch *carryMedication;
//@property (weak, nonatomic) IBOutlet UISwitch *assistWithMedication;

//TRIGGER SWITCHES

@property (weak, nonatomic) IBOutlet UISwitch *tobaccoTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *pesticideTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *animalsTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *birdsTriggerSwitch;


@property (weak, nonatomic) IBOutlet UISwitch *dustTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cleansersTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *carexhaustTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *perfumeTriggerSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *moldTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cockroachTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *coldairTriggerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *exerciseTriggerSwitch;

@property (weak, nonatomic) IBOutlet UITextField *otherTrigger;

//PEAKFLOW

@property (weak, nonatomic) IBOutlet UITextField *personalBestPeakFlow;
@property (weak, nonatomic) IBOutlet UILabel *eightyPercentPeakFlow;
@property (weak, nonatomic) IBOutlet UILabel *fiftyPercentPeakFlow;


//SPECIAL INSTRUCTIONS

//Feel Good
@property (weak, nonatomic) IBOutlet UITextField *feelGoodMedication;
@property (weak, nonatomic) IBOutlet UITextField *feelGoodDose;
@property (weak, nonatomic) IBOutlet UITextField *feelGoodTrigger;

//Not feel good
@property (weak, nonatomic) IBOutlet UITextField *notFeelGoodSymptom;
@property (weak, nonatomic) IBOutlet UITextField *notFeelGoodmedication;


//Feel Awful

@property (weak, nonatomic) IBOutlet UITextField *feelAwfulMedication1;
@property (weak, nonatomic) IBOutlet UITextField *feelAwfulMedication2;
@property (weak, nonatomic) IBOutlet UITextField *feelAwfulCall;

@property (strong, nonatomic)NSNumber *yesNumber ;
@property (strong, nonatomic)NSNumber *noNumber ;

- (IBAction)loadMedicationView:(id)sender;


@end




