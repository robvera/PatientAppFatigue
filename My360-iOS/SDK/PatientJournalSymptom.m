//
//  PatientJournalSymptom.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientJournalSymptom.h"
#import "PatientJournalSymptom$AP$.h"
#import "PatientJournal.h"
#import "Symptom.h"
#import "AnyPresenceAPI.h"

@interface PatientJournalSymptom ()

@property (nonatomic, strong) PatientJournalSymptom$AP$ * internal;

@end

@implementation PatientJournalSymptom

@synthesize patientJournal = _patientJournal;

@synthesize symptom = _symptom;

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

- (NSNumber *)patientJournalId {
    return ThreadSafeReturn(^id{
        return self.internal.patientJournalId;
    });
}

- (void)setPatientJournalId:(NSNumber *)patientJournalId {
    ThreadSafe(^{
        self.internal.patientJournalId = patientJournalId;
    });
}

- (NSNumber *)symptomId {
    return ThreadSafeReturn(^id{
        return self.internal.symptomId;
    });
}

- (void)setSymptomId:(NSNumber *)symptomId {
    ThreadSafe(^{
        self.internal.symptomId = symptomId;
    });
}

- (PatientJournal *)patientJournal {
    if (!_patientJournal && self.internal.patientJournal) {
        _patientJournal = [[PatientJournal alloc] initWithInternal:(APInternalObject *)self.internal.patientJournal];
    }
    
    return _patientJournal;
}

- (void)setPatientJournal:(PatientJournal *)patientJournal {
    if (_patientJournal != patientJournal) {
        _patientJournal = patientJournal;
        
        ThreadSafe(^{
            self.internal.patientJournal = (id)patientJournal.internal;
        });
    }
}

- (Symptom *)symptom {
    if (!_symptom && self.internal.symptom) {
        _symptom = [[Symptom alloc] initWithInternal:(APInternalObject *)self.internal.symptom];
    }
    
    return _symptom;
}

- (void)setSymptom:(Symptom *)symptom {
    if (_symptom != symptom) {
        _symptom = symptom;
        
        ThreadSafe(^{
            self.internal.symptom = (id)symptom.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientJournal" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.symptom" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientJournal"];
    [self removeObserver:self forKeyPath:@"internal.symptom"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientJournal"]) {
        _patientJournal = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.symptom"]) {
        _symptom = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
