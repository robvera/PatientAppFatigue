//
//  PatientFatigueAnswer.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientFatigueAnswer.h"
#import "PatientFatigueAnswer$AP$.h"
#import "PatientFatigueResult.h"
#import "AnyPresenceAPI.h"

@interface PatientFatigueAnswer ()

@property (nonatomic, strong) PatientFatigueAnswer$AP$ * internal;

@end

@implementation PatientFatigueAnswer

@synthesize patientFatigueResult = _patientFatigueResult;

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

- (NSNumber *)answer {
    return ThreadSafeReturn(^id{
        return self.internal.answer;
    });
}

- (void)setAnswer:(NSNumber *)answer {
    ThreadSafe(^{
        self.internal.answer = answer;
    });
}

- (NSNumber *)patientFatigueResultId {
    return ThreadSafeReturn(^id{
        return self.internal.patientFatigueResultId;
    });
}

- (void)setPatientFatigueResultId:(NSNumber *)patientFatigueResultId {
    ThreadSafe(^{
        self.internal.patientFatigueResultId = patientFatigueResultId;
    });
}

- (NSString *)question {
    return ThreadSafeReturn(^id{
        return self.internal.question;
    });
}

- (void)setQuestion:(NSString *)question {
    ThreadSafe(^{
        self.internal.question = question;
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

- (PatientFatigueResult *)patientFatigueResult {
    if (!_patientFatigueResult && self.internal.patientFatigueResult) {
        _patientFatigueResult = [[PatientFatigueResult alloc] initWithInternal:(APInternalObject *)self.internal.patientFatigueResult];
    }
    
    return _patientFatigueResult;
}

- (void)setPatientFatigueResult:(PatientFatigueResult *)patientFatigueResult {
    if (_patientFatigueResult != patientFatigueResult) {
        _patientFatigueResult = patientFatigueResult;
        
        ThreadSafe(^{
            self.internal.patientFatigueResult = (id)patientFatigueResult.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientFatigueResult" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientFatigueResult"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientFatigueResult"]) {
        _patientFatigueResult = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
