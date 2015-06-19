//
//  Patient+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "Patient+Local.h"

@implementation Patient (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)clinicianPatientsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"clinician_patients" params:nil offset:offset limit:limit];
}

+ (NSArray *)clinicianAllPatientsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"clinician_all_patients" params:nil offset:offset limit:limit];
}

@end