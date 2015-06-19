//
//  NSObject+InterpolateString.h
//  AnyPresence
//

#import <Foundation/Foundation.h>

typedef NSString * (^InterpolateString)(NSString * prefix, NSString * value);

@interface NSObject (InterpolateString)

- (NSString *)value:(NSString *)keyPath;
+ (NSString *)interpolateString:(NSString *)string block:(InterpolateString)interpolate;

@end
