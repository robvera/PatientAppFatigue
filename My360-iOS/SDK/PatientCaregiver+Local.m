//
//  PatientCaregiver+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientCaregiver+Local.h"

@implementation PatientCaregiver (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)myCaregiverLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    return [self queryLocal:@"my_caregiver" params:params offset:offset limit:limit];
}

@end