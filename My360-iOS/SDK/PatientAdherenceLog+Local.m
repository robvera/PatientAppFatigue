//
//  PatientAdherenceLog+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientAdherenceLog+Local.h"

@implementation PatientAdherenceLog (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientAdhereLogsLocalWithPatientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (patientTreatmentId) {
        [params setObject:patientTreatmentId forKey:@"patient_treatment_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"unarchived_patient_adhere_logs" params:params offset:offset limit:limit];
}

+ (NSArray *)treatmentAdherenceForDatesLocalWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    if (patientTreatmentId) {
        [params setObject:patientTreatmentId forKey:@"patient_treatment_id"];
    }

    if (startDate) {
        [params setObject:startDate forKey:@"start_date"];
    }

    if (endDate) {
        [params setObject:endDate forKey:@"end_date"];
    }

    return [self queryLocal:@"treatment_adherence_for_dates" params:params offset:offset limit:limit];
}

+ (NSArray *)chartMissingDosesLocalWithPatientTreatmentId:(NSNumber *)patientTreatmentId startDate:(NSDate *)startDate endDate:(NSDate *)endDate offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    if (patientTreatmentId) {
        [params setObject:patientTreatmentId forKey:@"patient_treatment_id"];
    }

    if (startDate) {
        [params setObject:startDate forKey:@"start_date"];
    }

    if (endDate) {
        [params setObject:endDate forKey:@"end_date"];
    }

    return [self queryLocal:@"chart_missing_doses" params:params offset:offset limit:limit];
}

+ (NSArray *)myAdherenceLogsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_adherence_logs" params:params offset:offset limit:limit];
}

+ (NSArray *)filterScopeLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"filter_scope" params:nil offset:offset limit:limit];
}

+ (NSArray *)adherenceForDateTreatmentLocalWithId:(NSNumber *)id date:(NSDate *)date patientTreatmentId:(NSNumber *)patientTreatmentId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (date) {
        [params setObject:date forKey:@"date"];
    }

    if (patientTreatmentId) {
        [params setObject:patientTreatmentId forKey:@"patient_treatment_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"adherence_for_date_treatment" params:params offset:offset limit:limit];
}

@end