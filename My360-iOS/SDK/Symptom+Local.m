//
//  Symptom+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "Symptom+Local.h"

@implementation Symptom (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)activeSymptomsLocalWithAppId:(NSNumber *)appId offset:(NSUInteger)offset limit:(NSUInteger)limit {
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithCapacity:4];
    if (appId) {
        [params setObject:appId forKey:@"app_id"];
    }

    return [self queryLocal:@"active_symptoms" params:params offset:offset limit:limit];
}

@end