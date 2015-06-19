//
//  ChartViewController.h
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "Datasource.h"
#import "ChartData.h"
#import "LineView.h"

#define DEGREES_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define MAJOR_TICK_RATIO(highval) ((int)(floor(highval / 5) == 0 ? 1 : floor(highval / 5)))

@interface ChartViewController : UIViewController <SChartDelegate>{
    CGRect mainBounds;
    Datasource *datasource;
    int chartXLabelWidth;
    bool zoomSet;
}
@property (nonatomic) ShinobiChart *chart;
@property (nonatomic) NSString * chartTitle;
@property (nonatomic) NSString * promptTitle;
@property (nonatomic, retain) id <ChartData> chartData;
@property (nonatomic,strong) LineView *lineView;
@property (nonatomic) NSString *showMessage;
@end
