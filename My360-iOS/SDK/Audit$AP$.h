//
//  Audit$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Audit$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSString * actionTaken;
@property (nonatomic, strong) NSDate * actionTime;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * recObjectId;
@property (nonatomic, strong) NSString * recObjectName;

@end
