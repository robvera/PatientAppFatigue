//
//  LabResultsCell.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/1/13.
//
//

#import <UIKit/UIKit.h>

@interface LabResultsCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondaryLabel;

@end
