//
//  PatientJournal+Remote.m
//  AnyPresence SDK
//

#import "APObject+Remote.h"
#import "APObject+Internal.h"
#import "PatientJournal+Remote.h"

@implementation PatientJournal (Remote)

#pragma mark - Public Queries

+ (NSArray *)allError:(NSError **)error {
    return [self query:@"all" params:nil context:nil config:nil error:error];
}

+ (NSArray *)allWithContext:(id)context error:(NSError **)error {
    return [self query:@"all" params:nil context:context config:nil error:error];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"all" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"all" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params error:(NSError **)error {
    return [self query:@"exact_match" params:params context:nil config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params context:(id)context error:(NSError **)error {
    return [self query:@"exact_match" params:params context:context config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params context:context config:nil error:error];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params context:nil config:nil error:error];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params context:context config:nil error:error];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSNumber *)countError:(NSError **)error {
    return [self aggregateQuery:@"count" params:nil context:nil config:nil error:error];
}

+ (NSNumber *)countWithContext:(id)context error:(NSError **)error {
    return [self aggregateQuery:@"count" params:nil context:context config:nil error:error];
}

+ (NSNumber *)countExactMatchWithParams:(NSDictionary *)params error:(NSError **)error {
    return [self aggregateQuery:@"count_exact_match" params:params context:nil config:nil error:error];
}

+ (NSNumber *)countExactMatchWithParams:(NSDictionary *)params context:(id)context error:(NSError **)error {
    return [self aggregateQuery:@"count_exact_match" params:params context:context config:nil error:error];
}

+ (NSArray *)allAsync:(APObjectsCallback)callback {
    return [self query:@"all" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)allWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"all" params:nil context:context config:nil async:callback];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"all" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)allWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"all" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params context:nil config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params context:context config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)exactMatchWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"exact_match" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params context:context config:nil async:callback];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientJournalsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (patientId) {
        NSString *key = @"patient_id";
        key = @"patient_id";
        [params setObject:patientId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"unarchived_patient_journals" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedJournalsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_unarchived_journals" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params context:nil config:nil async:callback];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params context:context config:nil async:callback];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)journalDateMatchWithId:(NSNumber *)id date:(NSDate *)date appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (date) {
        NSString *key = @"date";
        [params setObject:date forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"journal_date_match" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (void)countAsync:(APObjectsCallback)callback {
    [self aggregateQuery:@"count" params:nil context:nil config:nil async:callback];
}

+ (void)countWithContext:(id)context async:(APObjectsCallback)callback {
    [self aggregateQuery:@"count" params:nil context:context config:nil async:callback];
}

+ (void)countExactMatchWithParams:(NSDictionary *)params async:(APObjectsCallback)callback {
    [self aggregateQuery:@"count_exact_match" params:params context:nil config:nil async:callback];
}

+ (void)countExactMatchWithParams:(NSDictionary *)params context:(id)context async:(APObjectsCallback)callback {
    [self aggregateQuery:@"count_exact_match" params:params context:context config:nil async:callback];
}

@end
