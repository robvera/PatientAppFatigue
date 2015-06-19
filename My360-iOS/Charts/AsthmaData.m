//
//  Asthma.m
//  My360-iOS
//
//  Created by Savio Vaz on 6/26/14.
//
//




#import "AsthmaData.h"

#import <APSDK/APObject+Remote.h>
#import <APSDK/Chart+Remote.h>
#import <APSDK/PatientGlucose+Remote.h>
#import "ConfigurationManager.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>

//Added for AsthmaSpirometry
#define CHART_FEF 20
#define CHART_FVC 21
#define CHART_FEV 22
#define CHART_FEV_FVC 23
#define CHART_FEV_PERCENTAGE 24
#define CHART_FVC_PERCENTAGE 25

@implementation AsthmaData
- (id)init {
    self = [super init];
    if (self) {
        
        // Init datasource
        _data = [NSMutableDictionary new];
        
        //init keys (used for series)
        _dataKeys = [NSArray arrayWithObjects:@"AsthmaData", nil];
        //_dataKeys = [NSMutableArray new];
        
        //init categories
        _categories = [[NSArray alloc] init];
        
        _chartType = CHART_TYPE_BAR;
        [self setPatientId:[NSNumber numberWithInt:-1]];
        _sortType = CHART_SORT_NONE;
        
    }
    return self;
}
-(NSString *)getQuery:(int)chartId{
    NSString *returnType;
    
    switch (chartId) {
        case CHART_FEF:
            returnType = @"fef";
            break;
        case CHART_FEV:
            returnType = @"fev";
            break;
        case CHART_FVC:
            returnType = @"fvc";
            break;
        case CHART_FEV_FVC:
            returnType = @"fev_fvc";
            break;
        case CHART_FEV_PERCENTAGE:
            returnType = @"fev_percentage";
            break;
        case CHART_FVC_PERCENTAGE:
            returnType = @"fvc_percentage";
            break;
            
        default:
            returnType = @"fef";
            break;
            
            
    }
    
    return returnType;
    
}

-(NSString *)getChartTitle:(int)chartId{
    NSString *returnType;
    
    switch (chartId) {
        case CHART_FEF:
            returnType = @"FEF 25-75 %";
            break;
        case CHART_FEV:
            returnType = @"FEV1";
            break;
        case CHART_FVC:
            returnType = @"FVC";
            break;
        case CHART_FEV_FVC:
            returnType = @"FEV1/FVC";
            break;
        case CHART_FEV_PERCENTAGE:
            returnType = @"FEV1 %";
            break;
        case CHART_FVC_PERCENTAGE:
            returnType = @"FVC %";
            break;
            
        default:
            returnType =  @"FEF 25-75 %";
            break;
            
            
    }
    
    return returnType;
    
}
-(void)generateData {
    if ([AppDelegate hasConnectivity])
    {
        // Query DB
        NSError *error = nil;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSLog(@"[self chartQuery] = %@", [self asthmaQuery]);
        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [self patientId], @"patient_id",
                                         [formatter stringFromDate:[self startDate]],@"start_date",
                                         [formatter stringFromDate:[self endDate]],@"end_date",
                                         [self asthmaQuery], @"asthmaquery", nil];
        
        NSArray *objects = [Chart query:@"asthma_spiro_report" params:queryAttributes error:&error];
        if (error == nil && objects.count > 0){
            
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            Chart *crt = [objects objectAtIndex:0];
            for (NSString *key in [crt.chartdata allKeys]){
                NSArray *array = [NSArray new];
                NSNumber *n= [NSNumber numberWithInt:0];
               
                id object =   [crt.chartdata objectForKey:key] ;
        
                NSLog(@"object = %@",object);
                if ([object isEqual:[NSNull null] ] ) {
                     array = [[NSArray alloc]initWithObjects:n,nil];
                }else{
                     array = [[NSArray alloc]initWithObjects:[crt.chartdata objectForKey:key], nil];
                }
                [_data setObject:[NSMutableDictionary dictionaryWithObjects:array forKeys:_dataKeys]  forKey:key];
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

