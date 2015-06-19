//
//  ChartsListViewController.m
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//

#import "ChartsListViewController.h"
#import "ChartViewController.h"
#import "MissedTreatmentsData.h"
#import "MissedTreatmentsReasonData.h"
#import "ShinobiChart+APCharts.h"
#import "MoodData.h"
#import "PainRatingData.h"
#import "ExacerbationReasonsData.h"
#import "ChartDateListViewController.h"

#import "AllergensTodayData.h"
#import "PeakFlowData.h"
#import "InhalerData.h"
#import "ShortnessBreathData.h"
#import "AsthmaData.h"
#import "CognitiveDifficultyData.h"
#import "DifficultyEverydayActivityData.h"



@interface ChartsListViewController ()

@end

@implementation ChartsListViewController

@synthesize patientTreatment;

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if(indexPath) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Treatment Adherence"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_TREATMENT_ADHERENCE];
        [((ChartDateListViewController *)segue.destinationViewController) setPatientTreatment:[self patientTreatment]];
        
    }
    else if ([segue.identifier isEqualToString:@"ShowMoodChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_JOURNAL_MOOD];
        
    }
    else if ([segue.identifier isEqualToString:@"MissingDoseReason"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_MISSING_DOSE_REASON];
        [((ChartDateListViewController *)segue.destinationViewController) setPatientTreatment:[self patientTreatment]];        
    }
    else if ([segue.identifier isEqualToString:@"ShowExacerbationsChart"]) {
       [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_EXACERBATION_REASON];
        [((ChartDateListViewController *)segue.destinationViewController) setPatientTreatment:self.patientTreatment];
    }
    else if ([segue.identifier isEqualToString:@"ShowRatingsChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_DAY_RATINGS];
    }
//----------------- Pain Rating -rvera ------------
    else if ([segue.identifier isEqualToString:@"ShowPainRatingsChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_PAIN_RATINGS];
    }

//--------------------------------------------------------------------------------
//------------ Added for Asthma 4 new charts - rvera 7-21-14 ----------

//------#1-----------------------------------------------------------------------
    else if ([segue.identifier isEqualToString:@"ShowAllergensChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_ALLERGENS_RATINGS];
    }

//-----#2-----------------------
    else if ([segue.identifier isEqualToString:@"ShowPeakFlowChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_PEAK_FLOW_RATINGS];
    }
    
//-----#3-----------------------
    else if ([segue.identifier isEqualToString:@"ShowShortnessBreathChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_SHORTNESS_BREATH_RATINGS];
    }

//------#4-----------------------
    else if ([segue.identifier isEqualToString:@"ShowInhalerChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_INHALER_RATINGS];
    }

//----- End ------------------
    else if ([segue.identifier isEqualToString:@"ShowDaysWithSymptoms"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_DAYS_WITH_SYMPTOMS];
    }
    else if ([segue.identifier isEqualToString:@"ShowDisabilityChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_DISABILITY];
    }
    else if ([segue.identifier isEqualToString:@"ShowSideEffectChart"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_SIDE_EFFECT];
    }
    else if ([segue.identifier isEqualToString:@"TreatmentPicker_Adherence"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_TREATMENT_ADHERENCE];
    }
    else if ([segue.identifier isEqualToString:@"TreatmentPicker_MissingDose"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_MISSING_DOSE_REASON];
    }
    
  //        Added for diabetes    - svaz 6/25/14
    else if ([segue.identifier isEqualToString:@"Blood_Sugar"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_BLOOD_SUGAR];
    }

    else if ([segue.identifier isEqualToString:@"Insulin_Dose"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_INSULIN_DOSE];
    }
    //Added for AsthmaSpirometry
    
    else if ([segue.identifier isEqualToString:@"CHART_FEF"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_FEF];
    }

    else if ([segue.identifier isEqualToString:@"CHART_FVC"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_FVC];
    }

    else if ([segue.identifier isEqualToString:@"CHART_FEV"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_FEV];
    }

    else if ([segue.identifier isEqualToString:@"CHART_FEV_FVC"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_FEV_FVC];
    }

    else if ([segue.identifier isEqualToString:@"CHART_FEV_PERCENTAGE"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_FEV_PERCENTAGE];
    }

    else if ([segue.identifier isEqualToString:@"CHART_FVC_PERCENTAGE"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_FVC_PERCENTAGE];
    }
   // ----------Dyskinesia Charts  --rvera 10/23/14 -----------
    else if ([segue.identifier isEqualToString:@"CHART_DYSKINESIA_TODAY"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_DYSKINESIA_TODAY];
    }
    else if ([segue.identifier isEqualToString:@"CHART_DYSKINESIA_RATING"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_DYSKINESIA_RATING];
    }
    else if ([segue.identifier isEqualToString:@"CHART_DYSKINESIA_PERCENTAGE"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:CHART_DYSKINESIA_PERCENTAGE];
    }
    // ---------- Added for BC app  rvera 11/20/14----------
    else if ([segue.identifier isEqualToString:@"COGNITIVE_DIFFICULTY"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:COGNITIVE_DIFFICULTY];
    }
    else if ([segue.identifier isEqualToString:@"DIFFICULTY_EVERYDAY_ACTIVITY"]) {
        [((ChartDateListViewController *)segue.destinationViewController) setChartId:DIFFICULTY_EVERYDAY_ACTIVITY];
    }
 
    
    
}

@end
