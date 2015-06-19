//
//  APKeyedArchiverTransformer.m
//  AnyPresence SDK
//

#import "APKeyedArchiverTransformer.h"

@implementation APKeyedArchiverTransformer

#pragma mark - Public

+ (Class)transformedValueClass {
    return [NSDictionary class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (id)transformedValue:(id)value {
    return [NSKeyedArchiver archivedDataWithRootObject:value];
}

- (id)reverseTransformedValue:(id)value {
    return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}

@end
