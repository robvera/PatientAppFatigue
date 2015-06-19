//
//  Application$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@interface Application$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * androidAppVersion;
@property (nonatomic, strong) NSString * appName;
@property (nonatomic, strong) NSString * appVersion;
@property (nonatomic, strong) NSString * downloadUrl;
@property (nonatomic, strong) NSOrderedSet * settings;

@end
