//
//  APCustomButtons.h
//  Chameleon Platform
//
//  Created by Ian Terrell on 2012-01-19
//  Copyright (c) 2012 AnyPresence, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APGradientView : UIView
@end

@interface APCustomButtons : NSObject
+(UIImage*)stretchableButtonImageTopColor:(UIColor *)topColor bottomColor:(UIColor*)bottomColor borderColor:(UIColor*)borderColor;
@end