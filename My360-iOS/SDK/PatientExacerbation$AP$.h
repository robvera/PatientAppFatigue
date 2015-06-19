//
//  PatientExacerbation$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Symptom$AP$;

@interface PatientExacerbation$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSNumber * concurrentInfection;
@property (nonatomic, strong) NSDate * endOn;
@property (nonatomic, strong) NSNumber * fatigability;
@property (nonatomic, strong) NSNumber * heatExposure;
@property (nonatomic, strong) NSNumber * intensity;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSDate * startOn;
@property (nonatomic, strong) NSNumber * stress;
@property (nonatomic, strong) NSString * symptomDenormalized;
@property (nonatomic, strong) NSNumber * symptomId;
@property (nonatomic, strong) Symptom$AP$ * symptom;

@end
