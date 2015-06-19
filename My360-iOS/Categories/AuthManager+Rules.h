//
//  AuthManager+Rules.h
//  AnyPresence
//

#import <APSDK/AuthManager.h>

@interface AuthManager (Rules)

- (BOOL)isAuthorized:(NSObject *)object;

@end
