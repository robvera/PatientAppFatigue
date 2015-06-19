//
//  Symptom$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Symptom$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSNumber * sortId;
@property (nonatomic, strong) NSString * symptomCat;
@property (nonatomic, strong) NSOrderedSet * patientExacerbations;
@property (nonatomic, strong) NSOrderedSet * patientJournalSymptoms;

@end
