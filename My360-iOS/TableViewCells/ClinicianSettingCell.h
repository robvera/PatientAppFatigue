//
//  ClinicianSettingCell.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/22/13.
//
//

#import "ContentCell.h"
#import <APSDK/PatientClinician.h>

@interface ClinicianSettingCell : ContentCell <UIAlertViewDelegate>

@property (strong, nonatomic) PatientClinician *patientClinician;

@property (strong, nonatomic) UIButton *allowAccessButton;


-(void) configureWith:(PatientClinician *)clinician;

@end
