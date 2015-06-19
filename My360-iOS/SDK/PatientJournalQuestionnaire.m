//
//  PatientJournalQuestionnaire.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientJournalQuestionnaire.h"
#import "PatientJournalQuestionnaire$AP$.h"
#import "PatientJournal.h"
#import "AnyPresenceAPI.h"

@interface PatientJournalQuestionnaire ()

@property (nonatomic, strong) PatientJournalQuestionnaire$AP$ * internal;

@end

@implementation PatientJournalQuestionnaire

@synthesize patientJournal = _patientJournal;

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

- (NSNumber *)applicationQuestionnaireId {
    return ThreadSafeReturn(^id{
        return self.internal.applicationQuestionnaireId;
    });
}

- (void)setApplicationQuestionnaireId:(NSNumber *)applicationQuestionnaireId {
    ThreadSafe(^{
        self.internal.applicationQuestionnaireId = applicationQuestionnaireId;
    });
}

- (NSNumber *)columnEight {
    return ThreadSafeReturn(^id{
        return self.internal.columnEight;
    });
}

- (void)setColumnEight:(NSNumber *)columnEight {
    ThreadSafe(^{
        self.internal.columnEight = columnEight;
    });
}

- (NSNumber *)columnEighteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnEighteen;
    });
}

- (void)setColumnEighteen:(NSNumber *)columnEighteen {
    ThreadSafe(^{
        self.internal.columnEighteen = columnEighteen;
    });
}

- (NSNumber *)columnEleven {
    return ThreadSafeReturn(^id{
        return self.internal.columnEleven;
    });
}

- (void)setColumnEleven:(NSNumber *)columnEleven {
    ThreadSafe(^{
        self.internal.columnEleven = columnEleven;
    });
}

- (NSNumber *)columnFifteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnFifteen;
    });
}

- (void)setColumnFifteen:(NSNumber *)columnFifteen {
    ThreadSafe(^{
        self.internal.columnFifteen = columnFifteen;
    });
}

- (NSNumber *)columnFive {
    return ThreadSafeReturn(^id{
        return self.internal.columnFive;
    });
}

- (void)setColumnFive:(NSNumber *)columnFive {
    ThreadSafe(^{
        self.internal.columnFive = columnFive;
    });
}

- (NSNumber *)columnFour {
    return ThreadSafeReturn(^id{
        return self.internal.columnFour;
    });
}

- (void)setColumnFour:(NSNumber *)columnFour {
    ThreadSafe(^{
        self.internal.columnFour = columnFour;
    });
}

- (NSNumber *)columnFourteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnFourteen;
    });
}

- (void)setColumnFourteen:(NSNumber *)columnFourteen {
    ThreadSafe(^{
        self.internal.columnFourteen = columnFourteen;
    });
}

- (NSNumber *)columnNine {
    return ThreadSafeReturn(^id{
        return self.internal.columnNine;
    });
}

- (void)setColumnNine:(NSNumber *)columnNine {
    ThreadSafe(^{
        self.internal.columnNine = columnNine;
    });
}

- (NSNumber *)columnNineteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnNineteen;
    });
}

- (void)setColumnNineteen:(NSNumber *)columnNineteen {
    ThreadSafe(^{
        self.internal.columnNineteen = columnNineteen;
    });
}

- (NSNumber *)columnOne {
    return ThreadSafeReturn(^id{
        return self.internal.columnOne;
    });
}

- (void)setColumnOne:(NSNumber *)columnOne {
    ThreadSafe(^{
        self.internal.columnOne = columnOne;
    });
}

- (NSNumber *)columnSeven {
    return ThreadSafeReturn(^id{
        return self.internal.columnSeven;
    });
}

- (void)setColumnSeven:(NSNumber *)columnSeven {
    ThreadSafe(^{
        self.internal.columnSeven = columnSeven;
    });
}

- (NSNumber *)columnSeventeen {
    return ThreadSafeReturn(^id{
        return self.internal.columnSeventeen;
    });
}

- (void)setColumnSeventeen:(NSNumber *)columnSeventeen {
    ThreadSafe(^{
        self.internal.columnSeventeen = columnSeventeen;
    });
}

- (NSNumber *)columnSix {
    return ThreadSafeReturn(^id{
        return self.internal.columnSix;
    });
}

- (void)setColumnSix:(NSNumber *)columnSix {
    ThreadSafe(^{
        self.internal.columnSix = columnSix;
    });
}

- (NSNumber *)columnSixteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnSixteen;
    });
}

- (void)setColumnSixteen:(NSNumber *)columnSixteen {
    ThreadSafe(^{
        self.internal.columnSixteen = columnSixteen;
    });
}

- (NSNumber *)columnTen {
    return ThreadSafeReturn(^id{
        return self.internal.columnTen;
    });
}

- (void)setColumnTen:(NSNumber *)columnTen {
    ThreadSafe(^{
        self.internal.columnTen = columnTen;
    });
}

- (NSNumber *)columnThirteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnThirteen;
    });
}

- (void)setColumnThirteen:(NSNumber *)columnThirteen {
    ThreadSafe(^{
        self.internal.columnThirteen = columnThirteen;
    });
}

- (NSNumber *)columnThree {
    return ThreadSafeReturn(^id{
        return self.internal.columnThree;
    });
}

- (void)setColumnThree:(NSNumber *)columnThree {
    ThreadSafe(^{
        self.internal.columnThree = columnThree;
    });
}

- (NSNumber *)columnTwelve {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwelve;
    });
}

- (void)setColumnTwelve:(NSNumber *)columnTwelve {
    ThreadSafe(^{
        self.internal.columnTwelve = columnTwelve;
    });
}

- (NSNumber *)columnTwenty {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwenty;
    });
}

- (void)setColumnTwenty:(NSNumber *)columnTwenty {
    ThreadSafe(^{
        self.internal.columnTwenty = columnTwenty;
    });
}

- (NSNumber *)columnTwentyfive {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentyfive;
    });
}

- (void)setColumnTwentyfive:(NSNumber *)columnTwentyfive {
    ThreadSafe(^{
        self.internal.columnTwentyfive = columnTwentyfive;
    });
}

- (NSNumber *)columnTwentyfour {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentyfour;
    });
}

- (void)setColumnTwentyfour:(NSNumber *)columnTwentyfour {
    ThreadSafe(^{
        self.internal.columnTwentyfour = columnTwentyfour;
    });
}

- (NSNumber *)columnTwentyone {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentyone;
    });
}

- (void)setColumnTwentyone:(NSNumber *)columnTwentyone {
    ThreadSafe(^{
        self.internal.columnTwentyone = columnTwentyone;
    });
}

- (NSNumber *)columnTwentythree {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentythree;
    });
}

- (void)setColumnTwentythree:(NSNumber *)columnTwentythree {
    ThreadSafe(^{
        self.internal.columnTwentythree = columnTwentythree;
    });
}

- (NSNumber *)columnTwentytwo {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentytwo;
    });
}

- (void)setColumnTwentytwo:(NSNumber *)columnTwentytwo {
    ThreadSafe(^{
        self.internal.columnTwentytwo = columnTwentytwo;
    });
}

- (NSNumber *)columnTwo {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwo;
    });
}

- (void)setColumnTwo:(NSNumber *)columnTwo {
    ThreadSafe(^{
        self.internal.columnTwo = columnTwo;
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

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.patientJournal" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.patientJournal"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.patientJournal"]) {
        _patientJournal = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
