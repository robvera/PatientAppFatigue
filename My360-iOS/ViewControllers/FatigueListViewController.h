//
//  FatigueListViewController.h
//  My360-iOS
//
//  Created by Roberto M. Vera on 5/20/15.
//
//
#import <UIKit/UIKit.h>
#import <APSDK/PatientJournal.h>
#import "BaseTableViewController.h"
#import "EditJournalResultPageViewController.h"
#import "FatigueDetailTableViewController2.h"

@interface FatigueListViewController : BaseTableViewController <FatigueDetailTableViewController2Delegate> {
}
@property (nonatomic, assign) bool reloadDataOnLoad;


@end
