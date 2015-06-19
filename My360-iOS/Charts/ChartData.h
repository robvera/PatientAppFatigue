//
//  ChartData.h
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//
#import <Foundation/Foundation.h>
#import "NSMutableArray+ChartSorts.h"

#define CHART_TYPE_BAR 1
#define CHART_TYPE_LINE 2
#define CHART_TYPE_SCATTER 3
#define CHART_TYPE_PIE 4
#define CHART_TYPE_DONUT 5

#define ERROR_CODE_401(error) [[error localizedDescription] isEqualToString:@"Unauthorized"] ? YES : NO

//Countries area data must conform to this - our chart datasource
//can then understand it
@protocol ChartData <NSObject>

@required
- (NSMutableDictionary*)data;
- (NSArray*)dataKeys; //series
- (NSArray*)categories; //x


@optional
- (int)chartType;
- (void)setChartType:(int)chartType ;
- (ChartSortTypes)sortType;
@end