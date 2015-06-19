//
//  Chart+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "Chart+Local.h"

@implementation Chart (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)adherenceReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"adherence_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)missingDoseReasonsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"missing_dose_reasons" params:nil offset:offset limit:limit];
}

+ (NSArray *)exacerbationsReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exacerbations_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)dayRatingReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"day_rating_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)selectedMoodReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"selected_mood_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)disabilityReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"disability_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)daysWithWithoutSymptomsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"days_with_without_symptoms" params:nil offset:offset limit:limit];
}

+ (NSArray *)daysWithSideEffectLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"days_with_side_effect" params:nil offset:offset limit:limit];
}

+ (NSArray *)painRatingReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"pain_rating_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)bloodSugarReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"blood_sugar_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)insulinDoseReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"insulin_dose_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)peakFlowReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"peak_flow_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)allergensTodayReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"allergens_today_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)inhalerReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"inhaler_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)shortnessBreathReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"shortness_breath_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)asthmaSpirometryReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"asthma_spirometry_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)asthmaSpiroReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"asthma_spiro_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)dyskinesiaTodayReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"dyskinesia_today_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)dyskinesiaRatingReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"dyskinesia_rating_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)dyskinesiaDayPercentageReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"dyskinesia_day_percentage_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)cognitiveDifficultyReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"cognitive_difficulty_report" params:nil offset:offset limit:limit];
}

+ (NSArray *)difficultyEverydayActivityRepLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"difficulty_everyday_activity_rep" params:nil offset:offset limit:limit];
}

@end