//
//  PatientGlucose+Remote.m
//  AnyPresence SDK
//

#import "APObject+Remote.h"
#import "APObject+Internal.h"
#import "PatientGlucose+Remote.h"

@implementation PatientGlucose (Remote)

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

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId error:(NSError **)error {
    
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

    return [self query:@"unarchived_patient_glucose" params:params context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
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

    return [self query:@"unarchived_patient_glucose" params:params context:context config:nil error:error];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
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

    return [self query:@"unarchived_patient_glucose" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
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

    return [self query:@"unarchived_patient_glucose" params:params offset:offset limit:limit context:context config:nil error:error];
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

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedGlucoseWithId:(NSNumber *)id appId:(NSNumber *)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:5];
    
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

    
    if (fromDate) {
        NSString *key = @"from_date";
        [params setObject:fromDate forKey:key];
    }

    
    if (toDate) {
        NSString *key = @"to_date";
        [params setObject:toDate forKey:key];
    }

    return [self query:@"my_unarchived_glucose" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_glucose" params:params context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_glucose" params:params context:context config:nil async:callback];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_glucose" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientGlucoseWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_glucose" params:params offset:offset limit:limit context:context config:nil async:callback];
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
