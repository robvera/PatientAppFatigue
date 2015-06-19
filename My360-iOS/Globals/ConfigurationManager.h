//
//  StatusManager.h
//  Digest
//
//  Created by Agustin Echeandia on 10/25/13.
//
//

#import <Foundation/Foundation.h>

@interface ConfigurationManager : NSObject


@property BOOL isOS7;
@property (strong, nonatomic) NSNumber *appID;
@property (strong, nonatomic) NSString *serverAddress;
@property (strong, nonatomic) NSString *serverVersion;


+ (id)sharedManager;



@end
