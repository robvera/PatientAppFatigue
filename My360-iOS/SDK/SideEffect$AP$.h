//
//  SideEffect$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface SideEffect$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSOrderedSet * patientSideEffects;

@end
