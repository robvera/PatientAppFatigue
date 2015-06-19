//
//  PatientMedicalCondition+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientMedicalCondition+Local.h"

@implementation PatientMedicalCondition (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientMedCondLocalWithPatientId:(NSNumber *)patientId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    return [self queryLocal:@"unarchived_patient_med_cond" params:params offset:offset limit:limit];
}

+ (NSArray *)myMedicalConditionsLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    return [self queryLocal:@"my_medical_conditions" params:params offset:offset limit:limit];
}

@end