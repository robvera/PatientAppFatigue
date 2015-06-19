//
//  AsthmaActionMedicationTableViewCell.h
//  My360-iOS
//
//  Created by Savio Vaz on 10/27/14.
//
//

#import <UIKit/UIKit.h>

@interface AsthmaActionMedicationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *medication;
@property (weak, nonatomic) IBOutlet UITextField *dose;
@property (weak, nonatomic) IBOutlet UITextField *frequency;
@property (weak, nonatomic) IBOutlet UILabel *medicationLabel;

@end
