//
//  JournalTreatmentLogsTableViewController.h
//  My360-iOS
//
//  Created by Savio Vaz on 3/31/14.
//
//

#import <UIKit/UIKit.h>

#import "BaseFormViewController.h"
#import "JournalReasonCell.h"
#import "JournalReasonGlobalObject.h"

@interface JournalTreatmentLogsTableViewController:BaseFormViewController<JournalReasonCellDelegate>
{
    NSArray *takingMedications ;
    
}
@property (strong, nonatomic) JournalReasonGlobalObject *common ;
- (IBAction)saveTapped ;
 
- (IBAction)toggleTookMedicationSwitch:(id)sender ;

@end
