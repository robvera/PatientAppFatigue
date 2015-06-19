//
//  Chart+Remote.m
//  AnyPresence SDK
//

#import "APObject+Remote.h"
#import "APObject+Internal.h"
#import "Chart+Remote.h"

@implementation Chart (Remote)

#pragma mark - Public Queries

+ (NSArray *)allError:(NSError **)error {
    return [self query:@"all" params:nil context:nil config:nil error:error];
}

+ (NSArray *)allWithContext:(id)context error:(NSError **)error {
    return [self query:@"all" params:nil context:context config:nil error:error];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"all" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"all" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params error:(NSError **)error {
    return [self query:@"exact_match" params:params context:nil config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params context:(id)context error:(NSError **)error {
    return [self query:@"exact_match" params:params context:context config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)adherenceReportError:(NSError **)error {
    return [self query:@"adherence_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)adherenceReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"adherence_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)adherenceReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"adherence_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)adherenceReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"adherence_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)missingDoseReasonsError:(NSError **)error {
    return [self query:@"missing_dose_reasons" params:nil context:nil config:nil error:error];
}

+ (NSArray *)missingDoseReasonsWithContext:(id)context error:(NSError **)error {
    return [self query:@"missing_dose_reasons" params:nil context:context config:nil error:error];
}

+ (NSArray *)missingDoseReasonsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"missing_dose_reasons" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)missingDoseReasonsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"missing_dose_reasons" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)exacerbationsReportError:(NSError **)error {
    return [self query:@"exacerbations_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)exacerbationsReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"exacerbations_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)exacerbationsReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"exacerbations_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)exacerbationsReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"exacerbations_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)dayRatingReportError:(NSError **)error {
    return [self query:@"day_rating_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)dayRatingReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"day_rating_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)dayRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"day_rating_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)dayRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"day_rating_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)selectedMoodReportError:(NSError **)error {
    return [self query:@"selected_mood_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)selectedMoodReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"selected_mood_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)selectedMoodReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"selected_mood_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)selectedMoodReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"selected_mood_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)disabilityReportError:(NSError **)error {
    return [self query:@"disability_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)disabilityReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"disability_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)disabilityReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"disability_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)disabilityReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"disability_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)daysWithWithoutSymptomsError:(NSError **)error {
    return [self query:@"days_with_without_symptoms" params:nil context:nil config:nil error:error];
}

+ (NSArray *)daysWithWithoutSymptomsWithContext:(id)context error:(NSError **)error {
    return [self query:@"days_with_without_symptoms" params:nil context:context config:nil error:error];
}

+ (NSArray *)daysWithWithoutSymptomsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"days_with_without_symptoms" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)daysWithWithoutSymptomsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"days_with_without_symptoms" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)daysWithSideEffectError:(NSError **)error {
    return [self query:@"days_with_side_effect" params:nil context:nil config:nil error:error];
}

+ (NSArray *)daysWithSideEffectWithContext:(id)context error:(NSError **)error {
    return [self query:@"days_with_side_effect" params:nil context:context config:nil error:error];
}

+ (NSArray *)daysWithSideEffectWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"days_with_side_effect" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)daysWithSideEffectWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"days_with_side_effect" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)painRatingReportError:(NSError **)error {
    return [self query:@"pain_rating_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)painRatingReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"pain_rating_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)painRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"pain_rating_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)painRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"pain_rating_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)bloodSugarReportError:(NSError **)error {
    return [self query:@"blood_sugar_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)bloodSugarReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"blood_sugar_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)bloodSugarReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"blood_sugar_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)bloodSugarReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"blood_sugar_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)insulinDoseReportError:(NSError **)error {
    return [self query:@"insulin_dose_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)insulinDoseReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"insulin_dose_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)insulinDoseReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"insulin_dose_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)insulinDoseReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"insulin_dose_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)peakFlowReportError:(NSError **)error {
    return [self query:@"peak_flow_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)peakFlowReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"peak_flow_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)peakFlowReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"peak_flow_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)peakFlowReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"peak_flow_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)allergensTodayReportError:(NSError **)error {
    return [self query:@"allergens_today_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)allergensTodayReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"allergens_today_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)allergensTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"allergens_today_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)allergensTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"allergens_today_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)inhalerReportError:(NSError **)error {
    return [self query:@"inhaler_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)inhalerReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"inhaler_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)inhalerReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"inhaler_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)inhalerReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"inhaler_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)shortnessBreathReportError:(NSError **)error {
    return [self query:@"shortness_breath_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)shortnessBreathReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"shortness_breath_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)shortnessBreathReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"shortness_breath_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)shortnessBreathReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"shortness_breath_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)asthmaSpirometryReportError:(NSError **)error {
    return [self query:@"asthma_spirometry_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)asthmaSpirometryReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"asthma_spirometry_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)asthmaSpirometryReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"asthma_spirometry_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)asthmaSpirometryReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"asthma_spirometry_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)asthmaSpiroReportError:(NSError **)error {
    return [self query:@"asthma_spiro_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)asthmaSpiroReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"asthma_spiro_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)asthmaSpiroReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"asthma_spiro_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)asthmaSpiroReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"asthma_spiro_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)dyskinesiaTodayReportError:(NSError **)error {
    return [self query:@"dyskinesia_today_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)dyskinesiaTodayReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"dyskinesia_today_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)dyskinesiaTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"dyskinesia_today_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)dyskinesiaTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"dyskinesia_today_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)dyskinesiaRatingReportError:(NSError **)error {
    return [self query:@"dyskinesia_rating_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)dyskinesiaRatingReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"dyskinesia_rating_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)dyskinesiaRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"dyskinesia_rating_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)dyskinesiaRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"dyskinesia_rating_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)dyskinesiaDayPercentageReportError:(NSError **)error {
    return [self query:@"dyskinesia_day_percentage_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)dyskinesiaDayPercentageReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"dyskinesia_day_percentage_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)dyskinesiaDayPercentageReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"dyskinesia_day_percentage_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)dyskinesiaDayPercentageReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"dyskinesia_day_percentage_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)cognitiveDifficultyReportError:(NSError **)error {
    return [self query:@"cognitive_difficulty_report" params:nil context:nil config:nil error:error];
}

