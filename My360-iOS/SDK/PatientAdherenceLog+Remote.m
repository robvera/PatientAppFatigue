//
//  PatientAdherenceLog+Remote.m
//  AnyPresence SDK
//

#import "APObject+Remote.h"
#import "APObject+Internal.h"
#import "PatientAdherenceLog+Remote.h"

@implementation PatientAdherenceLog (Remote)

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

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params context:context config:nil error:error];
}

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params context:nil config:nil error:error];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params context:context config:nil error:error];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params context:nil config:nil error:error];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params context:context config:nil error:error];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params context:nil config:nil error:error];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params context:context config:nil error:error];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)filterScopeError:(NSError **)error {
    return [self query:@"filter_scope" params:nil context:nil config:nil error:error];
}

+ (NSArray *)filterScopeWithContext:(id)context error:(NSError **)error {
    return [self query:@"filter_scope" params:nil context:context config:nil error:error];
}

+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"filter_scope" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"filter_scope" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params context:nil config:nil error:error];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params context:context config:nil error:error];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params offset:offset limit:limit context:context config:nil error:error];
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

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params context:context config:nil async:callback];
}

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientAdhereLogsWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_adhere_logs" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params context:nil config:nil async:callback];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params context:context config:nil async:callback];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)treatmentAdherenceForDatesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"treatment_adherence_for_dates" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params context:nil config:nil async:callback];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params context:context config:nil async:callback];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)chartMissingDosesWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (startDate) {
        NSString *key = @"start_date";
        [params setObject:startDate forKey:key];
    }

    
    if (endDate) {
        NSString *key = @"end_date";
        [params setObject:endDate forKey:key];
    }

    return [self query:@"chart_missing_doses" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params context:context config:nil async:callback];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myAdherenceLogsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_adherence_logs" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)filterScopeAsync:(APObjectsCallback)callback {
    return [self query:@"filter_scope" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)filterScopeWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"filter_scope" params:nil context:context config:nil async:callback];
}

+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"filter_scope" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)filterScopeWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"filter_scope" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params context:nil config:nil async:callback];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params context:context config:nil async:callback];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)adherenceForDateTreatmentWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (patientTreatmentId) {
        NSString *key = @"patient_treatment_id";
        key = @"patient_treatment_id";
        [params setObject:patientTreatmentId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"adherence_for_date_treatment" params:params offset:offset limit:limit context:context config:nil async:callback];
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
