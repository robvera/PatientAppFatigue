//
//  NSObject+InterpolateString.m
//  AnyPresence
//

#import "NSObject+InterpolateString.h"

@implementation NSObject (InterpolateString)

- (NSString *)value:(NSString *)keyPath {
    if ([self respondsToSelector:NSSelectorFromString(keyPath)]) {
        id value = [self valueForKey:keyPath];
        return [value description];
    } else {
        return nil;
    }
}

+ (NSString *)interpolateString:(NSString *)string block:(InterpolateString)interpolate {
    NSString * pattern = @"\\{\\{(\\w*?)\\.?(\\w+)\\}\\}";
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSMutableString * mutableString = [string mutableCopy];
    [regex enumerateMatchesInString:string options:0 range:NSMakeRange(0, [string length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        NSString * prefix = result.numberOfRanges > 2 ? [string substringWithRange:[result rangeAtIndex:1]] : nil;
        NSString * value = [string substringWithRange:[result rangeAtIndex:prefix ? 2 : 1]];
        
        value = interpolate(prefix, value);
        if (value)
            [mutableString replaceOccurrencesOfString:[string substringWithRange:[result rangeAtIndex:0]] withString:value options:0 range:NSMakeRange(0, mutableString.length)];
    }];
    
    return [mutableString copy];
}

@end
