//
//  AboutViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/14/13.
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

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)



@interface AboutViewController ()

@end

@implementation  AboutViewController

//@synthesize logoView;
//@synthesize getVersionView;
//@synthesize makeRoundedImage;


- (void)viewDidLoad
    {
        [super viewDidLoad];
        
    //        [self.logoView.layer setCornerRadius:25.0f];
//        [self.logoView.layer setMasksToBounds:YES];
        
        self.getVersionView.text = [NSString stringWithFormat:@"v.%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];

        
        
     }

    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

#pragma mark - PickerView delegate

- (IBAction)getVersionButton:(id)sender
{
    self.getVersionView.text = [NSString stringWithFormat:@"v.%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];

}

//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//    
//    return 1;
//}
//
//-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    return ad.ingestionMethodData.count;
//}
//
//
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    [self.logoView.layer setCornerRadius:8.f];
//    [self.logoView.layer setMasksToBounds:YES];
//    self.logoView.layer.opaque = NO;
//    self.logoView.backgroundColor = [UIColor blackColor];
//    
//    return YES;
//}



@end
