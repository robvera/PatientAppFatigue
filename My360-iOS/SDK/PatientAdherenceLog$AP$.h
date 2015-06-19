//
//  PatientAdherenceLog$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class MissingTreatmentReason$AP$;

@class Patient$AP$;

@class PatientTreatment$AP$;

@interface PatientAdherenceLog$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSDate * logOn;
@property (nonatomic, strong) NSString * medicationDenormalized;
@property (nonatomic, strong) NSString * missingTreatmentReasonDenormalized;
@property (nonatomic, strong) NSNumber * missingTreatmentReasonId;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * patientTreatmentId;
@property (nonatomic, strong) NSNumber * timesMissedPerDay;
@property (nonatomic, strong) NSNumber * tookMedication;
@property (nonatomic, strong) NSNumber * treatmentScheduleDenormalized;
@property (nonatomic, strong) NSString * treatmentTypeDenormalized;
@property (nonatomic, strong) MissingTreatmentReason$AP$ * missingTreatmentReason;
@property (nonatomic, strong) Patient$AP$ * patient;
@property (nonatomic, strong) PatientTreatment$AP$ * patientTreatment;

@end
