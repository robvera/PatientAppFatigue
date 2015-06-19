//
//  ChartsListViewController.h
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//

#import "BaseFormViewController.h"
#import <APSDK/PatientTreatment.h>

#define CHART_TREATMENT_ADHERENCE 1
#define CHART_JOURNAL_MOOD 2
#define CHART_MISSING_DOSE_REASON 3
#define CHART_EXACERBATION_REASON 4
#define CHART_DAY_RATINGS 5
#define CHART_DAYS_WITH_SYMPTOMS 6
#define CHART_DISABILITY 7
#define CHART_SIDE_EFFECT 8
#define CHART_PAIN_RATINGS 9
#define CHART_ALLERGENS_RATINGS 10
#define CHART_PEAK_FLOW_RATINGS 11
#define CHART_SHORTNESS_BREATH_RATINGS 12
#define CHART_INHALER_RATINGS 13
//  Added for diabetes per request dated 6/25/14 -svaz
#define CHART_BLOOD_SUGAR 14
#define CHART_INSULIN_DOSE 15

//Added for AsthmaSpirometry
#define CHART_FEF 20
#define CHART_FVC 21
#define CHART_FEV 22
#define CHART_FEV_FVC 23
#define CHART_FEV_PERCENTAGE 24
#define CHART_FVC_PERCENTAGE 25

#define CHART_DYSKINESIA_TODAY 26
#define CHART_DYSKINESIA_RATING 27
#define CHART_DYSKINESIA_PERCENTAGE 28

#define COGNITIVE_DIFFICULTY 30
#define DIFFICULTY_EVERYDAY_ACTIVITY 40

// Message for Roberto - !!!!! from svaz
//For the next set of charts start with 30, then 40 etc


@interface ChartsListViewController : BaseFormViewController{
    
}
@property (nonatomic) PatientTreatment *patientTreatment;
@end
