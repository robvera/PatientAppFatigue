//
//  WebPageViewController.h
//  MSPatient
//
//  Created by David Benko on 8/4/13.
//
//

#import <UIKit/UIKit.h>

@interface WebPageViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak)IBOutlet UIWebView *webview;
@property (nonatomic, strong) NSString *webpage;

@end
