//
//  LoginViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 2/26/13.
//
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
#import <APSDK/UserForgotPassword.h>
#import <APSDK/APObject+Remote.h>
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"
#import "PIKAnalyticsManager.h"
#import "UIStoryboard+Definition.h"
#import "ConfigurationManager.h"
#import "PIKCommon.h"
#import "PikConstants.h"
#import "Flurry.h"


#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize emailField;
@synthesize passwordField;
@synthesize loginButton;
@synthesize saveEmailSwitch;
@synthesize forgotPasswordButton;
@synthesize colorView;
@synthesize contentView;
@synthesize applicationData;
@synthesize appVersionString;



- (void)viewDidLoad
{
    [super viewDidLoad];
 
    
    if (IS_IPAD){
        UIScrollView* scrollView= [self.view.subviews lastObject];
        UIView *view1 = [scrollView.subviews objectAtIndex:0];
        NSLog(@"---View=1 %@", view1);
        //    UIView* contentView= [[UIView alloc] initWithFrame:view1.bounds];
        //    for (UIView *v  in view1.subviews) {
        //        NSLog(@"View== %d, %@",v.tag, v);
        //    }
        
        //view1.layer.transform = CATransform3DMakeScale(2.0, 2.0, 1);
        //view1.layer.transform = CATransform3DMakeScale(768.0/320.0,1024/410.0 , 1);
        view1.layer.transform = CATransform3DMakeScale(768.0/320.0,1024/410.0 , 1);
    }

    
    self.contentView.frame = self.view.bounds;
    if (IS_IPAD) {
        self.colorView.hidden=YES;
    }else{
        self.scrollView.contentSize = self.contentView.frame.size;
    }
    
    self.saveEmailSwitch = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(210, 248, 79, 20)];
    [self.contentView addSubview:self.saveEmailSwitch];
    self.saveEmailSwitch.onText = @"YES";
    self.saveEmailSwitch.offText = @"NO";
    self.saveEmailSwitch.onTintColor = [UIColor darkBlue];

    [self.forgotPasswordButton addTarget:self action:@selector(retrievePassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.forgotPasswordButton setTitle:@"Forgot Password" forState:UIControlStateNormal];
    [self.forgotPasswordButton setBackgroundImage:[UIImage imageNamed:@"ToolBar.png"] forState:UIControlStateNormal];
    self.forgotPasswordButton.layer.cornerRadius = 10;
    self.forgotPasswordButton.layer.masksToBounds = YES;
    
    NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    self.appVersionString.text = appVersionString;
    
    
    //UITapGestureRecognizer *passwordGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retrievePassword:)];
    //[self.forgotPasswordLabel addGestureRecognizer:passwordGesture];
    
    self.emailField.inputAccessoryView = self.inputToolbar;
    self.emailField.returnKeyType = UIReturnKeyNext;
    self.passwordField.inputAccessoryView = self.inputToolbar;
    self.passwordField.returnKeyType = UIReturnKeySend;
    
    if(IS_WIDESCREEN) {
        CGRect frame = self.colorView.frame;
        frame.origin.y += (568 - 480);
        //self.colorView.frame = frame;
    }
    
    if(IS_IOS7){
        CGRect frame = self.contentView.frame;
        frame.origin.y += 20;
        self.contentView.frame = frame;
    }
//    NSLog(@" ,self.contentView.frame =%@", NSStringFromCGRect(self.contentView.frame));
  
    if ([[[ConfigurationManager sharedManager] appID] integerValue] == AAPA){
        self.colorView.backgroundColor = [UIColor clearColor];
    }else{
        self.colorView.backgroundColor = [UIColor darkBlue];
    }
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"Background",@"Background-568h")]];
    //setup the preferences
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults boolForKey:@"saveMe"]) {
        [self.saveEmailSwitch setOn:YES];
        self.emailField.text = [userDefaults objectForKey:@"email"];
    }
    else {
        [self.saveEmailSwitch setOn:NO];
    }
    
