//
//  PatientReminder.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientReminder.h"
#import "PatientReminder$AP$.h"
#import "ReminderType.h"
#import "AnyPresenceAPI.h"

@interface PatientReminder ()

@property (nonatomic, strong) PatientReminder$AP$ * internal;

@end

@implementation PatientReminder

@synthesize reminderType = _reminderType;

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

- (NSNumber *)archived {
    return ThreadSafeReturn(^id{
        return self.internal.archived;
    });
}

- (void)setArchived:(NSNumber *)archived {
    ThreadSafe(^{
        self.internal.archived = archived;
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

- (NSNumber *)patientTreatmentId {
    return ThreadSafeReturn(^id{
        return self.internal.patientTreatmentId;
    });
}

- (void)setPatientTreatmentId:(NSNumber *)patientTreatmentId {
    ThreadSafe(^{
        self.internal.patientTreatmentId = patientTreatmentId;
    });
}

- (NSString *)reminderMessage {
    return ThreadSafeReturn(^id{
        return self.internal.reminderMessage;
    });
}

- (void)setReminderMessage:(NSString *)reminderMessage {
    ThreadSafe(^{
        self.internal.reminderMessage = reminderMessage;
    });
}

- (NSDate *)reminderOn {
    return ThreadSafeReturn(^id{
        return self.internal.reminderOn;
    });
}

- (void)setReminderOn:(NSDate *)reminderOn {
    ThreadSafe(^{
        self.internal.reminderOn = reminderOn;
    });
}

- (NSString *)reminderTypeDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.reminderTypeDenormalized;
    });
}

- (void)setReminderTypeDenormalized:(NSString *)reminderTypeDenormalized {
    ThreadSafe(^{
        self.internal.reminderTypeDenormalized = reminderTypeDenormalized;
    });
}

- (NSNumber *)reminderTypeId {
    return ThreadSafeReturn(^id{
        return self.internal.reminderTypeId;
    });
}

- (void)setReminderTypeId:(NSNumber *)reminderTypeId {
    ThreadSafe(^{
        self.internal.reminderTypeId = reminderTypeId;
    });
}

- (NSNumber *)unread {
    return ThreadSafeReturn(^id{
        return self.internal.unread;
    });
}

- (void)setUnread:(NSNumber *)unread {
    ThreadSafe(^{
        self.internal.unread = unread;
    });
}

- (ReminderType *)reminderType {
    if (!_reminderType && self.internal.reminderType) {
        _reminderType = [[ReminderType alloc] initWithInternal:(APInternalObject *)self.internal.reminderType];
    }
    
    return _reminderType;
}

- (void)setReminderType:(ReminderType *)reminderType {
    if (_reminderType != reminderType) {
        _reminderType = reminderType;
        
        ThreadSafe(^{
            self.internal.reminderType = (id)reminderType.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.reminderType" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.reminderType"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.reminderType"]) {
        _reminderType = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
