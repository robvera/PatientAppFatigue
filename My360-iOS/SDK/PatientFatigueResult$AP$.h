//
//  PatientFatigueResult$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface PatientFatigueResult$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSNumber * cognitiveSubscale;
@property (nonatomic, strong) NSDate * completedOn;
@property (nonatomic, strong) NSDate * createdOn;
@property (nonatomic, strong) NSNumber * isCompleted;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * physicalSubscale;
@property (nonatomic, strong) NSNumber * psychosocialSubscale;
@property (nonatomic, strong) NSNumber * totalSubscale;
@property (nonatomic, strong) NSOrderedSet * patientFatigueAnswers;

@end
