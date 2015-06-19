//
//  EditMedicationPageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/15/13.
//
//

#import "BaseFormViewController.h"
#import <APSDK/PatientTreatment.h>
#import <APSDK/TreatmentType.h>
#import <APSDK/DosageUom.h>
#import <APSDK/IngestionMethod.h>
#import <APSDK/TreatmentSchedule.h>
#import <APSDK/Medication.h>

@interface EditMedicationPageViewController : BaseFormViewController


@property (nonatomic, strong) PatientTreatment * patientTreatment;

@property (strong, nonatomic) NSArray *dosageData;
@property (strong, nonatomic) DosageUom *dosageUom;
@property (strong, nonatomic) NSNumber *dosage;
@property (strong, nonatomic) Medication *medication;
@property (strong, nonatomic) IngestionMethod *ingestionMethod;
@property (strong, nonatomic) TreatmentSchedule *treatmentSchedule;

@property (strong, nonatomic) NSDate *currentScheduleDate;
@property (strong, nonatomic) NSDate *nextScheduleDate;


@end
