//
//  Medication$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Medication$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * defaultDosage;
@property (nonatomic, strong) NSNumber * defaultDosageUomId;
@property (nonatomic, strong) NSNumber * defaultIngestionMethodId;
@property (nonatomic, strong) NSNumber * defaultTreatmentScheduleId;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * medicationCat;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * subCategory;
@property (nonatomic, strong) NSOrderedSet * patientTreatments;
@property (nonatomic, strong) NSOrderedSet * patientSideEffectMedications;

@end
