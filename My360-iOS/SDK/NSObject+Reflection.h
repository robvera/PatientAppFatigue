//
//  NSObject+Reflection.h
//  AnyPresence SDK
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflection)

- (id)encodeValue:(id)value ofType:(Class)type;
- (id)decodeValue:(id)string ofType:(Class)type;

@end
