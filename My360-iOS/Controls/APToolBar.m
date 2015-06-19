//
//  APToolBar.m
//  MSPatient
//
//  Created by David Benko on 5/13/13.
//
//

#import "APToolBar.h"

@implementation APToolBar

@synthesize hidden;

-(id)initWithView:(UIView *)view {
    CGRect toolBarFrame = CGRectMake(0, -TOOLBAR_HEIGHT, view.frame.size.width, TOOLBAR_HEIGHT);
    return  [self initWithFrame:toolBarFrame];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.hidden = TRUE;
        
        
        if (!([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)){
            [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:@"ToolBar.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        }
        else {
         [[UIToolbar appearance] setBackgroundColor:[UIColor whiteColor]];   
        }
        self.alpha = 1.0f;
        //[self setBarStyle:UIBarStyleBlackTranslucent];
    }
    return self;
}

-(void)showToolBarInView:(UIView *)parent animated:(BOOL)animated{
    
    if(self.hidden){
        CGRect toolBarStart = self.frame;
        CGRect parentStartBounds = parent.bounds;
        
        
        if (toolBarStart.origin.y > parentStartBounds.origin.y) toolBarStart.origin.y = parentStartBounds.origin.y;
        
        CGRect parentEndBounds = parentStartBounds;
        parentEndBounds.origin.y -= self.frame.size.height;
        
        /*UIView *shawdowView = [[UIView alloc]initWithFrame:parentEndBounds];
         shawdowView.backgroundColor = [UIColor blackColor];
         shawdowView.alpha = 0.0f;
         shawdowView.tag = 999;
         [parent addSubview:shawdowView];*/
        
        if(animated){
            [UIView animateWithDuration:SHOW_ANIMATION_SPEED
                                  delay:0
                                options:UIViewAnimationOptionLayoutSubviews
                             animations:^{
                                 [parent setBounds:parentEndBounds];
                                 //shawdowView.alpha = 0.5;
                             }
                             completion:nil
             ];
        }
        else {
            [parent setBounds:parentEndBounds];
        }
        self.hidden = FALSE;
    }
}
-(void)hideToolBarInView:(UIView *)parent animated:(BOOL)animated{
    
    if(!self.hidden){
        CGRect toolBarStart = self.frame;
        CGRect parentStartBounds = parent.bounds;
        //__block UIView *shadowView = [parent viewWithTag:999];
        if (toolBarStart.origin.y < parentStartBounds.origin.y) toolBarStart.origin.y = parentStartBounds.origin.y;
        
        CGRect parentEndBounds = parentStartBounds;
        parentEndBounds.origin.y += self.frame.size.height;
        if(animated){
            [UIView animateWithDuration:HIDE_ANIMATION_SPEED
                                  delay:0
                                options:UIViewAnimationOptionLayoutSubviews
                             animations:^{
                                 //shadowView.alpha = 0.0;
                                 [parent setBounds:parentEndBounds];
                             }
                             completion:/*^ (BOOL finished){
                                         if(finished){
                                         [shadowView removeFromSuperview];
                                         shadowView = nil;
                                         }
                                         }*/nil];
        }
        else {
            [parent setBounds:parentEndBounds];
            //[shadowView removeFromSuperview];
            //shadowView = nil;
        }
        self.hidden = TRUE;
    }
}
-(void)showHideToolBarInView:(UIView *)parent animated:(BOOL)animated {
    if(self.hidden)[self showToolBarInView:parent animated:animated];
    else [self hideToolBarInView:parent animated:animated];
}

@end
