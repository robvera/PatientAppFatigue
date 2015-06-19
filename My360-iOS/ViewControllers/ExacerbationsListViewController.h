//
//  ExacerbationsListViewController.h
//  MSPatient
//
//  Generated by AnyPresence, Inc on 2013-02-26
//  Copyright (c) 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <APSDK/PatientExacerbation.h>
#import "BaseTableViewController.h"
#import "EditExacerbationPageViewController.h"

@interface ExacerbationsListViewController : BaseTableViewController <EditExacerbationPageViewControllerDelegate> {
}

@property (nonatomic, assign) bool reloadDataOnLoad;


@end
