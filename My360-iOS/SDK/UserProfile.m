//
//  UserProfile.m
//  AnyPresence SDK
//

#import "APObject+Internal.h"
#import "APObject+Remote.h"
#import "APObject+RemoteID.h"
#import "APObject+Local.h"
#import "APObject+RemoteConfig.h"
#import "APObjectRemoteConfig.h"
#import "UserProfile.h"
#import "UserProfile$AP$.h"
#import "AnyPresenceAPI.h"

@interface UserProfile ()

@property (nonatomic, strong) UserProfile$AP$ * internal;

@end

@implementation UserProfile

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

- (NSNumber *)allergiesSet {
    return ThreadSafeReturn(^id{
        return self.internal.allergiesSet;
    });
}

- (void)setAllergiesSet:(NSNumber *)allergiesSet {
    ThreadSafe(^{
        self.internal.allergiesSet = allergiesSet;
    });
}

- (NSString *)city {
    return ThreadSafeReturn(^id{
        return self.internal.city;
    });
}

- (void)setCity:(NSString *)city {
    ThreadSafe(^{
        self.internal.city = city;
    });
}

- (NSDate *)dob {
    return ThreadSafeReturn(^id{
        return self.internal.dob;
    });
}

- (void)setDob:(NSDate *)dob {
    ThreadSafe(^{
        self.internal.dob = dob;
    });
}

- (NSNumber *)educationalReadingsAlter {
    return ThreadSafeReturn(^id{
        return self.internal.educationalReadingsAlter;
    });
}

- (void)setEducationalReadingsAlter:(NSNumber *)educationalReadingsAlter {
    ThreadSafe(^{
        self.internal.educationalReadingsAlter = educationalReadingsAlter;
    });
}

- (NSString *)email {
    return ThreadSafeReturn(^id{
        return self.internal.email;
    });
}

- (void)setEmail:(NSString *)email {
    ThreadSafe(^{
        self.internal.email = email;
    });
}

- (NSString *)firstName {
    return ThreadSafeReturn(^id{
        return self.internal.firstName;
    });
}

- (void)setFirstName:(NSString *)firstName {
    ThreadSafe(^{
        self.internal.firstName = firstName;
    });
}

- (NSNumber *)foodAllergies {
    return ThreadSafeReturn(^id{
        return self.internal.foodAllergies;
    });
}

- (void)setFoodAllergies:(NSNumber *)foodAllergies {
    ThreadSafe(^{
        self.internal.foodAllergies = foodAllergies;
    });
}

- (NSString *)gender {
    return ThreadSafeReturn(^id{
        return self.internal.gender;
    });
}

- (void)setGender:(NSString *)gender {
    ThreadSafe(^{
        self.internal.gender = gender;
    });
}

- (NSNumber *)goalCholesterol {
    return ThreadSafeReturn(^id{
        return self.internal.goalCholesterol;
    });
}

- (void)setGoalCholesterol:(NSNumber *)goalCholesterol {
    ThreadSafe(^{
        self.internal.goalCholesterol = goalCholesterol;
    });
}

- (NSNumber *)goalHbaonec {
    return ThreadSafeReturn(^id{
        return self.internal.goalHbaonec;
    });
}

- (void)setGoalHbaonec:(NSNumber *)goalHbaonec {
    ThreadSafe(^{
        self.internal.goalHbaonec = goalHbaonec;
    });
}

- (NSNumber *)goalWeight {
    return ThreadSafeReturn(^id{
        return self.internal.goalWeight;
    });
}

- (void)setGoalWeight:(NSNumber *)goalWeight {
    ThreadSafe(^{
        self.internal.goalWeight = goalWeight;
    });
}

- (NSNumber *)height {
    return ThreadSafeReturn(^id{
        return self.internal.height;
    });
}

- (void)setHeight:(NSNumber *)height {
    ThreadSafe(^{
        self.internal.height = height;
    });
}

- (NSNumber *)labApptReminderAlert {
    return ThreadSafeReturn(^id{
        return self.internal.labApptReminderAlert;
    });
}

- (void)setLabApptReminderAlert:(NSNumber *)labApptReminderAlert {
    ThreadSafe(^{
        self.internal.labApptReminderAlert = labApptReminderAlert;
    });
}

