//
//  EducationViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/15/13.
//
//

#import "EducationViewController.h"
#import <APSDK/EducationalReading.h>
#import "UIViewController+UI.h"

@interface EducationViewController ()

@end

@implementation EducationViewController

@synthesize patientEducation;
@synthesize webView;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    NSURL *url = [NSURL URLWithString:self.patientEducation.educationalReadingUrl];
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    //load the page
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - WebView delegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self pushBusyOperation];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self popBusyOperation];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Unable to load file." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];*/
    
}


#pragma mark - AlertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
