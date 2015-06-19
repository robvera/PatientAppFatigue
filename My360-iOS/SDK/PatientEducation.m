//
//  PatientEducation.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientEducation.h"
#import "PatientEducation$AP$.h"
#import "EducationalReading.h"
#import "AnyPresenceAPI.h"

@interface PatientEducation ()

@property (nonatomic, strong) PatientEducation$AP$ * internal;

@end

@implementation PatientEducation

@synthesize educationalReading = _educationalReading;

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

- (NSString *)educationalReadingDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.educationalReadingDenormalized;
    });
}

- (void)setEducationalReadingDenormalized:(NSString *)educationalReadingDenormalized {
    ThreadSafe(^{
        self.internal.educationalReadingDenormalized = educationalReadingDenormalized;
    });
}

- (NSNumber *)educationalReadingId {
    return ThreadSafeReturn(^id{
        return self.internal.educationalReadingId;
    });
}

- (void)setEducationalReadingId:(NSNumber *)educationalReadingId {
    ThreadSafe(^{
        self.internal.educationalReadingId = educationalReadingId;
    });
}

- (NSString *)educationalReadingUrl {
    return ThreadSafeReturn(^id{
        return self.internal.educationalReadingUrl;
    });
}

- (void)setEducationalReadingUrl:(NSString *)educationalReadingUrl {
    ThreadSafe(^{
        self.internal.educationalReadingUrl = educationalReadingUrl;
    });
}

- (NSNumber *)favorite {
    return ThreadSafeReturn(^id{
        return self.internal.favorite;
    });
}

- (void)setFavorite:(NSNumber *)favorite {
    ThreadSafe(^{
        self.internal.favorite = favorite;
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

- (EducationalReading *)educationalReading {
    if (!_educationalReading && self.internal.educationalReading) {
        _educationalReading = [[EducationalReading alloc] initWithInternal:(APInternalObject *)self.internal.educationalReading];
    }
    
    return _educationalReading;
}

- (void)setEducationalReading:(EducationalReading *)educationalReading {
    if (_educationalReading != educationalReading) {
        _educationalReading = educationalReading;
        
        ThreadSafe(^{
            self.internal.educationalReading = (id)educationalReading.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.educationalReading" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.educationalReading"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.educationalReading"]) {
        _educationalReading = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
