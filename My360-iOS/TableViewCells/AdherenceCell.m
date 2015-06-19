//
//  AdherenceCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/5/13.
//
//

#import "AdherenceCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"


@implementation AdherenceCell


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
    [super setup];
    CGRect frame = self.dateLabel.frame;
    frame.origin.x = 45;
    self.dateLabel.frame = frame;
    //self.contentLabel.frame = CGRectMake(145, 15, 145, 15);
    
}


@end
