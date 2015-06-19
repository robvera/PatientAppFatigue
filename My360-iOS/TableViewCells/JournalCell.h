//
//  JournalCell.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/7/13.
//
//

#import <UIKit/UIKit.h>

@interface JournalCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondaryLabel;

@end