// dismiss keyboard          - svaz 5/12/14
    UIGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
    
 
    
}
- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    if ([self.emailField.text isEqualToString:@"svaz2000@hotmail.com"]) {
        
        self.passwordField.text=@"ziggy9";
    }
    else if([self.emailField.text isEqualToString:@"r.vera@pik.com"]) {
        
        self.passwordField.text=@"test123";
    }
    
    PIKCommon *c = [PIKCommon new];
    NSString *plistConfigPath = [[NSBundle mainBundle] pathForResource:@"Configuration" ofType:@"plist"];
    NSDictionary *configDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistConfigPath];
    
    NSString *server =    configDictionary[@"baseURL"];
    
    if ([server rangeOfString:@"prod" options:NSCaseInsensitiveSearch].location == NSNotFound) {
        NSString * msg1;
        if ( [server rangeOfString:@"stage" options:NSCaseInsensitiveSearch].location == NSNotFound)  {
              msg1 = @"You are hitting the DEVELOPMENT environment";
        }else
               msg1 = @"You are hitting the STAGING  environment";
        
        [c popLayerMessage:self.view message:msg1];
    }
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(bool)checkForUpgrade
{
    if ([AppDelegate hasConnectivity])
    {
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *majorVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:@1, @"id", nil];
        NSError *error = nil;
        NSArray *objects = [Application query:@"exact_match" params:queryAttributes error:&error];
        if ((error == nil) && (objects.count > 0)) {
            self.applicationData = [objects objectAtIndex:0]; //should only be one
            
            //if (![applicationData.appVersion isEqualToString:majorVersion]) {
            if ([applicationData.appVersion compare:majorVersion options:NSNumericSearch] == NSOrderedDescending) {
                
                //a new version exists so the only thing the user can do is upgrade
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Upgrade!" message:@"A new version of @Point of Care Patient Companion is available. You must upgrade in order to continue using this app." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                alertView.tag = 1;
                [alertView show];
                return false;
            }
            else return true;
        }
        else return true;
    }
    else return true;
}


#pragma mark - AlertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (alertView.tag) {
        case 1:{
            NSURL *url = [NSURL URLWithString:self.applicationData.downloadUrl];
            [[UIApplication sharedApplication] openURL:url];
            break;
        }
        default:
            break;
    }
}



