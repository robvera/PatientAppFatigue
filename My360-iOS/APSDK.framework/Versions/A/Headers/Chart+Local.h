//
//  Chart+Local.h
//  AnyPresence SDK
//

/*!
 @header Chart+Local
 @abstract Local category for Chart class
 */

#import "Chart.h"

/*!
 @category Chart (Local)
 @abstract Adds local query capabilities to Chart.
 @discussion Serves as a strongly-typed wrapper around @link //apple_ref/occ/cat/APObject(Local) @/link methods.
 */ 
@interface Chart (Local)

/*!
 @method allLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "all" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method exactMatchLocalWithParams:offset:limit:
 @abstract Fetches objects matching query scope "exact_match" from local cache, with pagination.
 @param params Scope parameter - params.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method adherenceReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "adherence_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)adherenceReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method missingDoseReasonsLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "missing_dose_reasons" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)missingDoseReasonsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method exacerbationsReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "exacerbations_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)exacerbationsReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method dayRatingReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "day_rating_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)dayRatingReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method selectedMoodReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "selected_mood_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)selectedMoodReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method disabilityReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "disability_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)disabilityReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method daysWithWithoutSymptomsLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "days_with_without_symptoms" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)daysWithWithoutSymptomsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method daysWithSideEffectLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "days_with_side_effect" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)daysWithSideEffectLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method painRatingReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "pain_rating_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)painRatingReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method bloodSugarReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "blood_sugar_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)bloodSugarReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method insulinDoseReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "insulin_dose_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)insulinDoseReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method peakFlowReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "peak_flow_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)peakFlowReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method allergensTodayReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "allergens_today_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)allergensTodayReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method inhalerReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "inhaler_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)inhalerReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method shortnessBreathReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "shortness_breath_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)shortnessBreathReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method asthmaSpirometryReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "asthma_spirometry_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)asthmaSpirometryReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method asthmaSpiroReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "asthma_spiro_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)asthmaSpiroReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method dyskinesiaTodayReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "dyskinesia_today_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)dyskinesiaTodayReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method dyskinesiaRatingReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "dyskinesia_rating_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)dyskinesiaRatingReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method dyskinesiaDayPercentageReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "dyskinesia_day_percentage_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)dyskinesiaDayPercentageReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method cognitiveDifficultyReportLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "cognitive_difficulty_report" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)cognitiveDifficultyReportLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

/*!
 @method difficultyEverydayActivityRepLocalWithOffset:limit:
 @abstract Fetches objects matching query scope "difficulty_everyday_activity_rep" from local cache, with pagination.
 @param offset Number of objects to skip.
 @param limit Maximum number of objects to fetch.
 @result Array of objects.
 */
+ (NSArray *)difficultyEverydayActivityRepLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

@end