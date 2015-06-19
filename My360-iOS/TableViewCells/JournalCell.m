//
//  JournalCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/7/13.
//
//

#import "JournalCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"


@implementation JournalCell


@synthesize dateLabel;
@synthesize contentLabel;
@synthesize secondaryLabel;



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
    
    self.dateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 90, 15)];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    self.dateLabel.textColor = [UIColor blackColor];
    [self.dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
    [self addSubview:self.dateLabel];
    
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, 190, 15)];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.textColor = [UIColor darkBlue];
    [self.contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
    [self addSubview:self.contentLabel];

    self.secondaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 40, 190, 15)];
    self.secondaryLabel.backgroundColor = [UIColor clearColor];
    self.secondaryLabel.textColor = [UIColor blackColor];
    [self.secondaryLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
    [self addSubview:self.secondaryLabel];

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
