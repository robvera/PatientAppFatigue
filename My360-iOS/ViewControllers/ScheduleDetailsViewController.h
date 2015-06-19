//
//  ScheduleDetailsViewController.h
//  MSPatient
//
//  Created by David Benko on 4/1/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseFormViewController.h"
#import <APSDK/TreatmentSchedule.h>

@interface ScheduleDetailsViewController : BaseFormViewController

@property (strong, nonatomic) NSArray *treatmentScheduleData;
@property (strong, nonatomic) TreatmentSchedule *treatmentSchedule;
@property (strong, nonatomic) NSDate *currentScheduleDate;
@property (strong, nonatomic) NSDate *nextScheduleDate;

-(void)back;

@end
