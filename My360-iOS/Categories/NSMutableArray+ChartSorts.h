//
//  NSMutableArray+ChartSorts.h
//  MSPatient
//
//  Created by David Benko on 6/25/13.
//
//

#import <Foundation/Foundation.h>

#define MONTHS @"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"

@interface NSMutableArray (ChartSorts)

typedef enum  {
    CHART_SORT_NONE,
    CHART_SORT_MONTH,
    CHART_SORT_DAY
} ChartSortTypes;

-(NSMutableArray *)sortMonthAbbreviations;
-(NSMutableArray *)sortStringDates;
+(NSMutableArray *)sortArray:(NSMutableArray *)arr WithSortType:(ChartSortTypes)type;
@end
