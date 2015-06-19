//
//  BorderlessCell.m
//  My360-iOS
//
//  Created by Agustin Echeandia on 1/27/14.
//
//

#import "BorderlessCell.h"

@implementation BorderlessCell

-(void)addSubview:(UIView *)view
{
    if (CGRectGetHeight(view.frame) == 0.5)
    {
        return;
    }
    
    [super addSubview:view];
}

@end
