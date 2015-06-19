//
//  PatientClinician$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Clinician$AP$;

@class Patient$AP$;

@interface PatientClinician$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * approved;
@property (nonatomic, strong) NSDate * approvedAt;
@property (nonatomic, strong) NSNumber * canClinicianRead;
@property (nonatomic, strong) NSNumber * clinicianId;
@property (nonatomic, strong) NSString * clinicianNameDenormalized;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSDate * requestedAt;
@property (nonatomic, strong) Clinician$AP$ * clinician;
@property (nonatomic, strong) Patient$AP$ * patient;

@end
