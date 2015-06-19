//
//  JournalReasonCell2.m
//  My360-iOS
//
//  Created by Savio Vaz on 4/1/14.
//
//

#import "JournalReasonCell.h"
#import <APSDK/MissingTreatmentReason.h>

@implementation JournalReasonCell
 
- (IBAction)tappedOnCell:(id)sender {
    [self.delegate tappedOnCell:self];
//    NSString *r = self.medication.text;
    
}




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"initWithStyle");
        // Initialization code
        
        
        
 
        }

        
    
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

 @end
