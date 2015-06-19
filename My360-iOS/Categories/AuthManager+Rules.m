//
//  AuthManager+Rules.m
//  AnyPresence
//

#import "AuthManager+Rules.h"
#import "NSObject+ComponentID.h"

@implementation AuthManager (Rules)

- (BOOL)isAuthorized:(NSObject *)object {
    NSString * componentID = [object componentID];
    if (componentID) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"AuthRules" ofType:@"plist"];
        NSDictionary * rules = [[NSDictionary alloc] initWithContentsOfFile:path];
        
        NSDictionary * componentRules = [rules objectForKey:componentID];
        if (componentRules) {
            for (NSDictionary * rule in componentRules) {
                if ([[rule objectForKey:@"Authenticate"] boolValue]) {
                    NSArray * roles = [rule objectForKey:@"Roles"];
                    if (!roles.count) {
                        if (self.currentCredentials)
                            return YES;
                    } else {
                        if (self.currentCredentials.role &&
                            [roles containsObject:self.currentCredentials.role])
                            return YES;
                    }
                } else {
                    if (!self.currentCredentials)
                        return YES;
                }
            }
            
            return NO;
        }
    }
    
    return YES;
}

@end
