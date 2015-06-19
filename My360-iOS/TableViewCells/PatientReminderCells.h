//
//  PatientReminderCells.h
//  MSPatient
//
//  Created by David Benko on 5/29/13.
//
//

#import "DatedContentCell.h"

@interface PatientReminderCells : DatedContentCell

@property (nonatomic,strong)UIButton *yesButton;
@property (nonatomic,strong)UIButton *noButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
