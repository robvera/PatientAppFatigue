//
//  BaseTableViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 2/27/13.
//
//

#import "BaseTableViewController.h"
#import <APSDK/AuthManager.h>
#import "AuthManager+Rules.h"
#import "PikConstants.h"
#import "PIKAnalyticsManager.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
//#import "APNavigationController.h"



@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

@synthesize leftBarButton;
@synthesize rightBarButton;

@synthesize tableData = _tableData;
@synthesize tableView = _tableView;
@synthesize toolBar;
@synthesize tutorialView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toolBar = [[APToolBar alloc]initWithView:self.view];
     _tableData = [NSMutableArray new];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(toolBarAdd)];
    UIBarButtonItem *delbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toolBarDelete)];
    self.toolBar.items = [NSArray arrayWithObjects:flexible,addbutton,flexible, delbutton,flexible,nil];
    [self.view addSubview:self.toolBar];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self performSelector:@selector(showStatusBarAndNaviBar) withObject:self afterDelay:0.0];
    [super viewWillAppear:animated];
    //[self setNeedsStatusBarAppearanceUpdate];
}
- (void)showStatusBarAndNaviBar{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


-(void)toolBarAdd{
    //This should be Overridden
    //NSLog(@"toolBarAdd");
}
-(void)toolBarDelete{
    //This should be Overridden
    //NSLog(@"toolBarDelete");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeObservers];
}


/*- (NSMutableArray *)tableData {
    if (!_tableData) {
        _tableData = [NSMutableArray new];
    }
    
    return _tableData;
}*/


- (void)resize:(UIView *)subview to:(CGSize)newSize animated:(BOOL)animated {
    CGFloat delta = newSize.height - (subview.hidden ? 0.f : CGRectGetHeight(subview.frame));
    if (fabs(delta) > 1.f && subview) {
        CGFloat y = delta > 0 ? CGRectGetMinY(subview.frame) : CGRectGetMaxY(subview.frame);
        
        void (^resize)() = ^{
            if (CGSizeEqualToSize(newSize, CGSizeZero)) {
                subview.hidden = YES;
            } else {
                subview.hidden = NO;
                subview.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(subview.frame),
                                                          CGRectGetMinY(subview.frame),
                                                          newSize.width,
                                                          newSize.height));
            }
            
            for (UIView * child in self.scrollView.subviews) {
                if (child != subview && CGRectGetMinY(child.frame) >= y) {
                    child.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(child.frame),
                                                            CGRectGetMinY(child.frame) + delta,
                                                            CGRectGetWidth(child.frame),
                                                            CGRectGetHeight(child.frame)));
                }
            }
            
            
        };
        
        // TODO: Operation queue
        //    if (animated) {
        //        [UIView animateWithDuration:.5f animations:resize];
        //    } else {
        resize();
        //    }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width,
                                                 self.scrollView.contentSize.height + delta);
    }
}


- (void)addObservers {
    if (!self.observersSet) {
        self.observersSet = YES;
        [[AuthManager defaultManager] addObserver:self forKeyPath:@"currentCredentials" options:0 context:nil];
    }
}


- (void)removeObservers {
    if (self.observersSet) {
        self.observersSet = NO;
        
        [[AuthManager defaultManager] removeObserver:self forKeyPath:@"currentCredentials"];
    }
}


- (void)refreshAnimated:(BOOL)animated {
    for (UIView * subview in self.tableView.subviews){//@[ self.tableView ]) {
        if ([[AuthManager defaultManager] isAuthorized:subview]) {
            [self resize:subview to:subview.frame.size animated:animated];
        } else {
            [self resize:subview to:CGSizeZero animated:animated];
        }
    }
}

#pragma mark - TableView Data Source Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        if (section == 1)
            return 1;
        else
            return self.tableData.count;
    }
    
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView == self.tableView) {
        return !self.tableData.count || self.listDataState == kDataStateFull ? 1 : 2;
    }
    
    return 0;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}


#pragma mark - NSKeyValueObserving

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == [AuthManager defaultManager] && [keyPath isEqualToString:@"currentCredentials"]) {
        [self refreshAnimated:!!self.view.window];
    } else
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    
}

#pragma mark NSObject

- (void)dealloc {
    [self removeObservers];
    _tableData = nil;
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}

-(void)back {
    [super back];
}



@end
