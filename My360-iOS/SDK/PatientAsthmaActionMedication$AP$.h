//
//  PatientAsthmaActionMedication$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class PatientAsthma$AP$;

@interface PatientAsthmaActionMedication$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSString * dose;
@property (nonatomic, strong) NSString * frequency;
@property (nonatomic, strong) NSString * medication;
@property (nonatomic, strong) NSString * medicationType;
@property (nonatomic, strong) NSNumber * patientAsthmaActionIdSeq;
@property (nonatomic, strong) NSNumber * patientAsthmaId;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSDate * postedDate;
@property (nonatomic, strong) PatientAsthma$AP$ * patientAsthma;

@end
