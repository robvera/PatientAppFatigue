//
//  ExacerbationReasonsData.m
//  MSPatient
//
//  Created by David Benko on 4/11/13.
//
//

#import "ExacerbationReasonsData.h"

//#import <APSDK/PatientExacerbation+Remote.h>
#import <APSDK/Chart+Remote.h>
#import <APSDK/APObject+Remote.h>

@implementation ExacerbationReasonsData

- (id)init {
    self = [super init];
    if (self) {
        // Init datasource
        _data = [NSMutableDictionary new];
        
        //init keys (used for series)
        _dataKeys = [NSArray arrayWithObjects:@"exacerbations", nil];
        
        //init categories
        //_categories = [NSArray arrayWithObjects:MONTHS, nil];
        
        _chartType = CHART_TYPE_BAR;
        
    }
    return self;
}
-(void)generateData {
    if ([AppDelegate hasConnectivity])
    {
        NSError *error = nil;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [self patientId], @"patient_id",
                                         [formatter stringFromDate:[self startDate]],@"start_date",
                                         [formatter stringFromDate:[self endDate]],@"end_date",
                                         nil];
        
        
        NSArray *objects = [Chart query:@"exacerbations_report" params:queryAttributes error:&error];
        
        
        if (error == nil && objects.count > 0){
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            Chart *crt = [objects objectAtIndex:0];
            for (NSString *key in [crt.chartdata allKeys]){
                NSArray *array = [[NSArray alloc]initWithObjects:[crt.chartdata objectForKey:key], nil];
                [_data setObject:[NSMutableDictionary dictionaryWithObjects:array forKeys:_dataKeys]  forKey:key];
            }
            _categories = [NSArray arrayWithArray:[crt.chartdata allKeys]];
        }
        else {
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else {
                [self fillWithNulledData];
                NSLog(@"%@",[error localizedDescription]);
            }
        }
    }
    else
    {
        [self fillWithNulledData];
        [AppDelegate showNoConnecttivityAlert];
    }

}
/*
 * If query fails or there is a connection error, return all zeros to avoid crash
 */
-(void)fillWithNulledData {
    int monthNum = 0;
    for (NSString *month in _categories) {
        NSArray *monthData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:0], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:monthData forKeys:_dataKeys] forKey:[_categories objectAtIndex:monthNum]];
        monthNum++;
        NSLog(@"this is the Month: %@", month);
    }
}

@end
