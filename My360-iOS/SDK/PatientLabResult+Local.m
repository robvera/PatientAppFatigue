//
//  PatientLabResult+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientLabResult+Local.h"

@implementation PatientLabResult (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientLabresultsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"unarchived_patient_labresults" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedLabResultsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_unarchived_lab_results" params:params offset:offset limit:limit];
}

@end