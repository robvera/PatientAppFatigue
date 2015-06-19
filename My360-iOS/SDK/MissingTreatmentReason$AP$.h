//
//  MissingTreatmentReason$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class PatientAdherenceLog$AP$;

@interface MissingTreatmentReason$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) PatientAdherenceLog$AP$ * patientAdherenceLog;

@end
