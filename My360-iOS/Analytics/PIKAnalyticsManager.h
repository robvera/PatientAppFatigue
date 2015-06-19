//
//  AnalyticsManager.h
//  LMT
//
//  Created by Edward C Ganges on 4/8/13.
//
//

#import <Foundation/Foundation.h>

#define kAnalytics_URL @"http://lmt.projectsinknowledge.com/iPhone/analytics/"

@interface PIKAnalyticsManager : NSObject {

}
+ (void)sendAnalyticsToURLWithParams:(NSString *)tag;

@end
