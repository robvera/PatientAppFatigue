//
//  APService.m
//  AnyPresence SDK
//

#import "APService.h"

@implementation APService

+ (NSData *)certificatePathToData:(NSString *)path dataSource:(id)sender {
    
    NSString *dataSourceName = NSStringFromClass([sender class]);
    NSAssert(path, @"You must pass a path to an SSL Certificate to enable SSL Pinning for %@. If you do not wish to enable SSL pinning, please use setBaseURL:.", dataSourceName);
    
    NSData *certificateData = [NSData dataWithContentsOfFile:path];
    NSString *pathError = [NSString stringWithFormat:@"The path %@ does not point to a valid certificate file.", path];
    NSAssert(certificateData, pathError);
    
    return certificateData;
}

@end
