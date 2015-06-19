//
//  DatedContentCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/28/13.
//
//
#import "DatedContentCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"

@implementation DatedContentCell

@synthesize dateLabel;
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
    //            -  MSAA cleanup svaz 11/27/14
    if(IS_IPAD)
    {
        self.contentView.frame = IPAD_Cell_Frame;
    }
    else
    {
        self.contentView.frame = IPHONE_Cell_Frame;
//        self.contentView.frame =CGRectMake(50,0,320,24) ;
    }
    //        end    -  MSAA cleanup svaz 11/27/14
    self.dateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 90, 15)];
//    self.dateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, 90, 15)];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    self.dateLabel.textColor = [UIColor blackColor];
    [self.dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    self.dateLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self.contentView addSubview:self.dateLabel];

     self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 15, 170, 15)];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.textColor = [UIColor darkBlue];
    [self.contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    self.contentLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    [self.contentView addSubview:self.contentLabel];
   }


@end
