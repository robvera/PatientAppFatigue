//
//  DaysWithSymptomsData.h
//  MSPatient
//
//  Created by David Benko on 5/10/13.
//
//

#import <Foundation/Foundation.h>
#import "ChartData.h"

@interface DaysWithSymptomsData : NSObject <ChartData>
@property (nonatomic) NSMutableDictionary *data;
@property (nonatomic) NSArray *dataKeys;
@property (nonatomic) NSArray *categories;
@property (nonatomic) NSNumber *patientId;
@property (nonatomic, assign)int chartType;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
-(void)generateData;


@end
