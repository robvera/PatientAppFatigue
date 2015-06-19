//
//  FormInputTextField.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/1/13.
//
//

#import "FormInputTextField.h"
#import "UIColor+APColorExtension.h"
#import "PikConstants.h"


@implementation FormInputTextField

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
    self.textAlignment = NSTextAlignmentRight;
    self.textColor = [UIColor blackColor];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
}

@end