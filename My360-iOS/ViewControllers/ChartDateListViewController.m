//
//  ChartDateListViewController.m
//  MSPatient
//
//  Created by David Benko on 4/12/13.
//
//

#import "ChartDateListViewController.h"
#import "ChartViewController.h"
#import "MissedTreatmentsData.h"
#import "ShinobiChart+APCharts.h"
#import "MoodData.h"
#import "DisabilityData.h"
#import "SideEffectData.h"
#import "MissedTreatmentsReasonData.h"
#import "ExacerbationReasonsData.h"
#import "DaysWithSymptomsData.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import <APSDK/TreatmentType+Remote.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "ConfigurationManager.h"
#import "PikConstants.h"

#import "DayRatingData.h"
#import "PainRatingData.h"
#import "ShortnessBreathData.h"
#import "PeakFlowData.h"
#import "InhalerData.h"
#import "AllergensTodayData.h"
// added for diabetes = svaz 6/25/14
#import "BloodSugarData.h"
#import "InsulinDose.h"
//added for Asthma
#import "AsthmaData.h"
//added for PD charts --rvera 10/23/14
#import "DyskinesiaTodayData.h"
#import "DyskinesiaRatingData.h"
#import "DyskinesiaDayPercentageData.h"
//
#import "CognitiveDifficultyData.h"
#import "DifficultyEverydayActivityData.h"



@interface ChartDateListViewController ()

@end

@implementation ChartDateListViewController
@synthesize patientTreatment;
@synthesize chartId;

