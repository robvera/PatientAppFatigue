//
//  PatientFatigueResult.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientFatigueResult.h"
#import "PatientFatigueResult$AP$.h"
#import "PatientFatigueAnswer.h"
#import "AnyPresenceAPI.h"

@interface PatientFatigueResult ()

@property (nonatomic, strong) PatientFatigueResult$AP$ * internal;

@end

@implementation PatientFatigueResult

@synthesize patientFatigueAnswers = _patientFatigueAnswers;

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

- (NSNumber *)cognitiveSubscale {
    return ThreadSafeReturn(^id{
        return self.internal.cognitiveSubscale;
    });
}

- (void)setCognitiveSubscale:(NSNumber *)cognitiveSubscale {
    ThreadSafe(^{
        self.internal.cognitiveSubscale = cognitiveSubscale;
    });
}

- (NSDate *)completedOn {
    return ThreadSafeReturn(^id{
        return self.internal.completedOn;
    });
}

- (void)setCompletedOn:(NSDate *)completedOn {
    ThreadSafe(^{
        self.internal.completedOn = completedOn;
    });
}

- (NSDate *)createdOn {
    return ThreadSafeReturn(^id{
        return self.internal.createdOn;
    });
}

- (void)setCreatedOn:(NSDate *)createdOn {
    ThreadSafe(^{
        self.internal.createdOn = createdOn;
    });
}

- (NSNumber *)isCompleted {
    return ThreadSafeReturn(^id{
        return self.internal.isCompleted;
    });
}

- (void)setIsCompleted:(NSNumber *)isCompleted {
    ThreadSafe(^{
        self.internal.isCompleted = isCompleted;
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

- (NSNumber *)physicalSubscale {
    return ThreadSafeReturn(^id{
        return self.internal.physicalSubscale;
    });
}

- (void)setPhysicalSubscale:(NSNumber *)physicalSubscale {
    ThreadSafe(^{
        self.internal.physicalSubscale = physicalSubscale;
    });
}

- (NSNumber *)psychosocialSubscale {
    return ThreadSafeReturn(^id{
        return self.internal.psychosocialSubscale;
    });
}

- (void)setPsychosocialSubscale:(NSNumber *)psychosocialSubscale {
    ThreadSafe(^{
        self.internal.psychosocialSubscale = psychosocialSubscale;
    });
}

- (NSNumber *)totalSubscale {
    return ThreadSafeReturn(^id{
        return self.internal.totalSubscale;
    });
}

- (void)setTotalSubscale:(NSNumber *)totalSubscale {
    ThreadSafe(^{
        self.internal.totalSubscale = totalSubscale;
    });
}

- (NSOrderedSet *)patientFatigueAnswers {
    if (!_patientFatigueAnswers) {
        _patientFatigueAnswers = ThreadSafeReturn(^{
            NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:self.internal.patientFatigueAnswers.count];
            for (APInternalObject * internal in self.internal.patientFatigueAnswers) {
                PatientFatigueAnswer * obj = [[PatientFatigueAnswer alloc] initWithInternal:internal];
                [set addObject:obj];
            }
            
            return [set copy];
        });
    }
    
    return _patientFatigueAnswers;
}

- (void)setPatientFatigueAnswers:(NSOrderedSet *)patientFatigueAnswers {
    if (_patientFatigueAnswers != patientFatigueAnswers) {
        _patientFatigueAnswers = patientFatigueAnswers;
        
        NSMutableOrderedSet * set = [[NSMutableOrderedSet alloc] initWithCapacity:patientFatigueAnswers.count];
        for (PatientFatigueAnswer * obj in patientFatigueAnswers) {
            [set addObject:obj.internal];
        }
        
        ThreadSafe(^{
            self.internal.patientFatigueAnswers = [set copy];
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientFatigueAnswers" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientFatigueAnswers"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientFatigueAnswers"]) {
        _patientFatigueAnswers = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
