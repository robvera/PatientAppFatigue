//
//  StatusManager.m
//  Digest
//
//  Created by Agustin Echeandia on 10/25/13.
//
//

#import "ConfigurationManager.h"


@interface ConfigurationManager ()

@end


@implementation ConfigurationManager



@synthesize isOS7;
@synthesize appID = _appID;
@synthesize serverAddress = _serverAddress;
@synthesize serverVersion = _serverVersion;


+ (id)sharedManager
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    
    return _sharedObject;
}


-(NSNumber *)appID
{
    
    if (!_appID) {
        
        NSString *plistConfigPath = [[NSBundle mainBundle] pathForResource:@"Configuration" ofType:@"plist"];
        NSDictionary *configDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistConfigPath];
        
        _appID = configDictionary[@"appID"];
        
        NSLog(@"AppID:%@", _appID);
        
        
    }
    
    return _appID;
    
}


-(NSString *)serverAddress
{
    if (!_serverAddress) {
        
        NSString *plistConfigPath = [[NSBundle mainBundle] pathForResource:@"Configuration" ofType:@"plist"];
        NSDictionary *configDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistConfigPath];
        
         _serverAddress = configDictionary[@"baseURL"];
       
        NSLog(@"_serverAddress:%@",_serverAddress);
        
    }
    
    return _serverAddress;
}


-(NSString *)serverVersion
{
    
    if (!_serverVersion) {
        
        NSString *plistConfigPath = [[NSBundle mainBundle] pathForResource:@"Configuration" ofType:@"plist"];
        NSDictionary *configDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistConfigPath];
        
        //add the trailing backslash
        _serverVersion = [NSString stringWithFormat:@"%@/", configDictionary[@"serverVersion"]];

        NSLog(@"_serverVersion:%@",_serverVersion);
        
    }
    
    return _serverVersion;
}



@end
