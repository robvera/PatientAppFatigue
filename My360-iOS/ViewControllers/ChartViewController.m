#import "ChartViewController.h"
#import <APSDK/Medication.h>
#import "PIKAnalyticsManager.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
#import <ShinobiCharts/SChartCanvas.h>
#import <ShinobiCharts/SChartCanvasOverlay.h>
#import "TutorialView.h"
#import "ConfigurationManager.h"
#import "PIKCommon.h"
#import "PikConstants.h"

#define EXTRUSION 90.5f
#define IS_RADIAL [self.chartData chartType] == CHART_TYPE_PIE || [self.chartData chartType] == CHART_TYPE_DONUT

@interface ChartViewController ()

@end

@implementation ChartViewController
@synthesize chartTitle;
@synthesize promptTitle;
@synthesize chartData;
@synthesize chart;
@synthesize lineView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    zoomSet = false;
    // Generic Chart Setup (applies to all charts)
    self.chart.licenseKey = @"GYV9mKjQNiDZLucMjAxMzA1MDVpbmZvQHNoaW5vYmljb250cm9scy5jb20=P1r87PxVnPaLTMJt9+rqcp+wupPp679Q3WMaeV6r32HThO3Yu1bEmu1PcBermgm7G8RO5S0TnTcGFJvi5x+dT2WTOk1bVocurIWa81dEF2GDwwgJYFGl+r9+DNkW3ID7fZLEcRDQINQkYiYs4i87oLeZNw0E=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
    
    CGRect navFrame = self.navigationController.navigationBar.frame;
   // navFrame = CGRectMake(90.0, 90.0, 60.0, 60.0);
    UIView *navView = [[UIView alloc]initWithFrame:navFrame];
    UILabel *topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 3, navFrame.size.width, navFrame.size.height / 2)];
    topLabel.text = [self chartTitle];
    topLabel.font = [UIFont boldSystemFontOfSize:16];
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.textColor = [UIColor whiteColor];
    [topLabel setBackgroundColor:[UIColor clearColor]];
    
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, navFrame.size.height / 2, navFrame.size.width, navFrame.size.height / 2)];
    bottomLabel.text = [self promptTitle];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.font = [UIFont systemFontOfSize:14];
    [bottomLabel setBackgroundColor:[UIColor clearColor]];
    bottomLabel.textColor = [UIColor whiteColor];

    
    [navView addSubview:topLabel];
    [navView addSubview:bottomLabel];
    self.navigationItem.titleView = navView;
    
    // Create our data and assign it to our datasource
    datasource = [Datasource new];
    datasource.data = [self chartData];
    self.chart.datasource = datasource;
    //self.chart.xAxis.zoom = SChartAxisZoomLevelOriginal;
   // self.chart.viewForBaselineLayout.
    
    // Set Up Uncomputed Range Padding
    chart.xAxis.rangePaddingLow = @1;
    chart.xAxis.rangePaddingHigh = @1;
    chart.yAxis.rangePaddingHigh = @1;
    
    // Delegate responsibility for chart
    self.chart.delegate = self;
    
    //Stop rotation
    self.chart.rotatesOnDeviceRotation = NO;
    
    // Blend background
    self.view.backgroundColor = self.chart.backgroundColor;
    
    // To Set the y-low padding, and the major tick frequency
    // We get the high and low values of the data
    // if the low val is 0, we don't want y-low padding
    // calc the major tick freq based on high val
    
    float highval = FLT_MIN;
    float lowval = FLT_MAX;
    
    // Data is dictionary in dictionary
    for (id key in [[self chartData] data]) {
        NSDictionary *data = [(NSDictionary *)[[self chartData]data] objectForKey:key];
        for (id datakey in data){
            float num = [(NSNumber *)[data objectForKey:datakey] floatValue];
            if(num > highval) highval = num;
            if(num < lowval) lowval = num;
        }
    }
    if(lowval < 1) lowval = 0;
    //if (self.chartData.chartType == CHART_TYPE_BAR) lowval = 0;
    //if(lowval == 0) chart.yAxis.rangePaddingLow = @0;
    //else chart.yAxis.rangePaddingLow = @1;
    chart.yAxis.rangePaddingLow = @0;
    NSLog(@"Low val: %f",lowval);
    NSLog(@"high val: %f",highval);
    BOOL resize = [self.chart.yAxis setRangeWithMinimum:[NSNumber numberWithFloat:lowval <= 0 ? lowval : lowval - 1] andMaximum:[NSNumber numberWithFloat:highval] withAnimation:YES];
    NSLog(@"Resized? : %d",resize);
    self.chart.yAxis.majorTickFrequency = [NSNumber numberWithDouble:(MAJOR_TICK_RATIO(highval))];
    
    
    //chart zoom
    self.chart.xAxis.enableGestureZooming = YES;
    self.chart.xAxis.enableGesturePanning = YES;
    self.chart.xAxis.enableMomentumPanning = YES;
    self.chart.xAxis.enableMomentumZooming = NO;
    self.chart.animateZoomGesture = YES;
    
    // Set Right Bar Button
    
    if([self.chartData chartType] == CHART_TYPE_SCATTER){
        UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Line" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToLine)];
        self.navigationItem.rightBarButtonItem = barListBtn;
        
    }
    else if([self.chartData chartType] == CHART_TYPE_LINE){
        UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Scatter" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToScatter)];
        
        self.navigationItem.rightBarButtonItem = barListBtn;
    }
    else if([self.chartData chartType] == CHART_TYPE_PIE){
        UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Donut" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToDonut)];
        
        self.navigationItem.rightBarButtonItem = barListBtn;
    }
    else if([self.chartData chartType] == CHART_TYPE_DONUT){
        UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Pie" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToPie)];
        
        self.navigationItem.rightBarButtonItem = barListBtn;
    }
    [self.chart redrawChart];
    
    /*
     * Needed for extended pie chart labels
     *
     */
    
    /*if(IS_RADIAL){
        lineView = [[LineView alloc] init];
        [lineView setUserInteractionEnabled:NO];
        [lineView setBackgroundColor:[UIColor clearColor]];
        [self.chart addSubview:lineView];
    }*/
    
    
    
   
    
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

