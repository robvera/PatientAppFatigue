//
//  WhiteTextLabel.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/25/13.
//
//

#import "WhiteTextLabel.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"



@implementation WhiteTextLabel



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}


-(void)setup
{
    
    self.backgroundColor = [UIColor clearColor];
    //  self.textAlignment = NSTextAlignmentRight;
    self.textColor = [UIColor whiteColor];
    [self setFont:[UIFont fontWithName:@"Helvetica-Bold" size:kMediumFontSize]];
    
}


@end
