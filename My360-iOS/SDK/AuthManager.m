//
//  AuthManager.m
//  AnyPresence SDK
//

#import "APContext.h"
#import "APObject+Internal.h"
#import "APObject+Reflection.h"
#import "APObject+Requests.h"
#import "APRequest.h"
#import "AuthManager.h"
#import "AuthManager+Protected.h"
#import "NSData+Serialization.h"

@interface AuthManager ()

@property (strong, nonatomic) NSURL * signInURL;
@property (strong, nonatomic) NSURL * signOutURL;

- (void)refreshCurrentCredentials;

@end

@implementation AuthManager

APReflectionPropertyName authTransformProperty = ^(NSString * name){
    return name;
};

@synthesize signInURL;
@synthesize signOutURL;
@synthesize currentCredentials = _currentCredentials;

static AuthManager * __defaultManager = nil;

#pragma mark - Public

+ (AuthManager *)defaultManager {
    return __defaultManager;
}

- (void)signInAs:(APObject<Authorizable> *)credentials async:(APAuthorizableCallback)callback {
    __unsafe_unretained AuthManager * self_ = self;
    [[APObject requestWithVerb:kAPRequestVerbCreate
                           URL:self.signInURL
                        object:credentials
                       context:nil
                        config:nil]
     loadAsync:^(NSData *response, NSError *error) {
         if (!error) {
             [credentials updateWithData:[response objectFromSerializationWithConfig:nil] transform:authTransformProperty];
             self_.currentCredentials = credentials;
         } else {
             self_.currentCredentials = nil;
         }
         
         callback(credentials, error);
     }];
}

- (void)signOutAsync:(APAuthorizableCallback)callback {
    __unsafe_unretained AuthManager * self_ = self;
    [[APObject requestWithVerb:kAPRequestVerbCreate
                           URL:self.signOutURL
                       context:nil
                        config:nil]
     loadAsync:^(NSData *response, NSError *error) {
         self_.currentCredentials = nil;
         
         callback(nil, error);
     }];
}

- (void)setCurrentCredentials:(APObject<Authorizable> *)currentCredentials {
    if (_currentCredentials != currentCredentials) {
        _currentCredentials = currentCredentials;
        
        [self refreshCurrentCredentials];
    }
}

- (void)setPersistsCurrentCredentials:(BOOL)persistsCurrentCredentials {
    if (_persistsCurrentCredentials != persistsCurrentCredentials) {
        _persistsCurrentCredentials = persistsCurrentCredentials;
        
        [self refreshCurrentCredentials];
    }
}

#pragma mark - Protected

+ (void)setDefaultManager:(AuthManager *)manager {
    if (manager != __defaultManager) {
        __defaultManager = manager;
    }
}

#pragma mark - Private

- (void)refreshCurrentCredentials {
    if (self.persistsCurrentCredentials || !self.currentCredentials) {
        [APContext context].currentCredentials = self.currentCredentials.internal;
    }
}

#pragma mark - NSObject

- (id)init {
    if ((self = [super init])) {
        APInternalObject * credentials = [APContext context].currentCredentials;
        if (credentials) {
            self.currentCredentials = [[[APObject publicClassForInteralClass:credentials.class] alloc] initWithInternal:credentials];
        }
    }
    
    return self;
}

@end
