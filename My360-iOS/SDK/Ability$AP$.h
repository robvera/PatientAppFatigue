//
//  Ability$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Ability$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * summary;
@property (nonatomic, strong) NSOrderedSet * patientJournals;

@end
