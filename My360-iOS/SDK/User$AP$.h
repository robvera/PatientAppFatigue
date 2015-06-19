//
//  User$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface User$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSDate * lastLoginTimestamp;
@property (nonatomic, strong) NSNumber * logInCounter;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * passwordConfirmation;
@property (nonatomic, strong) NSString * passwordDigest;
@property (nonatomic, strong) NSNumber * resetPassword;
@property (nonatomic, strong) NSString * role;
@property (nonatomic, strong) NSString * xSessionId;

@end
