//
//  APContext.m
//  AnyPresence SDK
//

#import "APContext.h"
#import "APManagedDataObject+Protected.h"

@implementation APContext

@dynamic currentCredentials;

#pragma mark - Public

+ (APContext *)context {
    APContext * context = [[[self class] fetchAll] lastObject];
    if (!context) {
        context = [APContext new];
        [context save];
    }
    
    return context;
}

@end
