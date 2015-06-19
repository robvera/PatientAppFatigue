//
//  ClinicianCodeRequest+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "ClinicianCodeRequest+Local.h"

@implementation ClinicianCodeRequest (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)matchByPatientIdLocalWithPatientId:(NSNumber *)patientId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    return [self queryLocal:@"match_by_patient_id" params:params offset:offset limit:limit];
}

@end