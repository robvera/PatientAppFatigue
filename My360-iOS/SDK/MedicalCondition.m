//
//  MedicalCondition.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "MedicalCondition.h"
#import "MedicalCondition$AP$.h"
#import "PatientMedicalCondition.h"
#import "AnyPresenceAPI.h"

@interface MedicalCondition ()

@property (nonatomic, strong) MedicalCondition$AP$ * internal;

@end

@implementation MedicalCondition

@synthesize patientMedicalConditions = _patientMedicalConditions;

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

- (NSOrderedSet *)patientMedicalConditions {
    if (!_patientMedicalConditions) {
        _patientMedicalConditions = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientMedicalConditions.count];
            for (APInternalObject * internal in self.internal.patientMedicalConditions) {
                PatientMedicalCondition * obj = [[PatientMedicalCondition alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientMedicalConditions;
}

- (void)setPatientMedicalConditions:(NSOrderedSet *)patientMedicalConditions {
    if (_patientMedicalConditions != patientMedicalConditions) {
        _patientMedicalConditions = patientMedicalConditions;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientMedicalConditions.count];
        for (PatientMedicalCondition * obj in patientMedicalConditions) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientMedicalConditions = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientMedicalConditions" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientMedicalConditions"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientMedicalConditions"]) {
        _patientMedicalConditions = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
