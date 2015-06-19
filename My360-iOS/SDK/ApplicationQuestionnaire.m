//
//  ApplicationQuestionnaire.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "ApplicationQuestionnaire.h"
#import "ApplicationQuestionnaire$AP$.h"
#import "AnyPresenceAPI.h"

@interface ApplicationQuestionnaire ()

@property (nonatomic, strong) ApplicationQuestionnaire$AP$ * internal;

@end

@implementation ApplicationQuestionnaire

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

- (NSString *)columnEight {
    return ThreadSafeReturn(^id{
        return self.internal.columnEight;
    });
}

- (void)setColumnEight:(NSString *)columnEight {
    ThreadSafe(^{
        self.internal.columnEight = columnEight;
    });
}

- (NSString *)columnEighteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnEighteen;
    });
}

- (void)setColumnEighteen:(NSString *)columnEighteen {
    ThreadSafe(^{
        self.internal.columnEighteen = columnEighteen;
    });
}

- (NSString *)columnEleven {
    return ThreadSafeReturn(^id{
        return self.internal.columnEleven;
    });
}

- (void)setColumnEleven:(NSString *)columnEleven {
    ThreadSafe(^{
        self.internal.columnEleven = columnEleven;
    });
}

- (NSString *)columnFifteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnFifteen;
    });
}

- (void)setColumnFifteen:(NSString *)columnFifteen {
    ThreadSafe(^{
        self.internal.columnFifteen = columnFifteen;
    });
}

- (NSString *)columnFive {
    return ThreadSafeReturn(^id{
        return self.internal.columnFive;
    });
}

- (void)setColumnFive:(NSString *)columnFive {
    ThreadSafe(^{
        self.internal.columnFive = columnFive;
    });
}

- (NSString *)columnFour {
    return ThreadSafeReturn(^id{
        return self.internal.columnFour;
    });
}

- (void)setColumnFour:(NSString *)columnFour {
    ThreadSafe(^{
        self.internal.columnFour = columnFour;
    });
}

- (NSString *)columnFourteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnFourteen;
    });
}

- (void)setColumnFourteen:(NSString *)columnFourteen {
    ThreadSafe(^{
        self.internal.columnFourteen = columnFourteen;
    });
}

- (NSString *)columnNine {
    return ThreadSafeReturn(^id{
        return self.internal.columnNine;
    });
}

- (void)setColumnNine:(NSString *)columnNine {
    ThreadSafe(^{
        self.internal.columnNine = columnNine;
    });
}

- (NSString *)columnNineteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnNineteen;
    });
}

- (void)setColumnNineteen:(NSString *)columnNineteen {
    ThreadSafe(^{
        self.internal.columnNineteen = columnNineteen;
    });
}

- (NSString *)columnOne {
    return ThreadSafeReturn(^id{
        return self.internal.columnOne;
    });
}

- (void)setColumnOne:(NSString *)columnOne {
    ThreadSafe(^{
        self.internal.columnOne = columnOne;
    });
}

- (NSString *)columnSeven {
    return ThreadSafeReturn(^id{
        return self.internal.columnSeven;
    });
}

- (void)setColumnSeven:(NSString *)columnSeven {
    ThreadSafe(^{
        self.internal.columnSeven = columnSeven;
    });
}

- (NSString *)columnSeventeen {
    return ThreadSafeReturn(^id{
        return self.internal.columnSeventeen;
    });
}

- (void)setColumnSeventeen:(NSString *)columnSeventeen {
    ThreadSafe(^{
        self.internal.columnSeventeen = columnSeventeen;
    });
}

- (NSString *)columnSix {
    return ThreadSafeReturn(^id{
        return self.internal.columnSix;
    });
}

- (void)setColumnSix:(NSString *)columnSix {
    ThreadSafe(^{
        self.internal.columnSix = columnSix;
    });
}

- (NSString *)columnSixteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnSixteen;
    });
}

- (void)setColumnSixteen:(NSString *)columnSixteen {
    ThreadSafe(^{
        self.internal.columnSixteen = columnSixteen;
    });
}

- (NSString *)columnTen {
    return ThreadSafeReturn(^id{
        return self.internal.columnTen;
    });
}

- (void)setColumnTen:(NSString *)columnTen {
    ThreadSafe(^{
        self.internal.columnTen = columnTen;
    });
}

- (NSString *)columnThirteen {
    return ThreadSafeReturn(^id{
        return self.internal.columnThirteen;
    });
}

- (void)setColumnThirteen:(NSString *)columnThirteen {
    ThreadSafe(^{
        self.internal.columnThirteen = columnThirteen;
    });
}

- (NSString *)columnThree {
    return ThreadSafeReturn(^id{
        return self.internal.columnThree;
    });
}

- (void)setColumnThree:(NSString *)columnThree {
    ThreadSafe(^{
        self.internal.columnThree = columnThree;
    });
}

- (NSString *)columnTwelve {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwelve;
    });
}

- (void)setColumnTwelve:(NSString *)columnTwelve {
    ThreadSafe(^{
        self.internal.columnTwelve = columnTwelve;
    });
}

- (NSString *)columnTwenty {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwenty;
    });
}

- (void)setColumnTwenty:(NSString *)columnTwenty {
    ThreadSafe(^{
        self.internal.columnTwenty = columnTwenty;
    });
}

- (NSString *)columnTwentyfive {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentyfive;
    });
}

- (void)setColumnTwentyfive:(NSString *)columnTwentyfive {
    ThreadSafe(^{
        self.internal.columnTwentyfive = columnTwentyfive;
    });
}

- (NSString *)columnTwentyfour {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentyfour;
    });
}

- (void)setColumnTwentyfour:(NSString *)columnTwentyfour {
    ThreadSafe(^{
        self.internal.columnTwentyfour = columnTwentyfour;
    });
}

- (NSString *)columnTwentyone {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentyone;
    });
}

- (void)setColumnTwentyone:(NSString *)columnTwentyone {
    ThreadSafe(^{
        self.internal.columnTwentyone = columnTwentyone;
    });
}

- (NSString *)columnTwentythree {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentythree;
    });
}

- (void)setColumnTwentythree:(NSString *)columnTwentythree {
    ThreadSafe(^{
        self.internal.columnTwentythree = columnTwentythree;
    });
}

- (NSString *)columnTwentytwo {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwentytwo;
    });
}

- (void)setColumnTwentytwo:(NSString *)columnTwentytwo {
    ThreadSafe(^{
        self.internal.columnTwentytwo = columnTwentytwo;
    });
}

- (NSString *)columnTwo {
    return ThreadSafeReturn(^id{
        return self.internal.columnTwo;
    });
}

- (void)setColumnTwo:(NSString *)columnTwo {
    ThreadSafe(^{
        self.internal.columnTwo = columnTwo;
    });
}

- (NSNumber *)isActive {
    return ThreadSafeReturn(^id{
        return self.internal.isActive;
    });
}

- (void)setIsActive:(NSNumber *)isActive {
    ThreadSafe(^{
        self.internal.isActive = isActive;
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
