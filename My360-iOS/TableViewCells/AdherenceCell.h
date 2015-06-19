//
//  AdherenceCell.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/5/13.
//
//

#import <UIKit/UIKit.h>
#import "DatedContentCell.h"

@interface AdherenceCell : DatedContentCell

- (void)setup;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(id)initWithCoder:(NSCoder *)aDecoder;
@end
