//
//  User.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "User.h"
#import "User$AP$.h"
#import "AnyPresenceAPI.h"

@interface User ()

@property (nonatomic, strong) User$AP$ * internal;

@end

@implementation User

#pragma mark - Data Source

+ (Class)dataSource {
    return [AnyPresenceAPI class];
}

#pragma mark - Public

- (NSNumber *)id {
    return ThreadSafeReturn(^id{
        return self.internal.id;
    });
}

- (void)setId:(NSNumber *)id {
    ThreadSafe(^{
        self.internal.id = id;
    });
}

- (NSNumber *)appId {
    return ThreadSafeReturn(^id{
        return self.internal.appId;
    });
}

- (void)setAppId:(NSNumber *)appId {
    ThreadSafe(^{
        self.internal.appId = appId;
    });
}

- (NSString *)email {
    return ThreadSafeReturn(^id{
        return self.internal.email;
    });
}

- (void)setEmail:(NSString *)email {
    ThreadSafe(^{
        self.internal.email = email;
    });
}

- (NSDate *)lastLoginTimestamp {
    return ThreadSafeReturn(^id{
        return self.internal.lastLoginTimestamp;
    });
}

- (void)setLastLoginTimestamp:(NSDate *)lastLoginTimestamp {
    ThreadSafe(^{
        self.internal.lastLoginTimestamp = lastLoginTimestamp;
    });
}

- (NSNumber *)logInCounter {
    return ThreadSafeReturn(^id{
        return self.internal.logInCounter;
    });
}

- (void)setLogInCounter:(NSNumber *)logInCounter {
    ThreadSafe(^{
        self.internal.logInCounter = logInCounter;
    });
}

- (NSString *)password {
    return ThreadSafeReturn(^id{
        return self.internal.password;
    });
}

- (void)setPassword:(NSString *)password {
    ThreadSafe(^{
        self.internal.password = password;
    });
}

- (NSString *)passwordConfirmation {
    return ThreadSafeReturn(^id{
        return self.internal.passwordConfirmation;
    });
}

- (void)setPasswordConfirmation:(NSString *)passwordConfirmation {
    ThreadSafe(^{
        self.internal.passwordConfirmation = passwordConfirmation;
    });
}

- (NSString *)passwordDigest {
    return ThreadSafeReturn(^id{
        return self.internal.passwordDigest;
    });
}

- (void)setPasswordDigest:(NSString *)passwordDigest {
    ThreadSafe(^{
        self.internal.passwordDigest = passwordDigest;
    });
}

- (NSNumber *)resetPassword {
    return ThreadSafeReturn(^id{
        return self.internal.resetPassword;
    });
}

- (void)setResetPassword:(NSNumber *)resetPassword {
    ThreadSafe(^{
        self.internal.resetPassword = resetPassword;
    });
}

- (NSString *)role {
    return ThreadSafeReturn(^id{
        return self.internal.role;
    });
}

- (void)setRole:(NSString *)role {
    ThreadSafe(^{
        self.internal.role = role;
    });
}

- (NSString *)xSessionId {
    return ThreadSafeReturn(^id{
        return self.internal.xSessionId;
    });
}

- (void)setXSessionId:(NSString *)xSessionId {
    ThreadSafe(^{
        self.internal.xSessionId = xSessionId;
    });
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
    });
    }
    return self;
}

@end
