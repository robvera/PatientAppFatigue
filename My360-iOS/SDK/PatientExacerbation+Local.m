//
//  PatientExacerbation+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientExacerbation+Local.h"

@implementation PatientExacerbation (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientExacerbationsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"unarchived_patient_exacerbations" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedExacerbationsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_unarchived_exacerbations" params:params offset:offset limit:limit];
}

+ (NSArray *)chartExacerbationReasonsLocalWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate patientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    if (startDate) {
        [params setObject:startDate forKey:@"start_date"];
    }

    if (endDate) {
        [params setObject:endDate forKey:@"end_date"];
    }

    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"chart_exacerbation_reasons" params:params offset:offset limit:limit];
}

@end