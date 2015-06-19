//
//  ContentCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/28/13.
//
//

#import "ContentCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"


@implementation ContentCell


@synthesize contentLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 290, 15)];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.textColor = [UIColor darkBlue];
    [self.contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
    [self addSubview:self.contentLabel];
    
}



@end
