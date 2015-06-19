//
//  ClinicianListPageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/14/13.
//
//

#import "BaseTableViewController.h"
#import "APToolBar.h"

@interface ClinicianListPageViewController : BaseTableViewController


@property BOOL editMode;
@property (nonatomic,strong) APToolBar *toolBar;
@property (nonatomic,strong) NSMutableArray *unRegisteredClinicians;
@end
