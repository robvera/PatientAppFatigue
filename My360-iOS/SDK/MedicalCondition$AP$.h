//
//  MedicalCondition$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface MedicalCondition$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSOrderedSet * patientMedicalConditions;

@end
