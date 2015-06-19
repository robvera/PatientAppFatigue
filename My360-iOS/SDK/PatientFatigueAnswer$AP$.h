//
//  PatientFatigueAnswer$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class PatientFatigueResult$AP$;

@interface PatientFatigueAnswer$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * answer;
@property (nonatomic, strong) NSNumber * patientFatigueResultId;
@property (nonatomic, strong) NSString * question;
@property (nonatomic, strong) NSNumber * sortId;
@property (nonatomic, strong) PatientFatigueResult$AP$ * patientFatigueResult;

@end