+ (NSArray *)cognitiveDifficultyReportWithContext:(id)context error:(NSError **)error {
    return [self query:@"cognitive_difficulty_report" params:nil context:context config:nil error:error];
}

+ (NSArray *)cognitiveDifficultyReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"cognitive_difficulty_report" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)cognitiveDifficultyReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"cognitive_difficulty_report" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)difficultyEverydayActivityRepError:(NSError **)error {
    return [self query:@"difficulty_everyday_activity_rep" params:nil context:nil config:nil error:error];
}

+ (NSArray *)difficultyEverydayActivityRepWithContext:(id)context error:(NSError **)error {
    return [self query:@"difficulty_everyday_activity_rep" params:nil context:context config:nil error:error];
}

+ (NSArray *)difficultyEverydayActivityRepWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"difficulty_everyday_activity_rep" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)difficultyEverydayActivityRepWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"difficulty_everyday_activity_rep" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSNumber *)countError:(NSError **)error {
    return [self aggregateQuery:@"count" params:nil context:nil config:nil error:error];
}

+ (NSNumber *)countWithContext:(id)context error:(NSError **)error {
    return [self aggregateQuery:@"count" params:nil context:context config:nil error:error];
}

+ (NSNumber *)countExactMatchWithParams:(NSDictionary *)params error:(NSError **)error {
    return [self aggregateQuery:@"count_exact_match" params:params context:nil config:nil error:error];
}

+ (NSNumber *)countExactMatchWithParams:(NSDictionary *)params context:(id)context error:(NSError **)error {
    return [self aggregateQuery:@"count_exact_match" params:params context:context config:nil error:error];
}

+ (NSArray *)allAsync:(APObjectsCallback)callback {
    return [self query:@"all" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)allWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"all" params:nil context:context config:nil async:callback];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"all" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"all" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params context:nil config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params context:context config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)adherenceReportAsync:(APObjectsCallback)callback {
    return [self query:@"adherence_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)adherenceReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"adherence_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)adherenceReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"adherence_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)adherenceReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"adherence_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)missingDoseReasonsAsync:(APObjectsCallback)callback {
    return [self query:@"missing_dose_reasons" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)missingDoseReasonsWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"missing_dose_reasons" params:nil context:context config:nil async:callback];
}

+ (NSArray *)missingDoseReasonsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"missing_dose_reasons" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)missingDoseReasonsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"missing_dose_reasons" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)exacerbationsReportAsync:(APObjectsCallback)callback {
    return [self query:@"exacerbations_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)exacerbationsReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"exacerbations_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)exacerbationsReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"exacerbations_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)exacerbationsReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"exacerbations_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)dayRatingReportAsync:(APObjectsCallback)callback {
    return [self query:@"day_rating_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)dayRatingReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"day_rating_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)dayRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"day_rating_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)dayRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"day_rating_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)selectedMoodReportAsync:(APObjectsCallback)callback {
    return [self query:@"selected_mood_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)selectedMoodReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"selected_mood_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)selectedMoodReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"selected_mood_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)selectedMoodReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"selected_mood_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)disabilityReportAsync:(APObjectsCallback)callback {
    return [self query:@"disability_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)disabilityReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"disability_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)disabilityReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"disability_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)disabilityReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"disability_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)daysWithWithoutSymptomsAsync:(APObjectsCallback)callback {
    return [self query:@"days_with_without_symptoms" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)daysWithWithoutSymptomsWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"days_with_without_symptoms" params:nil context:context config:nil async:callback];
}

