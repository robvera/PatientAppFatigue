//
//  MissedTreatmentsReasonData.m
//  MSPatient
//
//  Created by David Benko on 4/11/13.
//
//

#import "MissedTreatmentsReasonData.h"
#import <APSDK/Chart+Remote.h>
#import <APSDK/APObject+Remote.h>

@implementation MissedTreatmentsReasonData
- (id)init {
    self = [super init];
    if (self) {
        
        // Init datasource
        _data = [NSMutableDictionary new];
        
        //init keys (used for series)
        _dataKeys = [NSMutableArray new];
        
        //init categories (x axis)
        _categories = [[NSArray alloc]init];
        
        _chartType = CHART_TYPE_BAR;
        
        _sortType = CHART_SORT_NONE;
        
        [self setPatientTreatmentId:[NSNumber numberWithInt:-1]];
    }
    return self;
}

-(void)generateData {
    if ([AppDelegate hasConnectivity])
    {
        // Query DB
        NSError *error = nil;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [self patientTreatmentId], @"patient_treatment_id",
                                         [formatter stringFromDate:[self startDate]], @"start_date",
                                         [formatter stringFromDate:[self endDate]], @"end_date",
                                         nil];
        
        NSArray *objects = [Chart query:@"missing_dose_reasons" params:queryAttributes error:&error];
        
        if (error == nil && objects.count > 0){
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            Chart *crt = [objects objectAtIndex:0];
            _data = [crt.chartdata copy];
            for (NSString *key in [crt.chartdata allKeys]){
                NSDictionary *data = (NSDictionary *)[crt.chartdata objectForKey:key];
                for (NSString * innerKey in [data allKeys]) {
                    if (![_dataKeys containsObject:innerKey]) {
                        [(NSMutableArray *)_dataKeys addObject:innerKey];
                    }
                }
            }
            _categories = (NSArray *)[NSMutableArray sortArray:[NSMutableArray arrayWithArray:[crt.chartdata allKeys]] WithSortType:self.sortType];
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
