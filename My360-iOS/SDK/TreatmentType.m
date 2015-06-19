//
//  TreatmentType.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "TreatmentType.h"
#import "TreatmentType$AP$.h"
#import "PatientTreatment.h"
#import "AnyPresenceAPI.h"

@interface TreatmentType ()

@property (nonatomic, strong) TreatmentType$AP$ * internal;

@end

@implementation TreatmentType

@synthesize patientTreatments = _patientTreatments;

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

- (NSNumber *)sortId {
    return ThreadSafeReturn(^id{
        return self.internal.sortId;
    });
}

- (void)setSortId:(NSNumber *)sortId {
    ThreadSafe(^{
        self.internal.sortId = sortId;
    });
}

- (NSOrderedSet *)patientTreatments {
    if (!_patientTreatments) {
        _patientTreatments = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientTreatments.count];
            for (APInternalObject * internal in self.internal.patientTreatments) {
                PatientTreatment * obj = [[PatientTreatment alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientTreatments;
}

- (void)setPatientTreatments:(NSOrderedSet *)patientTreatments {
    if (_patientTreatments != patientTreatments) {
        _patientTreatments = patientTreatments;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientTreatments.count];
        for (PatientTreatment * obj in patientTreatments) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientTreatments = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientTreatments" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientTreatments"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientTreatments"]) {
        _patientTreatments = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
