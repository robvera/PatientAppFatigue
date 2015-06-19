//
//  PatientTreatment$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class DosageUom$AP$;

@class IngestionMethod$AP$;

@class Medication$AP$;

@class TreatmentSchedule$AP$;

@class TreatmentType$AP$;

@interface PatientTreatment$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSDate * currentScheduleOn;
@property (nonatomic, strong) NSNumber * dosage;
@property (nonatomic, strong) NSString * dosageUomDenormalized;
@property (nonatomic, strong) NSNumber * dosageUomId;
@property (nonatomic, strong) NSDate * endOn;
@property (nonatomic, strong) NSString * ingestionMethodDenormalized;
@property (nonatomic, strong) NSNumber * ingestionMethodId;
@property (nonatomic, strong) NSString * medicationDenormalized;
@property (nonatomic, strong) NSNumber * medicationId;
@property (nonatomic, strong) NSDate * nextScheduleOn;
@property (nonatomic, strong) NSNumber * numberHrsPerDay;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSDate * startOn;
@property (nonatomic, strong) NSString * timeOfUse;
@property (nonatomic, strong) NSString * treatmentScheduleDenormalized;
@property (nonatomic, strong) NSNumber * treatmentScheduleId;
@property (nonatomic, strong) NSString * treatmentTypeDenormalized;
@property (nonatomic, strong) NSNumber * treatmentTypeId;
@property (nonatomic, strong) NSOrderedSet * patientAdherenceLogs;
@property (nonatomic, strong) DosageUom$AP$ * dosageUom;
@property (nonatomic, strong) IngestionMethod$AP$ * ingestionMethod;
@property (nonatomic, strong) Medication$AP$ * medication;
@property (nonatomic, strong) TreatmentSchedule$AP$ * treatmentSchedule;
@property (nonatomic, strong) TreatmentType$AP$ * treatmentType;

@end
