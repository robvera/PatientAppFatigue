//
//  MedicalConditionCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "MedicalConditionCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"


@implementation MedicalConditionCell



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
