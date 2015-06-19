//
//  NSData+JSON.m
//  AnyPresence SDK
//

#import "NSData+JSON.h"
#import "NSData+Serialization.h"

@implementation NSData (JSON)

#pragma mark - Public

- (id)objectFromJSON {
    NSError *error = nil;
    return [self objectFromJSONError:&error];
}

- (id)objectFromJSONError:(NSError **)error {
    return [self objectFromJSONWithConfig:nil error:error];
}

+ (NSData *)dataFromObject:(id)object {
    NSError *error = nil;
    return [self dataFromObject:object error:&error];
}

+ (NSData *)dataFromObject:(id)object error:(NSError **)error {
    return [self jsonDataFromObject:object withConfig:nil error:error];
}

@end