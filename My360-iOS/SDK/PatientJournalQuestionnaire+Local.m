//
//  PatientJournalQuestionnaire+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientJournalQuestionnaire+Local.h"

@implementation PatientJournalQuestionnaire (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

@end