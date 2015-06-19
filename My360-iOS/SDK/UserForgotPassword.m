//
//  UserForgotPassword.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "UserForgotPassword.h"
#import "UserForgotPassword$AP$.h"
#import "AnyPresenceAPI.h"

@interface UserForgotPassword ()

@property (nonatomic, strong) UserForgotPassword$AP$ * internal;

@end

@implementation UserForgotPassword

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

- (NSDate *)updatedOn {
    return ThreadSafeReturn(^id{
        return self.internal.updatedOn;
    });
}

- (void)setUpdatedOn:(NSDate *)updatedOn {
    ThreadSafe(^{
        self.internal.updatedOn = updatedOn;
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
