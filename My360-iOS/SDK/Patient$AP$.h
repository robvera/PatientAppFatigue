//
//  Patient$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Patient$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * allergiesSet;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSDate * dob;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSNumber * foodAllergies;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSNumber * height;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSDate * lastLoginTimestamp;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSNumber * logInCounter;
@property (nonatomic, strong) NSNumber * medicationAllergies;
@property (nonatomic, strong) NSNumber * patientAsthmaActionId;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSNumber * seasonalAllergies;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSNumber * weight;
@property (nonatomic, strong) NSString * zipcode;
@property (nonatomic, strong) NSOrderedSet * patientClinicians;
@property (nonatomic, strong) NSOrderedSet * patientCaregivers;
@property (nonatomic, strong) NSOrderedSet * patientAdherenceLogs;
@property (nonatomic, strong) NSOrderedSet * clinicianCodeRequests;
@property (nonatomic, strong) NSOrderedSet * patientApps;

@end
