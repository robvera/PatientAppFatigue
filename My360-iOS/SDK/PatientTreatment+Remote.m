//
//  PatientTreatment+Remote.m
//  AnyPresence SDK
//

#import "APObject+Remote.h"
#import "APObject+Internal.h"
#import "PatientTreatment+Remote.h"

@implementation PatientTreatment (Remote)

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

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId error:(NSError **)error {
    
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

    return [self query:@"unarchived_patient_treatments" params:params context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
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

    return [self query:@"unarchived_patient_treatments" params:params context:context config:nil error:error];
}

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
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

    return [self query:@"unarchived_patient_treatments" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
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

    return [self query:@"unarchived_patient_treatments" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error {
    
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

    return [self query:@"my_unarchived_treatments" params:params context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
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

    return [self query:@"my_unarchived_treatments" params:params context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
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

    return [self query:@"my_unarchived_treatments" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
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

    return [self query:@"my_unarchived_treatments" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params context:context config:nil error:error];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)adherenceTreatmentsError:(NSError **)error {
    return [self query:@"adherence_treatments" params:nil context:nil config:nil error:error];
}

+ (NSArray *)adherenceTreatmentsWithContext:(id)context error:(NSError **)error {
    return [self query:@"adherence_treatments" params:nil context:context config:nil error:error];
}

+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
    return [self query:@"adherence_treatments" params:nil offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
    return [self query:@"adherence_treatments" params:nil offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params context:nil config:nil error:error];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params context:context config:nil error:error];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params offset:offset limit:limit context:context config:nil error:error];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params context:nil config:nil error:error];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId context:(id)context error:(NSError **)error {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params context:context config:nil error:error];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params offset:offset limit:limit context:nil config:nil error:error];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context error:(NSError **)error {
   
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params offset:offset limit:limit context:context config:nil error:error];
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

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_treatments" params:params context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_treatments" params:params context:context config:nil async:callback];
}

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_treatments" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)unarchivedPatientTreatmentsWithPatientId:(NSNumber *)patientId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
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

    return [self query:@"unarchived_patient_treatments" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
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

    return [self query:@"my_unarchived_treatments" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
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

    return [self query:@"my_unarchived_treatments" params:params context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
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

    return [self query:@"my_unarchived_treatments" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
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

    return [self query:@"my_unarchived_treatments" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params context:context config:nil async:callback];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myUnarchivedMedicationsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    
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

    return [self query:@"my_unarchived_medications" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)adherenceTreatmentsAsync:(APObjectsCallback)callback {
    return [self query:@"adherence_treatments" params:nil context:nil config:nil async:callback];
}

+ (NSArray *)adherenceTreatmentsWithContext:(id)context async:(APObjectsCallback)callback {
    return [self query:@"adherence_treatments" params:nil context:context config:nil async:callback];
}

+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    return [self query:@"adherence_treatments" params:nil offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)adherenceTreatmentsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    return [self query:@"adherence_treatments" params:nil offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params context:context config:nil async:callback];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myTreatmentsWithId:(NSNumber *)id appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:2];
    
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

    return [self query:@"my_treatments" params:params offset:offset limit:limit context:context config:nil async:callback];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params context:nil config:nil async:callback];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params context:context config:nil async:callback];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params offset:offset limit:limit context:nil config:nil async:callback];
}

+ (NSArray *)myMedicationsWithId:(NSNumber *)id medicationId:(NSNumber *)medicationId appId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit context:(id)context async:(APObjectsCallback)callback {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    if (id) {
        NSString *key = @"id";
        key = @"id";
        [params setObject:id forKey:key];
    }

    
    if (medicationId) {
        NSString *key = @"medication_id";
        key = @"medication_id";
        [params setObject:medicationId forKey:key];
    }

    
    if (appId) {
        NSString *key = @"app_id";
        key = @"app_id";
        [params setObject:appId forKey:key];
    }

    return [self query:@"my_medications" params:params offset:offset limit:limit context:context config:nil async:callback];
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
