//
//  PatientLabResult.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "PatientLabResult.h"
#import "PatientLabResult$AP$.h"
#import "LabResultStat.h"
#import "TestType.h"
#import "AnyPresenceAPI.h"

@interface PatientLabResult ()

@property (nonatomic, strong) PatientLabResult$AP$ * internal;

@end

@implementation PatientLabResult

@synthesize labResultStat = _labResultStat;

@synthesize testType = _testType;

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

- (NSNumber *)clinicianOffice {
    return ThreadSafeReturn(^id{
        return self.internal.clinicianOffice;
    });
}

- (void)setClinicianOffice:(NSNumber *)clinicianOffice {
    ThreadSafe(^{
        self.internal.clinicianOffice = clinicianOffice;
    });
}

- (NSNumber *)hospital {
    return ThreadSafeReturn(^id{
        return self.internal.hospital;
    });
}

- (void)setHospital:(NSNumber *)hospital {
    ThreadSafe(^{
        self.internal.hospital = hospital;
    });
}

- (NSDate *)labResultOn {
    return ThreadSafeReturn(^id{
        return self.internal.labResultOn;
    });
}

- (void)setLabResultOn:(NSDate *)labResultOn {
    ThreadSafe(^{
        self.internal.labResultOn = labResultOn;
    });
}

- (NSString *)labResultStatDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.labResultStatDenormalized;
    });
}

- (void)setLabResultStatDenormalized:(NSString *)labResultStatDenormalized {
    ThreadSafe(^{
        self.internal.labResultStatDenormalized = labResultStatDenormalized;
    });
}

- (NSNumber *)labResultStatId {
    return ThreadSafeReturn(^id{
        return self.internal.labResultStatId;
    });
}

- (void)setLabResultStatId:(NSNumber *)labResultStatId {
    ThreadSafe(^{
        self.internal.labResultStatId = labResultStatId;
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

- (NSString *)testTypeDenormalized {
    return ThreadSafeReturn(^id{
        return self.internal.testTypeDenormalized;
    });
}

- (void)setTestTypeDenormalized:(NSString *)testTypeDenormalized {
    ThreadSafe(^{
        self.internal.testTypeDenormalized = testTypeDenormalized;
    });
}

- (NSNumber *)testTypeId {
    return ThreadSafeReturn(^id{
        return self.internal.testTypeId;
    });
}

- (void)setTestTypeId:(NSNumber *)testTypeId {
    ThreadSafe(^{
        self.internal.testTypeId = testTypeId;
    });
}

- (LabResultStat *)labResultStat {
    if (!_labResultStat && self.internal.labResultStat) {
        _labResultStat = [[LabResultStat alloc] initWithInternal:(APInternalObject *)self.internal.labResultStat];
    }
    
    return _labResultStat;
}

- (void)setLabResultStat:(LabResultStat *)labResultStat {
    if (_labResultStat != labResultStat) {
        _labResultStat = labResultStat;
        
        ThreadSafe(^{
            self.internal.labResultStat = (id)labResultStat.internal;
        });
    }
}

- (TestType *)testType {
    if (!_testType && self.internal.testType) {
        _testType = [[TestType alloc] initWithInternal:(APInternalObject *)self.internal.testType];
    }
    
    return _testType;
}

- (void)setTestType:(TestType *)testType {
    if (_testType != testType) {
        _testType = testType;
        
        ThreadSafe(^{
            self.internal.testType = (id)testType.internal;
        });
    }
}

#pragma mark - NSObject

- (id)initWithInternal:(APInternalObject *)internal {
    if ((self = [super initWithInternal:internal])) {
        [self.class remoteConfig].remoteIDProperty = @"id";
        
    ThreadSafe(^{
        [self addObserver:self forKeyPath:@"internal.labResultStat" options:0 context:nil];
        [self addObserver:self forKeyPath:@"internal.testType" options:0 context:nil];
    });
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"internal.labResultStat"];
    [self removeObserver:self forKeyPath:@"internal.testType"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"internal.labResultStat"]) {
        _labResultStat = nil;
    } else
    if (object == self && [keyPath isEqualToString:@"internal.testType"]) {
        _testType = nil;
    } else
 {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
