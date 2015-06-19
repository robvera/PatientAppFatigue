//
//  APInternalObject.h
//  AnyPresence SDK
//

#import "APManagedDataObject.h"

@class APContext;

@interface APInternalObject : APManagedDataObject

@property (nonatomic, strong) APContext * currentCredentialsContext;

@end
