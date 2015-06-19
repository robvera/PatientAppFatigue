//
//  AnalyticsManager.m
//  LMT
//
//  Created by Edward C Ganges on 4/8/13.
//
//

#import "PIKAnalyticsManager.h"

static UIWebView* analyticsWebView = nil;

@implementation PIKAnalyticsManager


+ (void)sendAnalyticsToURLWithParams:(NSString *)tag {
    BOOL logIsOn = FALSE;
    
    BOOL shouldSuppressAnalytics = FALSE; // kDEV_SUPRESS_ANALYTICS;
    if (shouldSuppressAnalytics)
    {
        if (logIsOn) NSLog(@"PIKAnalyticsManager.sendAnalyticsToURLWithParams(suppressed): %@",tag);
        return;
    }
    
    // encode string
	NSString *url = [[kAnalytics_URL stringByAppendingString:tag] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // open a webView...
    if (!analyticsWebView) {
        analyticsWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
        analyticsWebView.delegate = nil;
    }
    
    // post the message to the PIK server
	[analyticsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}


@end
