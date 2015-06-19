//
//  SelectionListCell.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/1/13.
//
//

#import <UIKit/UIKit.h>
#import "SelectionListLabel.h"
#import "FormCaptionLabel.h"

@interface SelectionListCell : UITableViewCell


@property (weak, nonatomic) IBOutlet FormCaptionLabel *contentLabel;
@property (weak, nonatomic) IBOutlet SelectionListLabel *secondaryLabel;

@end
