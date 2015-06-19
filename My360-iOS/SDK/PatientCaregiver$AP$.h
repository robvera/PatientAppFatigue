//
//  PatientCaregiver$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Patient$AP$;

@interface PatientCaregiver$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSNumber * emailNotifications;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSNumber * smsNotifications;
@property (nonatomic, strong) Patient$AP$ * patient;

@end
