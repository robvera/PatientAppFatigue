//
//  Datasource.m
//  BarChart

#import "Datasource.h"
#import "ShinobiChart+APCharts.h"

@interface ShinobiChart (){
    int chartType;
}
@end
@implementation Datasource

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return [_data dataKeys].count;
}

//- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {

    switch ([_data chartType]) {
        case CHART_TYPE_BAR:
            return [chart barSeriesForString:[[_data dataKeys] objectAtIndex:index]];
        case CHART_TYPE_LINE:
            return [chart lineSeriesForString:[[_data dataKeys] objectAtIndex:index]];
        case CHART_TYPE_SCATTER:
            return [chart scatterSeriesForString:[[_data dataKeys] objectAtIndex:index]];
        case CHART_TYPE_PIE:
            return [chart pieSeriesForString:[[_data dataKeys] objectAtIndex:index]];
        case CHART_TYPE_DONUT:
            return [chart donutSeriesForString:[[_data dataKeys] objectAtIndex:index]];
        default:
            return [chart barSeriesForString:[[_data dataKeys] objectAtIndex:index]];
    }
    
}



- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
    return [_data categories].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex{
    SChartDataPoint *dp = [SChartDataPoint new];
    
    //map our data for our chart
    dp.xValue = [[_data categories] objectAtIndex:[_data categories].count - dataIndex - 1];
    //xVal = a category (reason)
    //data->object for reason -> object for month
        
    dp.yValue = [[[_data data] objectForKey:dp.xValue] objectForKey:[[_data dataKeys] objectAtIndex:seriesIndex]];
    
    if(dp.yValue == NULL || dp.yValue == nil ) dp.yValue = @0;
    
    return dp;
}

@end
