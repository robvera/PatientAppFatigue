//
//  Chart.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Chart.h"
#import "Chart$AP$.h"
#import "AnyPresenceAPI.h"

@interface Chart ()

@property (nonatomic, strong) Chart$AP$ * internal;

@end

@implementation Chart

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

- (NSDictionary *)chartdata {
    return ThreadSafeReturn(^id{
        return self.internal.chartdata;
    });
}

- (void)setChartdata:(NSDictionary *)chartdata {
    ThreadSafe(^{
        self.internal.chartdata = chartdata;
    });
}

- (NSString *)chartName {
    return ThreadSafeReturn(^id{
        return self.internal.chartName;
    });
}

- (void)setChartName:(NSString *)chartName {
    ThreadSafe(^{
        self.internal.chartName = chartName;
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
