//
//  APToolBar.h
//  MSPatient
//
//  Created by David Benko on 5/13/13.
//
//

#import <UIKit/UIKit.h>

#define TOOLBAR_HEIGHT 32.0f
#define HIDE_ANIMATION_SPEED 0.3f
#define SHOW_ANIMATION_SPEED 0.5f

@interface APToolBar : UIToolbar {
}
-(id)initWithView:(UIView *)view;
-(void)showToolBarInView:(UIView *)parent animated:(BOOL)animated;
-(void)hideToolBarInView:(UIView *)parent animated:(BOOL)animated;
-(void)showHideToolBarInView:(UIView *)parent animated:(BOOL)animated;
@property (nonatomic, assign) BOOL hidden;
@end
