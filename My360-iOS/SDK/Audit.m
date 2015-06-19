//
//  Audit.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Audit.h"
#import "Audit$AP$.h"
#import "AnyPresenceAPI.h"

@interface Audit ()

@property (nonatomic, strong) Audit$AP$ * internal;

@end

@implementation Audit

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

- (NSString *)actionTaken {
    return ThreadSafeReturn(^id{
        return self.internal.actionTaken;
    });
}

- (void)setActionTaken:(NSString *)actionTaken {
    ThreadSafe(^{
        self.internal.actionTaken = actionTaken;
    });
}

- (NSDate *)actionTime {
    return ThreadSafeReturn(^id{
        return self.internal.actionTime;
    });
}

- (void)setActionTime:(NSDate *)actionTime {
    ThreadSafe(^{
        self.internal.actionTime = actionTime;
    });
}

- (NSNumber *)patientId {
    return ThreadSafeReturn(^id{
        return self.internal.patientId;
    });
}

- (void)setPatientId:(NSNumber *)patientId {
    ThreadSafe(^{
        self.internal.patientId = patientId;
    });
}

- (NSNumber *)recObjectId {
    return ThreadSafeReturn(^id{
        return self.internal.recObjectId;
    });
}

- (void)setRecObjectId:(NSNumber *)recObjectId {
    ThreadSafe(^{
        self.internal.recObjectId = recObjectId;
    });
}

- (NSString *)recObjectName {
    return ThreadSafeReturn(^id{
        return self.internal.recObjectName;
    });
}

- (void)setRecObjectName:(NSString *)recObjectName {
    ThreadSafe(^{
        self.internal.recObjectName = recObjectName;
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
