//
//  PatientClinician+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "PatientClinician+Local.h"

@implementation PatientClinician (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)myCliniciansLocalWithId:(NSNumber *)id offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (id) {
        [params setObject:id forKey:@"id"];
    }

    return [self queryLocal:@"my_clinicians" params:params offset:offset limit:limit];
}

+ (NSArray *)myPatientsLocalWithClinicianId:(NSNumber *)clinicianId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (clinicianId) {
        [params setObject:clinicianId forKey:@"clinician_id"];
    }

    return [self queryLocal:@"my_patients" params:params offset:offset limit:limit];
}

@end