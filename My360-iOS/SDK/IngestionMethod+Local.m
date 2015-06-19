//
//  IngestionMethod+Local.m
//  AnyPresence SDK
//

#import "APObject+Local.h"
#import "IngestionMethod+Local.h"

@implementation IngestionMethod (Local)

#pragma mark - Public

+ (NSArray *)allLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"all" params:nil offset:offset limit:limit];
}

+ (NSArray *)exactMatchLocalWithParams:(NSDictionary *)params offset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"exact_match" params:params offset:offset limit:limit];
}

+ (NSArray *)activeIngestionMethodsLocalWithOffset:(NSUInteger)offset limit:(NSUInteger)limit {
    return [self queryLocal:@"active_ingestion_methods" params:nil offset:offset limit:limit];
}

@end