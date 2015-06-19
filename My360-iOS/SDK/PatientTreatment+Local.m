//
//  PatientTreatment+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientTreatment+Local.h"

@implementation PatientTreatment (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientTreatmentsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"unarchived_patient_treatments" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedTreatmentsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_unarchived_treatments" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedMedicationsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_unarchived_medications" params:params offset:offset limit:limit];
}

+ (NSArray *)adherenceTreatmentsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"adherence_treatments" params:nil offset:offset limit:limit];
}

+ (NSArray *)myTreatmentsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_treatments" params:params offset:offset limit:limit];
}

+ (NSArray *)myMedicationsLocalWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (medicationId) {
        [params setObject:medicationId forKey:@"medication_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_medications" params:params offset:offset limit:limit];
}

@end