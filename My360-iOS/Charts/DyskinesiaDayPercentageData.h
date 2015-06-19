//
//  DyskinesiaDayPercentageData.h
//  PDPatient
//
//  Created by Roberto Vera on 10/22/14.
//
//

#import <Foundation/Foundation.h>
#import "ChartData.h"

@interface DyskinesiaDayPercentageData : NSObject <ChartData>
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