# pragma mark - Right Bar Buttons Actions
-(void)changeToLine{
    [[self chartData] setChartType:CHART_TYPE_LINE];
    datasource = [Datasource new];
    datasource.data = [self chartData];
    self.chart.datasource = datasource;
    UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Scatter" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToScatter)];
    self.navigationItem.rightBarButtonItem = barListBtn;
//    [self.chart redrawChartAndGL:YES];
    [self.chart  redrawChart];  // commented above due to deprication and added this line- svaz 9/4/14
}
-(void)changeToScatter{
    [[self chartData] setChartType:CHART_TYPE_SCATTER];
    datasource = [Datasource new];
    datasource.data = [self chartData];
    self.chart.datasource = datasource;
    UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Line" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToLine)];
    self.navigationItem.rightBarButtonItem = barListBtn;
//    [self.chart redrawChartAndGL:YES];
        [self.chart  redrawChart];  // commented above due to deprication and added this line - svaz 9/4/14
}
-(void)changeToPie{
    [[self chartData] setChartType:CHART_TYPE_PIE];
    datasource = [Datasource new];
    datasource.data = [self chartData];
    self.chart.datasource = datasource;
    UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Donut" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToDonut)];
    self.navigationItem.rightBarButtonItem = barListBtn;
//    [self.chart redrawChartAndGL:YES];
      [self.chart  redrawChart];  // commented above due to deprication and added this line - svaz 9/4/
}
-(void)changeToDonut{
    [[self chartData] setChartType:CHART_TYPE_DONUT];
    datasource = [Datasource new];
    datasource.data = [self chartData];
    self.chart.datasource = datasource;
    UIBarButtonItem *barListBtn = [[UIBarButtonItem alloc] initWithTitle:@"Pie" style:UIBarButtonItemStyleBordered target:self action:@selector(changeToPie)];
    self.navigationItem.rightBarButtonItem = barListBtn;
//    [self.chart redrawChartAndGL:YES];
      [self.chart  redrawChart];  // commented above due to deprication and added this line - svaz 9/4/
     
}

#pragma mark - Chart Delegate

/*
 * Needed For extended Pie Chart Labels
 *
 */

/*- (void) sChartRenderStarted:(ShinobiChart *)chart withFullRedraw:(BOOL)fullRedraw {
    

    
    if(IS_RADIAL){
        // position our view over the top of the GL canvas
        CGRect glFrame = self.chart.canvas.glView.frame;
        glFrame.origin.y = self.chart.canvas.frame.origin.y;
        [lineView setFrame:glFrame];
        // remove the old point-pairs from the line view
        [lineView reset];
    }
}*/
- (void)sChartRenderFinished:(ShinobiChart *)chart {
    if(!zoomSet){
        [self.chart.xAxis setZoom:[self.chart.xAxis.axisRange.maximum floatValue] * 0.3 fromPosition:nil withAnimation:YES];
        zoomSet = true;
    }
    if (IS_RADIAL) {
        for(UILabel * label in self.chart.legend.labels){
            [label setTextAlignment:NSTextAlignmentLeft];
        }
    }
}


