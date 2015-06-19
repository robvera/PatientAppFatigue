//
//  Clinician$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Clinician$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSString * clinicianType;
@property (nonatomic, strong) NSString * couponCode;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSOrderedSet * patientClinicians;
@property (nonatomic, strong) NSOrderedSet * educationalReadings;

@end
