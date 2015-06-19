//
//  PatientFatigueResult+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientFatigueResult+Local.h"

@implementation PatientFatigueResult (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedFatigueLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    return [self queryLocal:@"my_unarchived_fatigue" params:params offset:offset limit:limit];
}

@end