-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil  action:nil];
    
    UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[infoButton addTarget:self action:@selector(infoButtonAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	[self.navigationItem setRightBarButtonItem:modalButton animated:YES];
    //self.frame = CGRectMake(90.0, 90.0, 60.0, 60.0);
    
}

-(void)infoButtonAction {
    NSString *message = @"Last 7 Days\n---\nLast 7 days to date.\n\nLast 30 Days\n---\nLast 30 days to date.\n\nPrevious Three Months\n---\nLast three months excluding the current month.\n\nPrevious Six Months\n---\nLast six months excluding the current month.\n\nPrevious Twelve Months\n---\nLast twelve months excluding the current month.";
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Date Ranges"
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if(indexPath) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self pushBusyOperation];
    [((ChartViewController *)segue.destinationViewController) setHidesBottomBarWhenPushed:YES];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *end_date = [calendar dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    NSDate *start_date;
    NSString *startRangeText = @"";
    NSString *endRangeText = @"";
    
    if ([segue.identifier isEqualToString:@"One Week"]){
        [components setWeek:-1];
        startRangeText = @"(Last 7 Days)";
    }
    else if ([segue.identifier isEqualToString:@"One Month"]){
        [components setDay:-30];
        startRangeText = @"(Last 30 Days)";
    }
    else if ([segue.identifier isEqualToString:@"Three Month"]){
        [components setMonth:-3];
        startRangeText = @"(MMM yyyy -";
        endRangeText = @" MMM yyyy)";
    }
    else if ([segue.identifier isEqualToString:@"Six Month"]){
        [components setMonth:-6];
        startRangeText = @"(MMM yyyy -";
        endRangeText = @" MMM yyyy)";
    }
    else if ([segue.identifier isEqualToString:@"One Year"]){
        [components setYear:-1];
        startRangeText = @"(MMM yyyy -";
        endRangeText = @" MMM yyyy)";
    }
    start_date = [calendar dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    if ([segue.identifier isEqualToString:@"Three Month"] || [segue.identifier isEqualToString:@"Six Month"] || [segue.identifier isEqualToString:@"One Year"]) {
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *dateComponents = [gregorian components:( NSYearCalendarUnit |
                                                                  NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate:start_date];
        [dateComponents setDay:1];
        start_date = [gregorian dateFromComponents:dateComponents];
    }
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    if(!([segue.identifier isEqualToString:@"One Week"] ||[segue.identifier isEqualToString:@"One Month"])){
        components = nil;
        components = [calendar components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:start_date];
        [components setDay:1];
        start_date = [calendar dateFromComponents:components];
        components = nil;
        components = [calendar components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:end_date];
        components.day -= components.day;
        end_date = [calendar dateFromComponents:components];
        
        [df setDateFormat:startRangeText];
        startRangeText = [df stringFromDate:start_date];
        [df setDateFormat:endRangeText];
        endRangeText = [df stringFromDate:end_date];
    }
    
    if (self.chartId == CHART_TREATMENT_ADHERENCE) {
        
        NSString *title = [self.patientTreatment.medicationDenormalized length] > 0 ? self.patientTreatment.medicationDenormalized : self.patientTreatment.treatmentTypeDenormalized;
        title = [title stringByAppendingFormat:@" Adherence"];
        
        [((ChartViewController *)segue.destinationViewController) setChartTitle:title];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart scatterPlot];
        MissedTreatmentsData *data = [MissedTreatmentsData new];

        chart.yAxis.title = @"Missed Treatments";
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            [data setSortType:CHART_SORT_MONTH];
        }
        
        [data setPatientTreatmentId:self.patientTreatment.id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
    else if (self.chartId == CHART_JOURNAL_MOOD) {
        
        NSString *title = @"# of Days w/ Selected Mood";
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        [((ChartViewController *)segue.destinationViewController) setChartTitle:title];
        MoodData *data = [MoodData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:[ShinobiChart pieChart]];
        
    }
    else if (self.chartId == CHART_MISSING_DOSE_REASON) {
        
        NSString *title = @"Reasons For Missing ";
        title = [title stringByAppendingString:[self.patientTreatment.medicationDenormalized length] > 0 ? self.patientTreatment.medicationDenormalized : self.patientTreatment.treatmentTypeDenormalized];
        //title = [title stringByAppendingFormat:@" %@%@",startRangeText,endRangeText];
        [((ChartViewController *)segue.destinationViewController) setChartTitle:title];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        MissedTreatmentsReasonData *data = [MissedTreatmentsReasonData new];
        if ([segue.identifier isEqualToString:@"One Week"]){
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientTreatmentId:self.patientTreatment.id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        //NSLog(@"%@===", datasource);
        //navFrame = CGRectMake(90.0, 90.0, 60.0, 60.0);

        chart.yAxis.title = @"Days Missed";
        chart.xAxis.title = @"Reason For Missing Treatment";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
        //Set Scrolling
        CGRect frame = CGRectZero;
        frame.size = CGSizeMake([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
        CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
        frame.size.height -= navHeight;
        //frame.size.width -= 10;
        frame.size.width += 400;  //400- rvera
        //[((ChartViewController *)segue.destinationViewController) setChartSize:frame.size];
        
    }
    else if (self.chartId == CHART_EXACERBATION_REASON) {
        
        if ([[[ConfigurationManager sharedManager] appID] integerValue] == RA) {

                [((ChartViewController *)segue.destinationViewController) setChartTitle:@"My Flares Reasons"];
                [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
                ExacerbationReasonsData *data = [ExacerbationReasonsData new];
                [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
                [data setStartDate:start_date];
                [data setEndDate:end_date];
                [data generateData];
                [((ChartViewController *)segue.destinationViewController) setChartData:data];
                ShinobiChart *chart = [ShinobiChart barChart];
                chart.legend.hidden = YES;
                chart.yAxis.title = @"Number of Flares";
                chart.xAxis.title = @"Flares Type";
                [((ChartViewController *)segue.destinationViewController) setChart:chart];
        }
        else {
            [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Exacerbations"];
            [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
            ExacerbationReasonsData *data = [ExacerbationReasonsData new];
            [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
            [data setStartDate:start_date];
            [data setEndDate:end_date];
            [data generateData];
            [((ChartViewController *)segue.destinationViewController) setChartData:data];
            ShinobiChart *chart = [ShinobiChart barChart];
            chart.legend.hidden = YES;
            chart.yAxis.title = @"Number of Exacerbations";
            chart.xAxis.title = @"Exacerbation Type";
            [((ChartViewController *)segue.destinationViewController) setChart:chart];
            
        }
        
    }
    else if (self.chartId == CHART_DAY_RATINGS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Day Rating"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        DayRatingData *data = [DayRatingData new];
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Day Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Day Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Day Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Day Rating";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Day Rating";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
    //--------------------- RVera - added Pain Rating -------------------
    
    else if (self.chartId == CHART_PAIN_RATINGS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Pain Rating"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        PainRatingData *data = [PainRatingData new];
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Pain Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Pain Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Pain Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Pain Rating";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Pain Rating";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }

//---------------------
    
    else if (self.chartId == CHART_DAYS_WITH_SYMPTOMS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Days with & without Symptoms"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        DaysWithSymptomsData *data = [DaysWithSymptomsData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Days";
        chart.xAxis.title = @"";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
    else if (self.chartId == CHART_DISABILITY) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Disability Chart"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        DisabilityData *data = [DisabilityData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Days";
        chart.xAxis.title = @"Disability Level";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
    else if (self.chartId == CHART_SIDE_EFFECT) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Side Effects Chart"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        SideEffectData *data = [SideEffectData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Days";
        chart.xAxis.title = @"Side Effects";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }


    
    //        Added for diabetes    - svaz 6/25/14
    else if (self.chartId == CHART_BLOOD_SUGAR) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Blood Sugar Chart"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        
        
        BloodSugarData *data = [BloodSugarData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart lineChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Blood Sugar (mg/dL)";
        chart.xAxis.title = @"Time Event";
        [((ChartViewController *)segue.destinationViewController)  setShowMessage:@"YES" ];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }

    else if (self.chartId == CHART_INSULIN_DOSE) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Insulin Dose Chart"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        InsulinDose *data = [InsulinDose new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Number of Units";
        chart.xAxis.title = @"Date";
        [((ChartViewController *)segue.destinationViewController)  setShowMessage:@"YES" ];
         
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }

    
 

    //    ***END     Added for diabetes    - svaz 6/25/14
    
    //--------------------- Allergens Today Rating-------------------
    
    else if (self.chartId == CHART_ALLERGENS_RATINGS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Allergens Today Rating"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        AllergensTodayData *data = [AllergensTodayData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    //--------------------- END of Allergens Today Rating-------------------
    
    //--------------------- Peak Flow Rating ----------------------------------
    
    else if (self.chartId == CHART_PEAK_FLOW_RATINGS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Peak Flow Rate"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        PeakFlowData *data = [PeakFlowData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Rate (L/min)";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Average Rate (L/min)";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Rate (L/min)";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Rate (L/min)";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Rate (L/min)";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    //--------------------- END of Peak Flow------------------------------
    
    //--------------------- Inhaler Rating ---------------------------------------
    
    else if (self.chartId == CHART_INHALER_RATINGS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Number of Times Used Rescue Therapy"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        InhalerData *data = [InhalerData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    //--------------------- END of Inhaler ------------------------------
    
    //--------------------- Shortness of Breath Rating -------------------
    
    else if (self.chartId == CHART_SHORTNESS_BREATH_RATINGS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Number of Times Short of Breath"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        ShortnessBreathData *data = [ShortnessBreathData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    
    //--------------------- END of Shortness Of Breath ------------------------------

  //Added for AsthmaSpirometry
    else if (self.chartId == CHART_FEF || self.chartId == CHART_FEV || self.chartId == CHART_FVC ||
             self.chartId == CHART_FEV_FVC || self.chartId == CHART_FEV_PERCENTAGE || self.chartId == CHART_FVC_PERCENTAGE  ) {
        
        
        
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        AsthmaData *data = [AsthmaData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data setChartType:self.chartId];
        [data setAsthmaQuery:[data getQuery:self.chartId]];
        
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
//            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
//            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
//            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
//            chart.yAxis.title = @"Number of Times";
            [data setSortType:CHART_SORT_MONTH];
        }
        
     
        switch (self.chartId) {
            case CHART_FEF :
            case CHART_FEV:
            case CHART_FVC:
                
                
                if ([segue.identifier isEqualToString:@"One Week"]){
                    chart.yAxis.title = @"L";
                }else{
                    chart.yAxis.title = @"Average L";
                }
                
                
                break;
            case CHART_FEV_FVC:
            case CHART_FEV_PERCENTAGE:
            case CHART_FVC_PERCENTAGE:
                
                if ([segue.identifier isEqualToString:@"One Week"]){
                    chart.yAxis.title = @"%";
                }else{
                    chart.yAxis.title = @"Average %";
                }
                
                
                break;
            default:
                chart.yAxis.title = @"%";
                break;
        }
        
        
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartTitle:[data getChartTitle:self.chartId]];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    
    
   else if (self.chartId == CHART_DAYS_WITH_SYMPTOMS) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Days with & without Symptoms"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        DaysWithSymptomsData *data = [DaysWithSymptomsData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Days";
        chart.xAxis.title = @"";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
    else if (self.chartId == CHART_DISABILITY) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Disability Chart"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        DisabilityData *data = [DisabilityData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Days";
        chart.xAxis.title = @"Disability Level";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
    else if (self.chartId == CHART_SIDE_EFFECT) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Side Effects Chart"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        SideEffectData *data = [SideEffectData new];
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        ShinobiChart *chart = [ShinobiChart barChart];
        chart.legend.hidden = YES;
        chart.yAxis.title = @"Days";
        chart.xAxis.title = @"Side Effects";
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
        
    }
 
//end Asthma

    //--------------------- Dyskinesia Today Chart -------------------
    
    else if (self.chartId == CHART_DYSKINESIA_TODAY) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Days with Dyskinesia"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        DyskinesiaTodayData *data = [DyskinesiaTodayData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Number of Days";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Number of Days";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Number of Days";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Number of Days";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Number of Days";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    
    //--------------------- END of Dyskinesia Today Chart ------------------------------
    
    
    //--------------------- Dyskinesia Rating Chart -------------------
    
    else if (self.chartId == CHART_DYSKINESIA_RATING) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Rating of Dyskinesia Severity"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        DyskinesiaRatingData *data = [DyskinesiaRatingData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Severity Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Severity Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Average Severity Rating";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Severity Rating";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Average Severity Rating";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    
    //--------------------- END of Dyskinesia Rating ------------------------------
    
    
    //--------------------- Dyskinesia Day Percentage Chart-------------------
    
    else if (self.chartId == CHART_DYSKINESIA_PERCENTAGE) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Percentage of Day in ON State"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        DyskinesiaDayPercentageData *data = [DyskinesiaDayPercentageData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Percentage";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Percentage";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Percentage";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Percentage";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Percentage";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    
    //--------------------- END of Dyskinesia Day Percentage Chart ------------------------------
    
    //--------------------- Cognitive Difficulty-------------------
    
    else if (self.chartId == COGNITIVE_DIFFICULTY) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Degree of Cognitive Difficulties"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        CognitiveDifficultyData *data = [CognitiveDifficultyData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    //--------------------- END of Cognitive Difficulty -------------------
    
    //--------------------- Cognitive Difficulty-------------------
    
    else if (self.chartId == DIFFICULTY_EVERYDAY_ACTIVITY) {
        [((ChartViewController *)segue.destinationViewController) setChartTitle:@"Difficulty with Everyday Activities"];
        [((ChartViewController *)segue.destinationViewController) setPromptTitle:[startRangeText stringByAppendingString:endRangeText]];
        ShinobiChart *chart = [ShinobiChart lineChart];
        DifficultyEverydayActivityData *data = [DifficultyEverydayActivityData new];
        
        if ([segue.identifier isEqualToString:@"One Week"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"One Month"]){
            chart.xAxis.title = @"Date";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Three Month"]){
            chart.xAxis.title = @"Week Of";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_DAY];
        }
        else if ([segue.identifier isEqualToString:@"Six Month"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_MONTH];
        }
        else if ([segue.identifier isEqualToString:@"One Year"]){
            chart.xAxis.title = @"Month";
            chart.yAxis.title = @"Level of Difficulty";
            [data setSortType:CHART_SORT_MONTH];
        }
        [data setPatientId:((User *)[AuthManager defaultManager].currentCredentials).id];
        [data setStartDate:start_date];
        [data setEndDate:end_date];
        [data generateData];
        [((ChartViewController *)segue.destinationViewController) setChartData:data];
        [((ChartViewController *)segue.destinationViewController) setChart:chart];
    }
    //--------------------- END of Cognitive Difficulty -------------------



    [self popBusyOperation];
}


//- (void) modifyTextField:(UITextField *)textField
//{
//    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
//    textField.leftView = paddingView;
//    textField.leftViewMode = UITextFieldViewModeAlways;
//    textField.rightView = paddingView;
//    textField.rightViewMode = UITextFieldViewModeAlways;
//    
//    [textField setBackgroundColor:[UIColor whiteColor]];
//    [textField setTextColor:[UIColor blackColor]];
//}


@end