+ (NSArray *)daysWithWithoutSymptomsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"days_with_without_symptoms" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)daysWithWithoutSymptomsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"days_with_without_symptoms" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)daysWithSideEffectAsync:(APObjectsCallback)callback {
    return [self query:@"days_with_side_effect" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)daysWithSideEffectWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"days_with_side_effect" params:nil context:context config:nil async:callback];
}

+ (NSArray *)daysWithSideEffectWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"days_with_side_effect" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)daysWithSideEffectWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"days_with_side_effect" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)painRatingReportAsync:(APObjectsCallback)callback {
    return [self query:@"pain_rating_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)painRatingReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"pain_rating_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)painRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"pain_rating_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)painRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"pain_rating_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)bloodSugarReportAsync:(APObjectsCallback)callback {
    return [self query:@"blood_sugar_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)bloodSugarReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"blood_sugar_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)bloodSugarReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"blood_sugar_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)bloodSugarReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"blood_sugar_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)insulinDoseReportAsync:(APObjectsCallback)callback {
    return [self query:@"insulin_dose_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)insulinDoseReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"insulin_dose_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)insulinDoseReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"insulin_dose_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)insulinDoseReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"insulin_dose_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)peakFlowReportAsync:(APObjectsCallback)callback {
    return [self query:@"peak_flow_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)peakFlowReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"peak_flow_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)peakFlowReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"peak_flow_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)peakFlowReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"peak_flow_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)allergensTodayReportAsync:(APObjectsCallback)callback {
    return [self query:@"allergens_today_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)allergensTodayReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"allergens_today_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)allergensTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"allergens_today_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)allergensTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"allergens_today_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)inhalerReportAsync:(APObjectsCallback)callback {
    return [self query:@"inhaler_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)inhalerReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"inhaler_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)inhalerReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"inhaler_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)inhalerReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"inhaler_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)shortnessBreathReportAsync:(APObjectsCallback)callback {
    return [self query:@"shortness_breath_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)shortnessBreathReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"shortness_breath_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)shortnessBreathReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"shortness_breath_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)shortnessBreathReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"shortness_breath_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)asthmaSpirometryReportAsync:(APObjectsCallback)callback {
    return [self query:@"asthma_spirometry_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)asthmaSpirometryReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"asthma_spirometry_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)asthmaSpirometryReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"asthma_spirometry_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)asthmaSpirometryReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"asthma_spirometry_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)asthmaSpiroReportAsync:(APObjectsCallback)callback {
    return [self query:@"asthma_spiro_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)asthmaSpiroReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"asthma_spiro_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)asthmaSpiroReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"asthma_spiro_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)asthmaSpiroReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"asthma_spiro_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)dyskinesiaTodayReportAsync:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_today_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)dyskinesiaTodayReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_today_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)dyskinesiaTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_today_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)dyskinesiaTodayReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_today_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)dyskinesiaRatingReportAsync:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_rating_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)dyskinesiaRatingReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_rating_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)dyskinesiaRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_rating_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)dyskinesiaRatingReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_rating_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)dyskinesiaDayPercentageReportAsync:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_day_percentage_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)dyskinesiaDayPercentageReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_day_percentage_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)dyskinesiaDayPercentageReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_day_percentage_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)dyskinesiaDayPercentageReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"dyskinesia_day_percentage_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)cognitiveDifficultyReportAsync:(APObjectsCallback)callback {
    return [self query:@"cognitive_difficulty_report" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)cognitiveDifficultyReportWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"cognitive_difficulty_report" params:nil context:context config:nil async:callback];
}

+ (NSArray *)cognitiveDifficultyReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"cognitive_difficulty_report" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)cognitiveDifficultyReportWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"cognitive_difficulty_report" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)difficultyEverydayActivityRepAsync:(APObjectsCallback)callback {
    return [self query:@"difficulty_everyday_activity_rep" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)difficultyEverydayActivityRepWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"difficulty_everyday_activity_rep" params:nil context:context config:nil async:callback];
}

+ (NSArray *)difficultyEverydayActivityRepWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"difficulty_everyday_activity_rep" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)difficultyEverydayActivityRepWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"difficulty_everyday_activity_rep" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (void)countAsync:(APObjectsCallback)callback {
    [self aggregateQuery:@"count" params:nil context:nil config:nil async:callback];
}

+ (void)countWithContext:(id)context async:(APObjectsCallback)callback {
    [self aggregateQuery:@"count" params:nil context:context config:nil async:callback];
}

+ (void)countExactMatchWithParams:(NSDictionary *)params async:(APObjectsCallback)callback {
    [self aggregateQuery:@"count_exact_match" params:params context:nil config:nil async:callback];
}

+ (void)countExactMatchWithParams:(NSDictionary *)params context:(id)context async:(APObjectsCallback)callback {
    [self aggregateQuery:@"count_exact_match" params:params context:context config:nil async:callback];
}

@end
