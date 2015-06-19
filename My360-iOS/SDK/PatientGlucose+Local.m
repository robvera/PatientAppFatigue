//
//  PatientGlucose+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientGlucose+Local.h"

@implementation PatientGlucose (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedGlucoseLocalWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    if (fromDate) {
        [params setObject:fromDate forKey:@"from_date"];
    }

    if (toDate) {
        [params setObject:toDate forKey:@"to_date"];
    }

    return [self queryLocal:@"my_unarchived_glucose" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientGlucoseLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"unarchived_patient_glucose" params:params offset:offset limit:limit];
}

@end