#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.activeField = textField;
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // If this field is the password field, Log in
    
    if (textField == self.passwordField) {
        [self loginPressed:self.loginButton];
        return NO;
    }
    
    // Otherwise follow tab chain
    [self navigateNextTextField];
    
    return NO;
}
- (IBAction)keyboardDonePressed:(id)sender
{
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    
}
- (IBAction)loginPressed:(id)sender {
    
    if(![self checkForUpgrade])return;
    
    User *user = [User new];
    user.email = self.emailField.text;
    user.password = self.passwordField.text;
    user.appId = [[ConfigurationManager sharedManager] appID];
   
    if (self.emailField.text.length == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter your email address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        
    }
    else if (self.passwordField.text.length == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter your password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        
    }
    else if ([AppDelegate hasConnectivity])
    {
        self.emailField.enabled = NO;
        self.passwordField.enabled = NO;
        
        [self savePreferences];
        [self pushBusyOperation];
        
        //TODO PIK Example
        [[AuthManager defaultManager] signInAs:user async:^(id<Authorizable> object, NSError *error) {
            
            if (error != nil) {
              
                NSString *message = @"The information you entered was incorrect. Please try again.";

                //extract the error information
                NSDictionary *userInfo = error.userInfo;
                int errorCode = [[userInfo objectForKey:@"ss"] intValue];
                
                
                if (errorCode == 401) {
                    message = @"Invalid login credentials.";
                }
                else if (errorCode == 404) {
                    
                    message = @"User email does not exist.";
                }
                else {
                    message = @"The e-mail address and password do not match our records. Please try again or select the \"I forgot my password\" link.";
                }
            
                self.emailField.enabled = YES;
                self.passwordField.enabled = YES;
                self.passwordField.text = @"";
                
                [self popBusyOperation];
                [[[UIAlertView alloc] initWithTitle:@"Failure" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
            else {
                //Success
                [Flurry logEvent:@"loginSuccess"];
                
                self.emailField.enabled = YES;
                self.passwordField.enabled = YES;
                self.passwordField.text = @"";
                
                //NSString * channel = [NSString stringWithFormat:@"%d",[user.id intValue]];
                NSString * channel = [NSString stringWithFormat:@"%@_%@", [[ConfigurationManager sharedManager] appID] , user.id];
                AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [AppDelegate subscribeToChannel:channel withToken:[ad apnToken]];
                ad.sessionOpen = TRUE;
                [PIKAnalyticsManager sendAnalyticsToURLWithParams:[NSString stringWithFormat:@"run.cfm?book=%@&udid=%@&user=%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], [NSNumber numberWithInt:0], user.id]];
                

                [self popBusyOperation];
                
                if ([user.resetPassword boolValue]) {
                    //user forgot their password so they must reset it
                    [self performSegueWithIdentifier:@"changePasswordSegue" sender:self];

                }
                else {
                    //[self performSegueWithIdentifier:@"LoggedInSegue" sender:self];
                    [((AppDelegate*)[[UIApplication sharedApplication] delegate]) setRootTabBar];
                }
            }
        }];
        
    }
    else {
        
        self.emailField.enabled = YES;
        self.passwordField.enabled = YES;
        
        [AppDelegate showNoConnecttivityAlert];
    }
}


- (void)termsAccepted:(NSNotification *) notification
{
    
    if ([[notification name] isEqualToString:@"acceptedTerms"]){
        
        //terms were accepted.close terms view then opoen register view
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"acceptedTerms" object:nil];
        
        [self dismissViewControllerAnimated:YES completion:^{
        
            UIStoryboard *sb = [UIStoryboard mainStoryboard];
            
            UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:@"registerView"];
            
            viewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:viewController animated:YES completion:NULL];
        }];
    }
}


- (IBAction)registerPressed:(id)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(termsAccepted:) name:@"acceptedTerms" object:nil];

    UIStoryboard *sb = [UIStoryboard mainStoryboard];
    
    //user must agree to terms and conditions first
    UIViewController *viewController = [sb instantiateViewControllerWithIdentifier:@"termsView"];
    
    viewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:viewController animated:YES completion:NULL];
    
}


-(void)savePreferences
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.saveEmailSwitch isOn]) {
        [userDefaults setObject:self.emailField.text forKey:@"email"];
        [userDefaults setBool: YES forKey:@"saveMe"];
    }
    else {
        [userDefaults setObject:@"" forKey:@"email"];
        [userDefaults setBool:NO forKey:@"saveMe"];
    }
        
    //write out the data
    [userDefaults synchronize];
    
}


-(void)retrievePassword:(UITapGestureRecognizer *)sender {
    
    //grab email address from login form
    if (self.emailField.text.length == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter your email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        
    }
    else if ([AppDelegate hasConnectivity])
    {                
        UserForgotPassword *forgotPassword = [UserForgotPassword new];
        forgotPassword.email = self.emailField.text;
        
        [self pushBusyOperation];

        [forgotPassword createAsync:^(id object, NSError *error) {
            
            if (error != nil) {
                
                //extract the error information
                NSDictionary *userInfo = error.userInfo;
                int errorCode = [[userInfo objectForKey:@"ss"] intValue];
                
                NSString *message = @"";
                
                if (errorCode == 404) {
                    message = @"We were unable to find an account with that e-mail address.";
                }
                else {
                    message = @"We were unable to complete this request, please try again.";
                }
                
                [self popBusyOperation];

                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
            else {
                [self popBusyOperation];

                [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"Check your email for instruction on retrieving your password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
         }];

        }

    else {
        
        [AppDelegate showNoConnecttivityAlert];
    }
}





@end
