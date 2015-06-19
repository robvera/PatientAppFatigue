//
//  ShinobiChart+ScatterPlot.m
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//

#import "ShinobiChart+APCharts.h"
#import "UIViewController+UI.h"


@implementation ShinobiChart (APCharts)

+(ShinobiChart *)scatterPlot{
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:CGRectZero];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    //We want to use the lighter theme
//            -  MSAA cleanup svaz 11/27/14
//    chart.theme = [SChartLightTheme new];
      SChartTheme *theme =[SChartLightTheme new];
    //this axis has our data values
    SChartNumberAxis *yAxis = [SChartNumberAxis new];
    yAxis.title = @"Missed Doses";
    chart.yAxis = yAxis;
    //A category axis displays each month
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    //Our title will be over two lines on the iPad
    xAxis.title = @"Month";
    chart.xAxis = xAxis;
//    SChartTheme *theme = chart.theme;
    theme.legendStyle.orientation = SChartLegendOrientationHorizontal;
    [chart applyTheme: theme];
    return chart;
}
+(ShinobiChart *)lineChart{
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:CGRectZero];
    //ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:CGRectMake(0, 0, 100, 0)];
    //CGRect frame = CGRectMake(0, 0, 10, 0);
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    //We want to use the lighter theme
//            -  MSAA cleanup svaz 11/27/14
//    chart.theme = [SChartLightTheme new];
      SChartTheme *theme =[SChartLightTheme new];
    //this axis has our data values
    SChartNumberAxis *yAxis = [SChartNumberAxis new];
    yAxis.title = @"Missed Doses";
    chart.yAxis = yAxis;
    //A category axis displays each month
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    //Our title will be over two lines on the iPad
    xAxis.title = @"Month";
    chart.xAxis = xAxis;
//    SChartTheme *theme = chart.theme;
    
    theme.legendStyle.orientation = SChartLegendOrientationHorizontal;
    [chart applyTheme: theme];
    return chart;
}
+ (ShinobiChart *)barChart{
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:CGRectZero];
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    //We want to use the lighter theme
//            -  MSAA cleanup svaz 11/27/14
//    chart.theme = [SChartLightTheme new];
     SChartTheme *theme =[SChartLightTheme new];
    //this axis has our data values
    SChartNumberAxis *yAxis = [SChartNumberAxis new];
    chart.yAxis = yAxis;
    
    //A category axis displays each month
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    //Our title will be over two lines on the iPad
    chart.xAxis = xAxis;
    chart.legend.hidden = NO;
    chart.legend.placement = SChartLegendPlacementOutsidePlotArea;
    chart.legend.position = SChartLegendPositionMiddleRight;
    chart.legend.maxSeriesPerLine = 2;
    chart.legend.autoresizesSubviews = YES;
    chart.legend.autosizeLabels = YES;
    chart.legend.symbolWidth = @5;
//            -  MSAA cleanup svaz 11/27/14
//    SChartTheme *theme = chart.theme;
    
    theme.legendStyle.orientation = SChartLegendOrientationHorizontal;
    theme.legendStyle.font = [UIFont systemFontOfSize:14.0f];
    [chart applyTheme: theme];
    [chart.legend reload];
    
    return chart;

}
+(ShinobiChart *)pieChart{
    //     changed       -  MSAA cleanup svaz 11/27/14
    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:CGRectZero];
//    ShinobiChart *chart = [[ShinobiChart alloc] initWithFrame:CGRectZero withTheme:[SChartLightTheme new]];
    
    chart.autoresizingMask = ~UIViewAutoresizingNone;
    //We want to use the lighter theme
//            -  MSAA cleanup svaz 11/27/14
    SChartTheme *theme =[SChartLightTheme new];
//    chart.theme = [SChartLightTheme new];
    chart.legend.hidden = NO;
    chart.legend.position = SChartLegendPositionBottomMiddle;
    chart.legend.maxSeriesPerLine = 2;
    SChartNumberAxis *yAxis = [SChartNumberAxis new];
    chart.yAxis = yAxis;
    
    //A category axis displays each month
    SChartCategoryAxis *xAxis = [SChartCategoryAxis new];
    //Our title will be over two lines on the iPad
    chart.xAxis = xAxis;
    
    chart.legend.maxSeriesPerLine = 1;
    chart.legend.autoresizesSubviews = YES;
    chart.legend.autosizeLabels = YES;
    chart.legend.symbolWidth = @5;
//    SChartTheme *theme = chart.theme;
    
    theme.legendStyle.font = [UIFont systemFontOfSize:14.0f];
    [chart applyTheme: theme];
    [chart.legend reload];
    theme.legendStyle.orientation = SChartLegendOrientationHorizontal;

    return chart;
}

- (SChartSeries*)scatterSeriesForString:(NSString *)title {
    SChartScatterSeries *series = [SChartScatterSeries new];
    //series.stackIndex = [NSNumber numberWithInt:1];
    series.orientation = SChartSeriesOrientationHorizontal;
    series.selectionMode = SChartSelectionPoint;
    series.animationEnabled = YES;
    series.title = title;
    
    return series;
}
- (SChartSeries*)barSeriesForString:(NSString *)title {
    SChartBarSeries *series = [SChartBarSeries new];
    //series.stackIndex = [NSNumber numberWithInt:1];
    series.orientation = SChartSeriesOrientationHorizontal;
    series.animationEnabled = YES;
    series.selectionMode = SChartSelectionSeries;
    series.title = title;
    series.style.lineWidth = @12;    
    return series;
}
- (SChartSeries*)lineSeriesForString:(NSString *)title {
    SChartLineSeries *series = [SChartLineSeries new];
    series.orientation = SChartSeriesOrientationHorizontal;
    series.selectionMode = SChartSelectionPoint;
    series.animationEnabled = YES;
    series.title = title;
    
    return series;
}
- (SChartSeries*)pieSeriesForString:(NSString *)title {
    SChartPieSeries *series = [SChartPieSeries new];
    series.selectedStyle.protrusion = 10.f;
    series.style.showCrust = NO;
    series.selectedStyle.showCrust = NO;
    series.labelFormatString = @"%d (%2.0f)";
    series.orientation = SChartSeriesOrientationHorizontal;
    series.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];
    series.animationEnabled = YES;
    series.gesturePanningEnabled = YES;
    series.selectionEnabledDuringPanning = YES;
    series.title = title;
    return series;
}
- (SChartSeries*)donutSeriesForString:(NSString *)title {
    SChartDonutSeries *series = [SChartDonutSeries new];
    series.selectedStyle.protrusion = 10.f;
    series.style.showCrust = NO;
    series.selectedStyle.showCrust = NO;
    series.labelFormatString = @"%d (%2.0f)";
    series.orientation = SChartSeriesOrientationHorizontal;
    series.selectedPosition = [NSNumber numberWithFloat:-M_PI/2.f];
    series.animationEnabled = YES;
    series.gesturePanningEnabled = YES;
    series.selectionEnabledDuringPanning = YES;
    series.title = title;
    return series;
}

@end
