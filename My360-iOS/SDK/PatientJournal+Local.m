//
//  PatientJournal+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientJournal+Local.h"

@implementation PatientJournal (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientJournalsLocalWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (patientId) {
        [params setObject:patientId forKey:@"patient_id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"unarchived_patient_journals" params:params offset:offset limit:limit];
}

+ (NSArray *)myUnarchivedJournalsLocalWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"my_unarchived_journals" params:params offset:offset limit:limit];
}

+ (NSArray *)journalDateMatchLocalWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    if (date) {
        [params setObject:date forKey:@"date"];
    }

    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"journal_date_match" params:params offset:offset limit:limit];
}

@end