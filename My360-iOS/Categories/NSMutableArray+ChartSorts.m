//
//  NSMutableArray+ChartSorts.m
//  MSPatient
//
//  Created by David Benko on 6/25/13.
//
//

#import "NSMutableArray+ChartSorts.h"

@implementation NSMutableArray (ChartSorts)
-(NSMutableArray *)sortMonthAbbreviations {
    NSArray *sortedArray = [(NSArray *)self sortedArrayUsingComparator:^(id o1, id o2) {
        NSArray *months = [NSArray arrayWithObjects:MONTHS, nil];
        int obj1c = 0;
        int obj2c = 0;
        
        for (NSString * month in months){
            if ([(NSString *)o1 isEqualToString:month]) 
                obj1c ++;
            if ([(NSString *)o2 isEqualToString:month]) 
                obj2c ++;
            if (obj1c > 0 || obj2c > 0)
                break;
        }
        
        return (obj1c < obj2c) ? NSOrderedAscending : (obj1c > obj2c) ? NSOrderedDescending : NSOrderedSame;
    }];
    return [NSMutableArray arrayWithArray:sortedArray];
}
-(NSMutableArray *)sortStringDates {
    NSArray *sortedArray = [(NSArray *)self sortedArrayUsingComparator:^(id o1, id o2) {
        NSDateFormatter *f = [[NSDateFormatter alloc]init];
        f.dateFormat = @"MM/dd/yyyy";
        return [[f dateFromString:(NSString *)o2] compare:[f dateFromString:(NSString *)o1]];
    }];
    return [NSMutableArray arrayWithArray:sortedArray];
}
+(NSMutableArray *)sortArray:(NSMutableArray *)arr WithSortType:(ChartSortTypes)type{
    switch (type) {
        case CHART_SORT_DAY:
            return [arr sortStringDates];
            break;
        case CHART_SORT_MONTH:
            return [arr sortMonthAbbreviations];
            break;
        default:
            return arr;
            break;
    }
}
@end