- (NSNumber *)lastLoginAlert {
    return ThreadSafeReturn(^id{
        return self.internal.lastLoginAlert;
    });
}

- (void)setLastLoginAlert:(NSNumber *)lastLoginAlert {
    ThreadSafe(^{
        self.internal.lastLoginAlert = lastLoginAlert;
    });
}

- (NSDate *)lastLoginTimestamp {
    return ThreadSafeReturn(^id{
        return self.internal.lastLoginTimestamp;
    });
}

- (void)setLastLoginTimestamp:(NSDate *)lastLoginTimestamp {
    ThreadSafe(^{
        self.internal.lastLoginTimestamp = lastLoginTimestamp;
    });
}

- (NSString *)lastName {
    return ThreadSafeReturn(^id{
        return self.internal.lastName;
    });
}

- (void)setLastName:(NSString *)lastName {
    ThreadSafe(^{
        self.internal.lastName = lastName;
    });
}

- (NSNumber *)logInCounter {
    return ThreadSafeReturn(^id{
        return self.internal.logInCounter;
    });
}

- (void)setLogInCounter:(NSNumber *)logInCounter {
    ThreadSafe(^{
        self.internal.logInCounter = logInCounter;
    });
}

- (NSNumber *)medicationAllergies {
    return ThreadSafeReturn(^id{
        return self.internal.medicationAllergies;
    });
}

- (void)setMedicationAllergies:(NSNumber *)medicationAllergies {
    ThreadSafe(^{
        self.internal.medicationAllergies = medicationAllergies;
    });
}

- (NSString *)password {
    return ThreadSafeReturn(^id{
        return self.internal.password;
    });
}

- (void)setPassword:(NSString *)password {
    ThreadSafe(^{
        self.internal.password = password;
    });
}

- (NSString *)passwordConfirmation {
    return ThreadSafeReturn(^id{
        return self.internal.passwordConfirmation;
    });
}

- (void)setPasswordConfirmation:(NSString *)passwordConfirmation {
    ThreadSafe(^{
        self.internal.passwordConfirmation = passwordConfirmation;
    });
}

- (NSString *)passwordDigest {
    return ThreadSafeReturn(^id{
        return self.internal.passwordDigest;
    });
}

- (void)setPasswordDigest:(NSString *)passwordDigest {
    ThreadSafe(^{
        self.internal.passwordDigest = passwordDigest;
    });
}

- (NSNumber *)resetPassword {
    return ThreadSafeReturn(^id{
        return self.internal.resetPassword;
    });
}

- (void)setResetPassword:(NSNumber *)resetPassword {
    ThreadSafe(^{
        self.internal.resetPassword = resetPassword;
    });
}

- (NSString *)role {
    return ThreadSafeReturn(^id{
        return self.internal.role;
    });
}

- (void)setRole:(NSString *)role {
    ThreadSafe(^{
        self.internal.role = role;
    });
}

- (NSNumber *)seasonalAllergies {
    return ThreadSafeReturn(^id{
        return self.internal.seasonalAllergies;
    });
}

- (void)setSeasonalAllergies:(NSNumber *)seasonalAllergies {
    ThreadSafe(^{
        self.internal.seasonalAllergies = seasonalAllergies;
    });
}

- (NSString *)state {
    return ThreadSafeReturn(^id{
        return self.internal.state;
    });
}

- (void)setState:(NSString *)state {
    ThreadSafe(^{
        self.internal.state = state;
    });
}

- (NSNumber *)treatmentScheduleAlert {
    return ThreadSafeReturn(^id{
        return self.internal.treatmentScheduleAlert;
    });
}

- (void)setTreatmentScheduleAlert:(NSNumber *)treatmentScheduleAlert {
    ThreadSafe(^{
        self.internal.treatmentScheduleAlert = treatmentScheduleAlert;
    });
}

- (NSNumber *)weight {
    return ThreadSafeReturn(^id{
        return self.internal.weight;
    });
}

- (void)setWeight:(NSNumber *)weight {
    ThreadSafe(^{
        self.internal.weight = weight;
    });
}

- (NSString *)zipcode {
    return ThreadSafeReturn(^id{
        return self.internal.zipcode;
    });
}

- (void)setZipcode:(NSString *)zipcode {
    ThreadSafe(^{
        self.internal.zipcode = zipcode;
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
