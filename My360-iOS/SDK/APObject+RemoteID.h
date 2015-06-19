//
//  APObject+RemoteID.h
//  AnyPresence SDK
//

#import "APObject.h"

@interface APObject (RemoteID)

@property (nonatomic, strong) id remoteID;

- (id)initWithRemoteID:(id)remoteID;

@end
