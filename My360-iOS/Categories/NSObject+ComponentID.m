//
//  NSObject+ComponentID.m
//  AnyPresence
//

#import <objc/runtime.h>
#import "NSObject+ComponentID.h"

@implementation NSObject (ComponentID)

static id __key = nil;

- (void)setComponentID:(NSString *)componentID {
    objc_setAssociatedObject(self, &__key, componentID, OBJC_ASSOCIATION_COPY);
}

- (NSString *)componentID {
    return objc_getAssociatedObject(self, &__key);
}

@end
