//
//  EditAdherencePageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/5/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseFormViewController.h"
#import <APSDK/PatientTreatment.h>
#import <APSDK/TreatmentSchedule.h>
#import <APSDK/PatientAdherenceLog.h>
#import <APSDK/TreatmentSchedule.h>
#import <APSDK/MissingTreatmentReason.h>
#import "DCRoundSwitch.h"


@interface EditAdherencePageViewController : BaseFormViewController {
    
}


@property (nonatomic, strong) PatientAdherenceLog * patientAdherenceLog;

@property (weak, nonatomic) IBOutlet UITableViewCell *timesMissedCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *reasonMissedCell;

@property (strong, nonatomic) NSMutableArray *timesPerDayData;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *tookMedicationSwitch;
@property (strong, nonatomic) PatientTreatment *patientTreatment;
@property (strong, nonatomic) NSNumber *timesPerDay;
@property (strong, nonatomic) IBOutlet UILabel *timesPerDayLabel;
@property (strong, nonatomic) IBOutlet UITextField *timesPerDayField;
@property (strong, nonatomic) MissingTreatmentReason *missingTreatmentReason;
@property (strong, nonatomic) TreatmentSchedule *treatmentSchedule;

-(IBAction)saveTappedIB:(id)sender;
//- (IBAction)loadVC; // svaz for logs to Journals
@end
