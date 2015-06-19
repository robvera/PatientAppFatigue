//
//  APContext.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "APManagedDataObject.h"

@interface APContext : APManagedDataObject

@property (nonatomic, strong) APInternalObject * currentCredentials;

+ (APContext *)context;

@end
