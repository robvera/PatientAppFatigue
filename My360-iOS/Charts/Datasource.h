//
//  Datasource.h
//  BarChart

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "ChartData.h"

@interface Datasource : NSObject <SChartDatasource>

@property (nonatomic) id <ChartData> data;

@end
