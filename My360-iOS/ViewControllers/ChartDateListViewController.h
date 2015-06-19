//
//  ChartDateListViewController.h
//  MSPatient
//
//  Created by David Benko on 4/12/13.
//
//

#import "BaseFormViewController.h"
#import "ChartsListViewController.h"
#import <APSDK/PatientTreatment.h>

@interface ChartDateListViewController : BaseFormViewController
@property (nonatomic) PatientTreatment *patientTreatment;
@property (nonatomic, assign) int chartId;

@end
