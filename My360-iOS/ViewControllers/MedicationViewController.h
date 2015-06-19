//
//  MedicationViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/4/13.
//
//

#import <UIKit/UIKit.h>


@interface MedicationViewController : UITableViewController <UISearchBarDelegate> {

    NSMutableArray *searchItems;
    NSMutableArray *sectionHeaders;
    NSMutableDictionary *sectionDefinition;
    IBOutlet UISearchBar *searchBar;
    BOOL searching;
    BOOL letUserSelectRow;
}

@property (strong, nonatomic) NSArray *tableData;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;

@property BOOL showBrandNames;

- (IBAction)switchTapped;
- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
