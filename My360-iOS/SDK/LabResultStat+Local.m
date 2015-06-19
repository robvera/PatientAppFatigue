//
//  LabResultStat+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "LabResultStat+Local.h"

@implementation LabResultStat (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)activeLabResultStatusesLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"active_lab_result_statuses" params:nil offset:offset limit:limit];
}

@end