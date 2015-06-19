//
//  PatientReminder+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientReminder+Local.h"

@implementation PatientReminder (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedAlertsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_unarchived_alerts" params:params offset:offset limit:limit];
}

+ (NSArray *)processAllLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"process_all" params:nil offset:offset limit:limit];
}

+ (NSArray *)setReadLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"set_read" params:nil offset:offset limit:limit];
}

+ (NSArray *)processOneLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"process_one" params:nil offset:offset limit:limit];
}

@end