//
//  DatedContentCell.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/28/13.
//
//

#import <UIKit/UIKit.h>
@interface DatedContentCell : UITableViewCell


@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *contentLabel;


-(void)setup;

@end
