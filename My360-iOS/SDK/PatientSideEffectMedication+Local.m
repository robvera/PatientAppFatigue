//
//  PatientSideEffectMedication+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientSideEffectMedication+Local.h"

@implementation PatientSideEffectMedication (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedSideeffectMedsLocalWithPatientSideEffectId:(NSNumber *)patientSideEffectId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (patientSideEffectId) {
        [params setObject:patientSideEffectId forKey:@"patient_side_effect_id"];
    }

    return [self queryLocal:@"unarchived_sideeffect_meds" params:params offset:offset limit:limit];
}

@end