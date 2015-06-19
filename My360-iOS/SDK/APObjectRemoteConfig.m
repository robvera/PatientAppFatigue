//
//  APObjectRemoteConfig.m
//  AnyPresence SDK
//

#import "APObject+Reflection.h"
#import "APObjectRemoteConfig.h"

@implementation APObjectRemoteConfig

@synthesize remoteIDProperty;

NSString * const kAPObjectRemoteConfigExceptionNoProperties = @"APObjectRemoteConfigExceptionNoProperties";

#pragma mark - Public

+ (APObjectRemoteConfig *)defaultConfigForClass:(Class)klass {
    APObjectRemoteConfig * config = [APObjectRemoteConfig new];
    
    NSArray * properties = [klass properties];
    for (NSString * prop in @[ @"id", @"remoteID", @"key" ]) {
        if ([properties containsObject:prop]) {
            config.remoteIDProperty = prop;
            break;
        }
    }
    
    if (!config.remoteIDProperty) {
        if (properties.count > 0) {
            config.remoteIDProperty = [properties objectAtIndex:0];
        }
    }
    
    return config;
}

@end
