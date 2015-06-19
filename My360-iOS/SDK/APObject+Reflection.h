//
//  APObject+Reflection.h
//  AnyPresence SDK
//

#import <Foundation/Foundation.h>
#import "APObject.h"

typedef NSString *(^APReflectionPropertyName)(NSString *name);

@interface APObject (Reflection)

+ (NSArray *)properties;
+ (NSString *)controller;
+ (NSArray *)arrayFromData:(id)data transform:(APReflectionPropertyName)property;
- (void)updateWithData:(id)data transform:(APReflectionPropertyName)property;
- (id)data;

@end
