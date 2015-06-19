//
//  FilterViewController.h
//  MSPatient
//
//  Created by David Benko on 5/24/13.
//
//

#import "BaseTableViewController.h"
#import "SBTableAlert.h"
#import "ALPickerView.h"
@interface FilterViewController : BaseTableViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UITextFieldDelegate,SBTableAlertDelegate, SBTableAlertDataSource,UIPickerViewDataSource,UIPickerViewDelegate,ALPickerViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
// tableView , made to comply with BaseTableViewController - svaz 9/4/14
//@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableDictionary *checksNonMedication;
@property (nonatomic,strong) NSMutableDictionary *checksMedication;
@property (nonatomic,strong) SBTableAlert *multiCheck;
@property (nonatomic,strong) ALPickerView *multiCheckPicker;

-(void)resetMedicationChecks;
-(void)resetTreatmentChecks;

@end
