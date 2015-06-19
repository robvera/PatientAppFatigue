//
//  MissedTreatmentsReasonData.h
//  MSPatient
//
//  Created by David Benko on 4/11/13.
//
//

#import <Foundation/Foundation.h>
#import "ChartData.h"

#define logDate @"logDate"
#define logReason @"logReason"

//#define MONTHS @"Dec",@"Nov",@"Oct",@"Sep",@"Aug",@"Jul",@"Jun",@"May",@"Apr",@"Mar",@"Feb",@"Jan"

@interface MissedTreatmentsReasonData : NSObject <ChartData>
@property (nonatomic, assign)int chartType;
@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *dataKeys;
@property (nonatomic) NSArray *categories;
@property (nonatomic) NSNumber *patientTreatmentId;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) ChartSortTypes sortType;
-(void)generateData;

@end
