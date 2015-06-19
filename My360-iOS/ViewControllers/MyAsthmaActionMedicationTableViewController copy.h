//
//  AsthmaActionMedicationTableViewController.h
//  My360-iOS
//
//  Created by Savio Vaz on 10/23/14.
//
//

#import "BaseTableViewController.h"
#import <UIKit/UIKit.h>
#import "MyAsthmaActionPlanFormViewController.h"
#import <APSDk/PatientAsthmaActionMedication+Remote.h>
#import <APSDk/PatientAsthmaActionMedication.h>
#import "AsthmaActionMedicationTableViewCell.h"
@interface MyAsthmaActionMedicationTableViewController : BaseTableViewController


@property (strong, nonatomic) PatientAsthmaActionMedication *currentAsthmaMedicationObject;

@property (nonatomic,strong) NSNumber *myActionPlanID;
@property (nonatomic) BOOL editMode;
@property (nonatomic, assign) bool reloadDataOnLoad;
@property (nonatomic, strong) PatientAsthma *myPatientAsthmaObject;
@property(nonatomic, strong) PatientAsthmaActionMedication *PatientAsthmaActionMedicationObject;

// Meds
@property (nonatomic, strong) PatientAsthmaActionMedication *myPatientAsthmaMedicationObject;

// Stores all inserted/modified/deleted objects
@property  (nonatomic, strong) NSMutableArray *allPatientAsthmaMedicationObject ;

@property  (nonatomic, strong) NSString *medicationType ;



@end




