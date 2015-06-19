//
//  PatientJournalSymptom+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientJournalSymptom+Local.h"

@implementation PatientJournalSymptom (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)unarchivedPatientJournalSympLocalWithPatientJournalId:(NSNumber *)patientJournalId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (patientJournalId) {
        [params setObject:patientJournalId forKey:@"patient_journal_id"];
    }

    return [self queryLocal:@"unarchived_patient_journal_symp" params:params offset:offset limit:limit];
}

@end