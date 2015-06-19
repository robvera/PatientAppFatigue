//
//  ShinobiChart+ScatterPlot.h
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//

#import <ShinobiCharts/ShinobiChart.h>
#import <APSDK/Medication.h>
#import <APSDK/Medication+Remote.h>

@interface ShinobiChart (APCharts)

+ (ShinobiChart *)scatterPlot;
+ (ShinobiChart *)barChart;
+ (ShinobiChart *)pieChart;
+ (ShinobiChart *)lineChart;

- (SChartSeries*)scatterSeriesForString:(NSString*)title;
- (SChartSeries*)pieSeriesForString:(NSString*)title;
- (SChartSeries*)barSeriesForString:(NSString *)title;
- (SChartSeries*)lineSeriesForString:(NSString *)title;
- (SChartSeries*)donutSeriesForString:(NSString *)title;
@end
