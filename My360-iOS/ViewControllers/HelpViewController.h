//
//  HelpViewController.h
//  MSPatient
//
//  Created by David Benko on 8/4/13.
//
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UITableViewController<UITableViewDelegate>

//@property(nonatomic, weak)IBOutlet UITableView *tableView;

-(IBAction)composeEmail;
-(IBAction)callPhone;
-(IBAction)composeEmailTechSupport;
@end
