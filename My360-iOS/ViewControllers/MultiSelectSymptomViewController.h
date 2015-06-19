//
//  MultiSelectSymptomViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/18/13.
//
//

#import <UIKit/UIKit.h>

@interface MultiSelectSymptomViewController : UITableViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableDictionary *sectionedTableData;

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSMutableArray *selectedTableData;


- (IBAction)saveTapped;

@end
