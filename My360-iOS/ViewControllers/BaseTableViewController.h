//
//  BaseTableViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/27/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "APToolBar.h"
#import "TutorialView.h"

#define HAS_DATA (self.tableData.count > 0) ? YES : NO

#define ASSET_BY_IOS_VERSION(filename) ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? [NSString stringWithFormat:@"%@_ios7.png",filename] : [NSString stringWithFormat:@"%@.png",filename]

@interface BaseTableViewController : BaseViewController

typedef enum {
    kDataStateReady,
    kDataStateLoading,
    kDataStateFull
} DataLoadState;


@property (nonatomic, assign) DataLoadState listDataState;

@property (nonatomic, weak) IBOutlet UIScrollView * scrollView;
@property (nonatomic, assign) BOOL observersSet;
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (atomic, strong) NSMutableArray * tableData;
@property (strong, nonatomic) TutorialView *tutorialView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;
@property (nonatomic, strong) APToolBar *toolBar;


-(void)resize:(UIView *)subview to:(CGSize)newSize animated:(BOOL)animated;

- (void)refreshAnimated:(BOOL)animated;
- (void)addObservers;
- (void)removeObservers;


@end
