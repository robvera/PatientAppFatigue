//
//  MenuViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseFormViewController.h"

@interface MenuViewController : BaseFormViewController  


@property (weak, nonatomic) IBOutlet UITableViewCell *logoutButtonCell;//reference so we can hide the background

- (IBAction)logoutButtonTapped;
-(IBAction)closeButtonTapped:(id)sender;


@end
