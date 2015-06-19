//
//  AsthmaData.h
//  My360-iOS
//
//  Created by Savio Vaz on 6/26/14.
//
//

#import <Foundation/Foundation.h>
#import "ChartData.h"
@interface AsthmaData : NSObject<ChartData>
@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *dataKeys;
@property (nonatomic) NSArray *categories;
@property (nonatomic) NSNumber *patientId;
@property (nonatomic, assign)int chartType;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) ChartSortTypes sortType;
@property (nonatomic) NSString *asthmaQuery;
-(void)generateData;
-(NSString *)getQuery:(int)chartId;
-(NSString *)getChartTitle:(int)chartId;
@end
