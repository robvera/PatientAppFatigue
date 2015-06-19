//
//  WebPageViewController.m
//  MSPatient
//
//  Created by David Benko on 8/4/13.
//
//

#import "WebPageViewController.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"

@interface WebPageViewController ()

@end

@implementation WebPageViewController
@synthesize webview;
@synthesize webpage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webview.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated {
    [self loadRequest];
}

-(void)loadRequest {
    NSLog(@"WEBPAGE: %@",self.webpage);
    NSURL *url = [NSURL URLWithString:self.webpage];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}
-(void)setWebpage:(NSString *)theWebpage {
    webpage = theWebpage;
    [self loadRequest];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self pushBusyOperation];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self popBusyOperation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
