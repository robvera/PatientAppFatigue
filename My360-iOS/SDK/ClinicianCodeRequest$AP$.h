//
//  ClinicianCodeRequest$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Patient$AP$;

@interface ClinicianCodeRequest$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSDate * dateRequested;
@property (nonatomic, strong) NSString * emailAddress;
@property (nonatomic, strong) NSString * fax;
@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSNumber * sendEmailFlag;
@property (nonatomic, strong) NSString * statusFlag;
@property (nonatomic, strong) Patient$AP$ * patient;

@end
