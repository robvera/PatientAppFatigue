//
//  Application.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Application.h"
#import "Application$AP$.h"
#import "Setting.h"
#import "AnyPresenceAPI.h"

@interface Application ()

@property (nonatomic, strong) Application$AP$ * internal;

@end

@implementation Application

@synthesize settings = _settings;

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

- (NSNumber *)androidAppVersion {
    return ThreadSafeReturn(^id{
        return self.internal.androidAppVersion;
    });
}

- (void)setAndroidAppVersion:(NSNumber *)androidAppVersion {
    ThreadSafe(^{
        self.internal.androidAppVersion = androidAppVersion;
    });
}

- (NSString *)appName {
    return ThreadSafeReturn(^id{
        return self.internal.appName;
    });
}

- (void)setAppName:(NSString *)appName {
    ThreadSafe(^{
        self.internal.appName = appName;
    });
}

- (NSString *)appVersion {
    return ThreadSafeReturn(^id{
        return self.internal.appVersion;
    });
}

- (void)setAppVersion:(NSString *)appVersion {
    ThreadSafe(^{
        self.internal.appVersion = appVersion;
    });
}

- (NSString *)downloadUrl {
    return ThreadSafeReturn(^id{
        return self.internal.downloadUrl;
    });
}

- (void)setDownloadUrl:(NSString *)downloadUrl {
    ThreadSafe(^{
        self.internal.downloadUrl = downloadUrl;
    });
}

- (NSOrderedSet *)settings {
    if (!_settings) {
        _settings = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.settings.count];
            for (APInternalObject * internal in self.internal.settings) {
                Setting * obj = [[Setting alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _settings;
}

- (void)setSettings:(NSOrderedSet *)settings {
    if (_settings != settings) {
        _settings = settings;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:settings.count];
        for (Setting * obj in settings) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.settings = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.settings" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.settings"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.settings"]) {
        _settings = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
