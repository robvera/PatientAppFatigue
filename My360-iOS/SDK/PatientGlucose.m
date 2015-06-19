//
//  PatientGlucose.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientGlucose.h"
#import "PatientGlucose$AP$.h"
#import "AnyPresenceAPI.h"

@interface PatientGlucose ()

@property (nonatomic, strong) PatientGlucose$AP$ * internal;

@end

@implementation PatientGlucose

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

- (NSNumber *)carbohydrates {
    return ThreadSafeReturn(^id{
        return self.internal.carbohydrates;
    });
}

- (void)setCarbohydrates:(NSNumber *)carbohydrates {
    ThreadSafe(^{
        self.internal.carbohydrates = carbohydrates;
    });
}

- (NSString *)glucoseLevel {
    return ThreadSafeReturn(^id{
        return self.internal.glucoseLevel;
    });
}

- (void)setGlucoseLevel:(NSString *)glucoseLevel {
    ThreadSafe(^{
        self.internal.glucoseLevel = glucoseLevel;
    });
}

- (NSDate *)glucoseOn {
    return ThreadSafeReturn(^id{
        return self.internal.glucoseOn;
    });
}

- (void)setGlucoseOn:(NSDate *)glucoseOn {
    ThreadSafe(^{
        self.internal.glucoseOn = glucoseOn;
    });
}

- (NSNumber *)glucoseReading {
    return ThreadSafeReturn(^id{
        return self.internal.glucoseReading;
    });
}

- (void)setGlucoseReading:(NSNumber *)glucoseReading {
    ThreadSafe(^{
        self.internal.glucoseReading = glucoseReading;
    });
}

- (NSNumber *)insulin {
    return ThreadSafeReturn(^id{
        return self.internal.insulin;
    });
}

- (void)setInsulin:(NSNumber *)insulin {
    ThreadSafe(^{
        self.internal.insulin = insulin;
    });
}

- (NSString *)notes {
    return ThreadSafeReturn(^id{
        return self.internal.notes;
    });
}

- (void)setNotes:(NSString *)notes {
    ThreadSafe(^{
        self.internal.notes = notes;
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

- (NSString *)timeFrame {
    return ThreadSafeReturn(^id{
        return self.internal.timeFrame;
    });
}

- (void)setTimeFrame:(NSString *)timeFrame {
    ThreadSafe(^{
        self.internal.timeFrame = timeFrame;
    });
}

- (NSNumber *)timeFrameSortId {
    return ThreadSafeReturn(^id{
        return self.internal.timeFrameSortId;
    });
}

- (void)setTimeFrameSortId:(NSNumber *)timeFrameSortId {
    ThreadSafe(^{
        self.internal.timeFrameSortId = timeFrameSortId;
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
