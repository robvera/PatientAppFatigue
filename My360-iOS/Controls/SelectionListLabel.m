//
//  SelectionListLabel.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/1/13.
//
//

#import "SelectionListLabel.h"
#import "PikConstants.h"

@implementation SelectionListLabel

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
    self.textColor = [UIColor blackColor];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
}

@end