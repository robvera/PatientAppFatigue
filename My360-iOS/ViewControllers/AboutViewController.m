//
//  AboutViewController.m
//  My360-iOS
//
//  Created by Roberto M. Vera on 12/3/14.
//
//

#import "AboutViewController.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import <APSDK/APObject+Remote.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"
#import "ConfigurationManager.h"


@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize appVersionNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appVersionNumber.text = [NSString stringWithFormat:@"v.%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    self.appVersionNumber.text = @"hello world";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
