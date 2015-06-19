//
//  UIAlertView+Additions.h
//  My360-iOS
//
//  Created by Savio Vaz on 6/4/14.
//
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Additions)
+ (void)presentWithTitle:(NSString *)title
                 message:(NSString *)message
                 buttons:(NSArray *)buttons
           buttonHandler:(void(^)(NSUInteger index))handler;
@end
