//
//  PatientSideEffectMedication$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Medication$AP$;

@class PatientSideEffect$AP$;

@interface PatientSideEffectMedication$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * medicationId;
@property (nonatomic, strong) NSNumber * patientSideEffectId;
@property (nonatomic, strong) Medication$AP$ * medication;
@property (nonatomic, strong) PatientSideEffect$AP$ * patientSideEffect;

@end
