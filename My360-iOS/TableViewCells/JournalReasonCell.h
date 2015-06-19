//
//  JournalReasonCell.h
//  My360-iOS
//
//  Created by Savio Vaz on 4/1/14.
//
//

#import <UIKit/UIKit.h>
//#import "DCRoundSwitch.h"
#import "UIColor+APColorExtension.h"
//#import "FormInputTextField.h"
//#import <APSDK/MissingTreatmentReason.h>
@protocol JournalReasonCellDelegate <NSObject>
@optional
- (void) tappedOnCell:(id)sender;
@end
@interface JournalReasonCell : UITableViewCell
//<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong, readonly) UIPickerView * inputMedicationReasonMissedPicker;
@property (nonatomic, strong) NSArray *missingTreatmentReasonData;
@property (weak, nonatomic) IBOutlet UILabel *logDate;
@property (weak, nonatomic) IBOutlet UILabel *medication;
@property (weak, nonatomic) IBOutlet UITextField *reason;
//@property (nonatomic, strong) DCRoundSwitch *tookTreatmentSwitchDCRound;
@property (nonatomic, strong) id <JournalReasonCellDelegate> delegate;
//@property (strong, nonatomic) MissingTreatmentReason *missingTreatmentReason;
@property (weak, nonatomic) IBOutlet UILabel *labelReasonWhy;
@property (weak, nonatomic) IBOutlet UISwitch *switchYESNO;

@end
