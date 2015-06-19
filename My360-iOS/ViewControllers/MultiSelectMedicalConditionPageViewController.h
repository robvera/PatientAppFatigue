//
//  MultiSelectMedicalConditionPageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseFormViewController.h"

#define ERROR_CODE_401(error) [[error localizedDescription] isEqualToString:@"Unauthorized"] ? YES : NO

@interface MultiSelectMedicalConditionPageViewController : BaseFormViewController//UITableViewController

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSMutableArray *selectedTableData;


- (BOOL)saveTapped;
-(void)back;
@end
