//
//  MultiSelectMedicaionViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/7/13.
//
//

#import <UIKit/UIKit.h>

@interface MultiSelectMedicationViewController : UITableViewController


@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSMutableArray *selectedTableData;


- (IBAction)saveTapped;
@end
