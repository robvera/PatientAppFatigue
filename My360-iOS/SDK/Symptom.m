//
//  Symptom.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "Symptom.h"
#import "Symptom$AP$.h"
#import "PatientExacerbation.h"
#import "PatientJournalSymptom.h"
#import "AnyPresenceAPI.h"

@interface Symptom ()

@property (nonatomic, strong) Symptom$AP$ * internal;

@end

@implementation Symptom

@synthesize patientExacerbations = _patientExacerbations;

@synthesize patientJournalSymptoms = _patientJournalSymptoms;

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

- (NSString *)symptomCat {
    return ThreadSafeReturn(^id{
        return self.internal.symptomCat;
    });
}

- (void)setSymptomCat:(NSString *)symptomCat {
    ThreadSafe(^{
        self.internal.symptomCat = symptomCat;
    });
}

- (NSOrderedSet *)patientExacerbations {
    if (!_patientExacerbations) {
        _patientExacerbations = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientExacerbations.count];
            for (APInternalObject * internal in self.internal.patientExacerbations) {
                PatientExacerbation * obj = [[PatientExacerbation alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientExacerbations;
}

- (void)setPatientExacerbations:(NSOrderedSet *)patientExacerbations {
    if (_patientExacerbations != patientExacerbations) {
        _patientExacerbations = patientExacerbations;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientExacerbations.count];
        for (PatientExacerbation * obj in patientExacerbations) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientExacerbations = [set copy];
        });
    }
}

- (NSOrderedSet *)patientJournalSymptoms {
    if (!_patientJournalSymptoms) {
        _patientJournalSymptoms = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientJournalSymptoms.count];
            for (APInternalObject * internal in self.internal.patientJournalSymptoms) {
                PatientJournalSymptom * obj = [[PatientJournalSymptom alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientJournalSymptoms;
}

- (void)setPatientJournalSymptoms:(NSOrderedSet *)patientJournalSymptoms {
    if (_patientJournalSymptoms != patientJournalSymptoms) {
        _patientJournalSymptoms = patientJournalSymptoms;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientJournalSymptoms.count];
        for (PatientJournalSymptom * obj in patientJournalSymptoms) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientJournalSymptoms = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientExacerbations" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.patientJournalSymptoms" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientExacerbations"];
    [self removeObserver:self forKeyPath:@"internal.patientJournalSymptoms"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientExacerbations"]) {
        _patientExacerbations = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.patientJournalSymptoms"]) {
        _patientJournalSymptoms = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
