//
//  PatientReminderCells.m
//  MSPatient
//
//  Created by David Benko on 5/29/13.
//
//

#import "PatientReminderCells.h"
#import <QuartzCore/QuartzCore.h>

@implementation PatientReminderCells

@synthesize yesButton,noButton;

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
    
    
    self.dateLabel.frame = CGRectMake(20, 15, 90, 15);
    self.contentLabel.frame = CGRectMake(80, 15, 175, 60);
    self.contentLabel.numberOfLines = 0;
    
}

@end
