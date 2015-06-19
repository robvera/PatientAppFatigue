#import "APCustomButtons.h"
#import <QuartzCore/QuartzCore.h>

@implementation APGradientView

+ (Class)layerClass {
  return [CAGradientLayer class];
}

@end

@implementation APCustomButtons

+(UIImage*)stretchableButtonImageTopColor:(UIColor *)topColor bottomColor:(UIColor*)bottomColor borderColor:(UIColor*)borderColor {
  APGradientView *view = [[APGradientView alloc] initWithFrame:CGRectMake(0,0,17,17)];
  view.layer.masksToBounds = YES;
  view.layer.cornerRadius = 8;
  view.layer.borderWidth = 1;
  view.layer.borderColor = borderColor.CGColor;
  ((CAGradientLayer*)view.layer).colors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
  
  UIGraphicsBeginImageContext(view.frame.size);
  [view.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return viewImage;
}

@end