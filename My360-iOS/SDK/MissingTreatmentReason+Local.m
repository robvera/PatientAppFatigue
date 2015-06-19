//
//  MissingTreatmentReason+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "MissingTreatmentReason+Local.h"

@implementation MissingTreatmentReason (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)activeMissingTreatmentsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"active_missing_treatments" params:nil offset:offset limit:limit];
}

@end