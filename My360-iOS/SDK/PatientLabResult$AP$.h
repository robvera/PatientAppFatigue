//
//  PatientLabResult$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class LabResultStat$AP$;

@class TestType$AP$;

@interface PatientLabResult$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSNumber * clinicianOffice;
@property (nonatomic, strong) NSNumber * hospital;
@property (nonatomic, strong) NSDate * labResultOn;
@property (nonatomic, strong) NSString * labResultStatDenormalized;
@property (nonatomic, strong) NSNumber * labResultStatId;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSString * testTypeDenormalized;
@property (nonatomic, strong) NSNumber * testTypeId;
@property (nonatomic, strong) LabResultStat$AP$ * labResultStat;
@property (nonatomic, strong) TestType$AP$ * testType;

@end