-(void)sChart:(ShinobiChart *)chart alterLabel:(UILabel *)label forDatapoint:(SChartDataPoint *)datapoint atSliceIndex:(int)index inRadialSeries:(SChartRadialSeries *)series {
    /*
     * Extended Pie Chart Labels
     *
     */
    /*if(IS_RADIAL){
        
        SChartPieSeries *pieSeries = (SChartPieSeries *)series;
        
        //get our radial point from our datasource method
        
        // three points:
        CGPoint pieCenter;      // chart center for trig calculations
        CGPoint oldLabelCenter; // original label center
        CGPoint labelCenter;    // new label center
        CGPoint endOfLine;     // we want our line to finish just short of our label
        
        pieCenter = [pieSeries getDonutCenter];
        oldLabelCenter = labelCenter = [pieSeries getSliceCenter:index];
        
        // find the angle of the slice, and add on a little to the label's center
        float xChange, yChange;
        
        xChange = pieCenter.x - labelCenter.x;
        yChange = pieCenter.y - labelCenter.y;
        
        float angle = atan2f(xChange, yChange) + M_PI / 2.f;
        // we do the M_PI / 2 adjustment because of how the pie is drawn internally
        
        labelCenter.x = oldLabelCenter.x + EXTRUSION * cosf(angle);
        labelCenter.y = oldLabelCenter.y - EXTRUSION * sinf(angle);
        
        endOfLine.x = oldLabelCenter.x + (EXTRUSION-30.f) * cosf(angle);
        endOfLine.y = oldLabelCenter.y - (EXTRUSION-30.f) * sinf(angle);
        
        
        int sum = 0;
        for (SChartDataPoint *dp in series.dataSeries.dataPoints){
            sum += [(NSNumber *)dp.yValue intValue];
        }
        label.text = [NSString stringWithFormat:@"%d (%d%%)",[(NSNumber *)datapoint.yValue intValue],(int)ceil((([(NSNumber *)datapoint.yValue intValue] * 100) / (double)sum))];
        [label sizeToFit];
        [label setCenter:labelCenter];
        [label setTextColor:[UIColor blackColor]];
        [label setHidden:NO];
        
        // connect our old label point to our new label
        [lineView addPointPair:oldLabelCenter second:endOfLine forLabel:label];
    }*/
    
    if (IS_RADIAL) {
        int sum = 0;
        for (SChartDataPoint *dp in series.dataSeries.dataPoints){
            sum += [(NSNumber *)dp.yValue intValue];
        }
        label.text = [NSString stringWithFormat:@"%d (%d%%)",[(NSNumber *)datapoint.yValue intValue],(int)ceil((([(NSNumber *)datapoint.yValue intValue] * 100) / (double)sum))];
        [label sizeToFit];
         label.textColor = [UIColor  whiteColor]; //orangeColor
        [label setHidden:NO];
    }
    
}

#pragma mark - UIViewController

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    mainBounds = self.navigationController.view.bounds;
    
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

    if (![[ConfigurationManager sharedManager] isOS7]) {
        //Move naigation bar up
        CGRect navFrame = self.navigationController.navigationBar.frame;
        navFrame.origin.y -= statusBarHeight;
        self.navigationController.navigationBar.frame = navFrame;
        
        // Hide status bar to give room for view
        [[UIApplication sharedApplication] setStatusBarHidden:YES];

    }
    
    // Hide status bar to give room for view for the chart after the data has been already load
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    // Create the new bounds for the navigationcontroller's view
    CGRect newBounds = CGRectMake(0, 0, mainBounds.size.height,mainBounds.size.width);
    self.navigationController.view.bounds = newBounds;
    
    // Realign in new bounds
    self.navigationController.view.center = CGPointMake(newBounds.size.height / 2.0, newBounds.size.width / 2.0);
    
    // Perform a Transform to rotate the view 90 degrees
    self.navigationController.view.transform = CGAffineTransformMakeRotation(DEGREES_RADIANS(90));
    
    CGRect frame = self.navigationController.view.frame;
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    frame.size.height -= navHeight;
    frame.origin.y -= statusBarHeight;
    //frame.origin.y = navHeight;
    //frame.size.width -= 10;
    self.chart.frame = frame;
    [self.chart.xAxis setRangeWithMinimum:@0 andMaximum:@3];
    [self.view addSubview:self.chart];
    
    //Apply Theme and redraw
//            -  MSAA cleanup svaz 11/27/14
    SChartTheme *chartTheme = [SChartiOS7Theme new];

