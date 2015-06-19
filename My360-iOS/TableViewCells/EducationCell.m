//
//  EducationCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "EducationCell.h"

@implementation EducationCell

@synthesize urlString;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

@end
