//
//  LabResultStat.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "LabResultStat.h"
#import "LabResultStat$AP$.h"
#import "PatientLabResult.h"
#import "AnyPresenceAPI.h"

@interface LabResultStat ()

@property (nonatomic, strong) LabResultStat$AP$ * internal;

@end

@implementation LabResultStat

@synthesize patientLabResults = _patientLabResults;

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

- (NSNumber *)inactive {
    return ThreadSafeReturn(^id{
        return self.internal.inactive;
    });
}

- (void)setInactive:(NSNumber *)inactive {
    ThreadSafe(^{
        self.internal.inactive = inactive;
    });
}

- (NSString *)name {
    return ThreadSafeReturn(^id{
        return self.internal.name;
    });
}

- (void)setName:(NSString *)name {
    ThreadSafe(^{
        self.internal.name = name;
    });
}

- (NSOrderedSet *)patientLabResults {
    if (!_patientLabResults) {
        _patientLabResults = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientLabResults.count];
            for (APInternalObject * internal in self.internal.patientLabResults) {
                PatientLabResult * obj = [[PatientLabResult alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientLabResults;
}

- (void)setPatientLabResults:(NSOrderedSet *)patientLabResults {
    if (_patientLabResults != patientLabResults) {
        _patientLabResults = patientLabResults;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientLabResults.count];
        for (PatientLabResult * obj in patientLabResults) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientLabResults = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientLabResults" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientLabResults"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientLabResults"]) {
        _patientLabResults = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
