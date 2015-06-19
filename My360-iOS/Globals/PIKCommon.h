//
//  PIKCommon.h
//  My360-iOS
//
//  Created by Savio Vaz on 4/23/14.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface PIKCommon : NSObject
+ (id)sharedInstance;
-(BOOL) popLayerMessage:(UIView*) view message:(NSString *)message;
-(void) popLayerMessageWithInterval:(UIView*) view message:(NSString *)message NSTimeInterval:(NSTimeInterval ) interval;
- (void) printObjectContents:(id) object;
- (NSString *) formatPhone:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL) validateEmail: (NSString *) email;
- (BOOL) validatePhone:(NSString*)number;
@end
