//
//  BloodSugarData.h
//  My360-iOS
//
//  Created by Savio Vaz on 6/25/14.
//
//

#import <Foundation/Foundation.h>
#import "ChartData.h"
 


@interface BloodSugarData : NSObject<ChartData>
@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *dataKeys;
@property (nonatomic) NSArray *categories;
@property (nonatomic) NSNumber *patientId;
@property (nonatomic, assign)int chartType;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) ChartSortTypes sortType;
-(void)generateData;

@end
