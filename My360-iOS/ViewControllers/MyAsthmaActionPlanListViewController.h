//
//  MyAsthmaActionPlanListViewController.h
//  My360-iOS
//
//  Created by Savio Vaz on 10/9/14.
//
//

#import "BaseTableViewController.h"
#import <UIKit/UIKit.h>
#import "MyAsthmaActionPlanFormViewController.h"

@interface MyAsthmaActionPlanListViewController : BaseTableViewController
@property (nonatomic, assign) bool reloadDataOnLoad;
@property (nonatomic, strong) PatientAsthma *myPatientAsthmaObject;
@end



 
