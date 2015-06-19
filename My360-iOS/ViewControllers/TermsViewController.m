//
//  TermsViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/21/13.
//
//

#import "TermsViewController.h"
#import "PikConstants.h"
#import "ConfigurationManager.h"

@interface TermsViewController ()

@end

@implementation TermsViewController


@synthesize scrollView;
@synthesize contentView;
@synthesize textView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
	// Do any additional setup after loading the view.
    NSString *path ;
    
    if ([[[ConfigurationManager sharedManager] appID] integerValue] == MS){
        path = [[NSBundle mainBundle] pathForResource:@"termsMsaa" ofType:@"txt"];  //termsMsaa
    }
    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == AAPA)
         path = [[NSBundle mainBundle] pathForResource:@"termsAAP" ofType:@"txt"];
    else{
        path = [[NSBundle mainBundle] pathForResource:@"terms" ofType:@"txt"];
    }
    
    NSError *e = nil;
    NSString *terms = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&e];
    [self.textView setText:nil];
    self.textView.text = terms;
    self.textView.DataDetectorTypes=UIDataDetectorTypeAddress | UIDataDetectorTypeLink | UIDataDetectorTypePhoneNumber;
//    
//    NSMutableAttributedString* attrStr = [NSMutableAttributedString at:terms];
//
//    NSAttributedString *terms2 = [NSAttributedString in ]
//    self.text÷View.attributedText=terms;

    if (IS_IPAD){
        // To displat on ipad on full screen
        self.view.transform = CGAffineTransformMakeScale(768.0/320.0,1024/433.0);
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)acceptPressed:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"acceptedTerms" object:nil userInfo:nil];
    
}


@end
