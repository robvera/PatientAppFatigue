//
//  PatientMedicalCondition$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class MedicalCondition$AP$;

@interface PatientMedicalCondition$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSString * medicalConditionDenormalized;
@property (nonatomic, strong) NSNumber * medicalConditionId;
@property (nonatomic, strong) NSString * medicalConditionIds;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) MedicalCondition$AP$ * medicalCondition;

@end
