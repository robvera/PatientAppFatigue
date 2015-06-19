//
//  PatientSideEffect$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class SideEffect$AP$;

@interface PatientSideEffect$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSString * medicationIds;
@property (nonatomic, strong) NSString * medicationUnsure;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSString * sideEffectDenormalized;
@property (nonatomic, strong) NSNumber * sideEffectId;
@property (nonatomic, strong) NSDate * sideEffectOn;
@property (nonatomic, strong) NSOrderedSet * patientSideEffectMedications;
@property (nonatomic, strong) SideEffect$AP$ * sideEffect;

@end
