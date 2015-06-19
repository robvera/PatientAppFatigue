//
//  TreatmentSchedule+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "TreatmentSchedule+Local.h"

@implementation TreatmentSchedule (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)activeTreatmentSchedulesLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"active_treatment_schedules" params:nil offset:offset limit:limit];
}

@end