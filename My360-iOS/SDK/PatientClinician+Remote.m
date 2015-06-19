//
//  PatientClinician+Remote.m
//  AnyPresence SDK
//

#import "APObject+Remote.h"
#import "APObject+Internal.h"
#import "PatientClinician+Remote.h"

@implementation PatientClinician (Remote)

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

+ (NSArray *)myCliniciansWithId:(NSNumber *)id error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params context:nil config:nil error:error];
}

+ (NSArray *)myCliniciansWithId:(NSNumber *)id context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params context:context config:nil error:error];
}

+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params context:nil config:nil error:error];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params context:context config:nil error:error];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params offset:offset limit:limit context:context config:nil error:error];
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

+ (NSArray *)myCliniciansWithId:(NSNumber *)id async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myCliniciansWithId:(NSNumber *)id context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params context:context config:nil async:callback];
}

+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myCliniciansWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    return [self query:@"my_clinicians" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params context:context config:nil async:callback];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myPatientsWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    if (clinicianId) {
        NSString *key = @"clinician_id";
        key = @"clinician_id";
        [params setObject:clinicianId forKey:key];
    }

    return [self query:@"my_patients" params:params offset:offset limit:limit context:context config:nil async:callback];
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
