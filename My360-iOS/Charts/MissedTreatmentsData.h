//
//  MissedTreatmentsData.h
//  MSPatient
//
//  Created by David Benko on 4/8/13.
//
//

#import <Foundation/Foundation.h>
#import "ChartData.h"

//#define MONTHS @"Dec",@"Nov",@"Oct",@"Sep",@"Aug",@"Jul",@"Jun",@"May",@"Apr",@"Mar",@"Feb",@"Jan"

@interface MissedTreatmentsData : NSObject <ChartData>

@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *dataKeys;
@property (nonatomic) NSMutableArray *categories;
@property (nonatomic) NSNumber *patientTreatmentId;
@property (nonatomic, assign)int chartType;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) ChartSortTypes sortType;
-(void)generateData;

@end