//    [self.chart applyTheme];
    [chart applyTheme: chartTheme];
    [self.chart sizeToFit];
    
    // Send Analytics (This View Controller doesn't inherit from a base)
    
    [PIKAnalyticsManager sendAnalyticsToURLWithParams:[NSString stringWithFormat:@"pageview.cfm?book=%@user=%@&&chapter=%@&sbchapter=%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"], ((User *)[AuthManager defaultManager].currentCredentials).id, NSStringFromClass([self class]), @""]];
    
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
    int tutorialX = 0;
    if (IS_IPAD) {
        tutorialX =+170;
    }
    
        if(IS_RADIAL){
            if((![[NSUserDefaults standardUserDefaults]boolForKey:@"hasShownChartRadialTutorial"])){
               
                CGRect frame = self.view.bounds;
                TutorialView *tutorialView = [[TutorialView alloc]initWithFrame:frame];
                [self.view addSubview:tutorialView];
                
                UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(175+tutorialX, 120, 300, 40)];
                newLabel.text = @"Spin and Tap!";
                newLabel.backgroundColor = [UIColor clearColor];
                newLabel.textColor = [UIColor whiteColor];
                [tutorialView addSubview:newLabel];
                
                Arrow *newArrow = [[Arrow alloc]init];
                newArrow.head = CGPointMake(100+tutorialX, 140);
                newArrow.tail = CGPointMake(210+tutorialX, 20);
                [tutorialView addArrow:newArrow];
                
                newArrow = [[Arrow alloc]init];
                newArrow.head = CGPointMake(330+tutorialX, 140);
                newArrow.tail = CGPointMake(200+tutorialX, 240);
                [tutorialView addArrow:newArrow];
                
                
                [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"hasShownChartRadialTutorial"];
                [[NSUserDefaults standardUserDefaults]synchronize];
            }
        }
        else {
            if((![[NSUserDefaults standardUserDefaults]boolForKey:@"hasShownChartTutorial"])){
                CGRect frame = self.view.bounds;
                TutorialView *tutorialView = [[TutorialView alloc]initWithFrame:frame];
                [self.view addSubview:tutorialView];
                
                UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+tutorialX, 120, 300, 40)];
                newLabel.text = @"Charts can scroll... ";
                newLabel.backgroundColor = [UIColor clearColor];
                newLabel.textColor = [UIColor whiteColor];
                [tutorialView addSubview:newLabel];
                
                
                newLabel = [[UILabel alloc]initWithFrame:CGRectMake(380+tutorialX, 150, 300, 40)];
                newLabel.text = @"... and zoom";
                newLabel.backgroundColor = [UIColor clearColor];
                newLabel.textColor = [UIColor whiteColor];
                [tutorialView addSubview:newLabel];
                
                Arrow *newArrow = [[Arrow alloc]init];
                newArrow.head = CGPointMake(215+tutorialX, 100);
                newArrow.tail = CGPointMake(35+tutorialX, 100);
                [tutorialView addArrow:newArrow];
                
                newArrow = [[Arrow alloc]init];
                newArrow.head = CGPointMake(450+tutorialX, 40);
                newArrow.tail = CGPointMake(400+tutorialX, 85);
                newArrow.curved = false;
                [tutorialView addArrow:newArrow];
                
                newArrow = [[Arrow alloc]init];
                newArrow.head = CGPointMake(345+tutorialX, 135);
                newArrow.tail = CGPointMake(395+tutorialX, 90);
                newArrow.curved = false;
                [tutorialView addArrow:newArrow];
                
                [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"hasShownChartTutorial"];
                [[NSUserDefaults standardUserDefaults]synchronize];
            }
        }
//        }
    
    
    if ([self.showMessage isEqualToString:@"YES"]) {
        PIKCommon *common = [PIKCommon new];
        [common popLayerMessage:self.view message:@"You can  pinch to zoom to see the entire chart"];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    
    // Transform NavigationController back to normal
    self.navigationController.view.transform = CGAffineTransformIdentity;
    self.navigationController.view.transform = CGAffineTransformMakeRotation(DEGREES_RADIANS(0));
    
    //Reset Bounds
    self.navigationController.view.bounds = mainBounds;
    
    //self.view.bounds = mainBounds;
    
    if (![[ConfigurationManager sharedManager] isOS7]) {
        CGRect navFrame = self.navigationController.navigationBar.frame;
        navFrame.origin.y += 20;
        [self.navigationController.navigationBar setFrame:navFrame];
    }
    
    //Unhide Status Bar
    [self performSelector:@selector(showStatusBarAndNaviBar) withObject:self afterDelay:0.0];
    
    [super viewWillDisappear:animated];
}

- (void)showStatusBarAndNaviBar{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
