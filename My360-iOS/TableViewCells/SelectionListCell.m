//
//  SelectionListCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/1/13.
//
//

#import "SelectionListCell.h"

@implementation SelectionListCell

@synthesize contentLabel;
@synthesize secondaryLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
