//
//  InsulinDose.m
//  My360-iOS
//
//  Created by Savio Vaz on 6/26/14.
//
//




#import "InsulinDose.h"

#import <APSDK/APObject+Remote.h>
#import <APSDK/Chart+Remote.h>
#import <APSDK/PatientGlucose+Remote.h>

//#import "PikConstants.h"
#import "ConfigurationManager.h"
//#import "LoadingTableViewCell.h"
//#import "GlucoseCell.h"
#import <APSDK/APObject+Remote.h>
//#import "EditGlucosePageViewController.h"
//#import "UIColor+APColorExtension.h"
//#import "PikConstants.h"
//#import "PIKCommon.h"
#import <APSDK/AuthManager.h>
#import <APSDK/User.h>
#import "OrderedDictionary.h"

@implementation InsulinDose
- (id)init {
    self = [super init];
    if (self) {
        
        // Init datasource
        _data = [NSMutableDictionary new];
        
        //init keys (used for series)
        _dataKeys = [NSArray arrayWithObjects:@"InsulinDoseData", nil];
        //_dataKeys = [NSMutableArray new];
        
        //init categories
        _categories = [[NSArray alloc] init];
        
        _chartType = CHART_TYPE_BAR;
        [self setPatientId:[NSNumber numberWithInt:-1]];
        _sortType = CHART_SORT_NONE;
        
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
                                         [self patientId], @"patient_id",
                                         [formatter stringFromDate:[self startDate]],@"start_date",
                                         [formatter stringFromDate:[self endDate]],@"end_date",
                                         nil];
        
        NSArray *objects = [Chart query:@"insulin_dose_report" params:queryAttributes error:&error];
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        Chart *crtsort = [objects objectAtIndex:0];
        NSArray *ka = [crtsort.chartdata allKeys] ;
        NSArray *sortedArray=[ka sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
        
        if (error == nil && objects.count > 0){
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            
            NSMutableArray *keyCombinedArray = [NSMutableArray new];
            Chart *crt = [objects objectAtIndex:0];
            //            for (NSString *key in [crt.chartdata allKeys]){
            for (NSString *key in sortedArray){
                
                NSMutableDictionary *time_Frame_dict = [[NSMutableDictionary alloc] initWithDictionary:[crt.chartdata objectForKey:key]];
                
                //                NSLog(@"UN Sorted Key = %@, Array = %@, %@, time_Frame_dict=%@", key,time_Frame_Array , [time_Frame_Array class], [time_Frame_dict class] );
                NSLog(@"key = %@ - unsorted dict = %@",key,time_Frame_dict);
                
                NSArray *ar = [time_Frame_dict allKeys]; ;
                NSInteger len = ar.count;
                //*********************************
                // Go in here, if there is more than one set of data colleced per day ex: before breakfast, and after lunch...
                // get all the "time_frame_sort" and create a new sortDict - sort it numerically
                // Get each key of "sortDict" and find in original, get val and put in finalSorted Dict.
                
                __block NSString *toFind =@" time_frame_sort" ;
                
                if ( len > 2) {
                    
                    __block NSMutableDictionary *sortDict = [NSMutableDictionary new];
                    __block NSMutableDictionary *sortDataDict = [NSMutableDictionary new];
                    __block NSMutableDictionary *sortedFinalDict = [NSMutableDictionary new];
                    __block MutableOrderedDictionary *sortedFinalDictOrdered = [MutableOrderedDictionary new];
                    
                    
                    //Seperate the data into 2 seperate dictionaries
                    [time_Frame_dict enumerateKeysAndObjectsUsingBlock:^(id key_TimeFrame, id value, BOOL *stop) {
                        
                        if ([key_TimeFrame rangeOfString:toFind].location == NSNotFound)
                        {
                            [sortDataDict setObject:value forKey:key_TimeFrame];
                        }else{
                            NSString *stripedTimeFrame =  [key_TimeFrame stringByReplacingOccurrencesOfString:toFind withString:@""];
                            [sortDict setObject:value forKey:stripedTimeFrame];
                        }
                        
                    }];
                    
                    NSLog(@" Values: sortDataDict %@", sortDataDict);
                    NSLog(@" PRE SortORder: sortDict %@", sortDict);
                    
                    // get the sorted keys - localizedCaseInsensitiveCompare
                    __block NSArray *sortedKeys =[sortDict  keysSortedByValueUsingSelector:@selector(compare:)];
                    NSLog(@"COMPLETE SortORder: sortedKeys %@", sortedKeys);
                    
                    //loop thru sorted keys and pull out values to chart
                    for (int i=0; i < sortedKeys.count; i++) {
                        NSString *toFind = [sortedKeys objectAtIndex:i];
                        NSString *foundValue =[sortDataDict objectForKey:toFind];
                        NSLog(@"toFind = %@,  foundValue = %@",toFind,foundValue);
                        [ sortedFinalDict setObject:foundValue  forKey:toFind  ];
                        [sortedFinalDictOrdered insertObject:foundValue forKey:toFind atIndex:i];
                        
                        
                        NSLog(@" Current sortedFinalDict= %@", sortedFinalDict);
                        
                        
                    }
                    //place into the right place
                    //                    time_Frame_dict = [sortedFinalDict copy];
                    //                    NSLog(@" We are going to chart this-sortedFinalDict %@", sortedFinalDict);
                    time_Frame_dict = [sortedFinalDictOrdered copy];
                    NSLog(@" We are going to chartsortedFinalDictOrdered %@", sortedFinalDictOrdered);
                    
                    NSLog(@" We are going to chart this-time_Frame_dict %@", time_Frame_dict);
                } // end if statement > 2
                
                [time_Frame_dict enumerateKeysAndObjectsUsingBlock:^(id key_TimeFrame, id value, BOOL *stop) {
                    if ( [key_TimeFrame rangeOfString:toFind].location == NSNotFound)  {
                        NSLog(@" TIMEFRAME DATA: K=%@ *** V=%@", key_TimeFrame, value);
                        NSString *key_TimeFrameAppended = [@"-" stringByAppendingString:key_TimeFrame];
                        NSString *keyCombined =   [key stringByAppendingString:key_TimeFrameAppended];
                        [keyCombinedArray addObject:keyCombined];
                        NSArray *keys4Array = [[NSArray alloc] initWithObjects:value, nil];
                        [_data setObject:[NSMutableDictionary dictionaryWithObjects:keys4Array forKeys:_dataKeys]  forKey:keyCombined];
                    }
                }];
                
            }  //end for loop
            
            _categories = (NSArray *)[NSMutableArray sortArray:[NSMutableArray arrayWithArray:keyCombinedArray] WithSortType:self.sortType];
            
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




//Was working as of 9/12/14 - changed to include timed event- svaz
//-(void)generateData {
//    if ([AppDelegate hasConnectivity])
//    {
//        // Query DB
//        NSError *error = nil;
////        NSInteger appID = [[[ConfigurationManager sharedManager] appID] integerValue];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"yyyy-MM-dd"];
////      [self patientId], @"patient_id",  [@(appID) stringValue],@"app_id",
//        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                         [self patientId], @"patient_id",
//                                         [formatter stringFromDate:[self startDate]],@"start_date",
//                                         [formatter stringFromDate:[self endDate]],@"end_date",
//                                                                                   nil];
//        
//        NSArray *objects = [Chart query:@"insulin_dose_report" params:queryAttributes error:&error];
//         
//        if (error == nil && objects.count > 0){
//
//            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
//            [f setNumberStyle:NSNumberFormatterDecimalStyle];
//            Chart *crt = [objects objectAtIndex:0];
//            for (NSString *key in [crt.chartdata allKeys]){
//                NSArray *array = [[NSArray alloc]initWithObjects:[crt.chartdata objectForKey:key], nil];
//                [_data setObject:[NSMutableDictionary dictionaryWithObjects:array forKeys:_dataKeys]  forKey:key];
//            }
//            _categories = (NSArray *)[NSMutableArray sortArray:[NSMutableArray arrayWithArray:[crt.chartdata allKeys]] WithSortType:self.sortType];
//            
//            
//        }
//        else {
//            if(ERROR_CODE_401(error)) {
//                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//                [app showSessionTerminatedAlert];
//            }
//            else {
//                [self fillWithNulledData];
//                NSLog(@"%@",[error localizedDescription]);
//            }
//        }
//    }
//    else
//    {
//        [self fillWithNulledData];
//        [AppDelegate showNoConnecttivityAlert];
//    }
//    
//}

/*
 * If query fails or there is a connection error, return all zeros to avoid crash
 */
-(void)fillWithNulledData {
    int monthNum = 0;
    for (NSString *month in _categories) {
        NSArray *monthData = [NSArray arrayWithObjects:[NSNumber numberWithDouble:0], nil];
        [_data setObject:[NSMutableDictionary dictionaryWithObjects:monthData forKeys:_dataKeys] forKey:[_categories objectAtIndex:monthNum]];
        monthNum++;
        NSLog(@"%@",month);
    }
}

- (NSArray *) getInsulin{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
//     PatientGlucose *patientGlucose;
    [params setObject:[[ConfigurationManager sharedManager] appID] forKey:@"app_id"];
    [params setObject:[formatter stringFromDate:self.startDate] forKey:@"start_date"];
    [params setObject:[formatter stringFromDate:self.endDate] forKey:@"end_date"];
    NSNumber *patientID = ((User *)[AuthManager defaultManager].currentCredentials).id;
    [params setObject:patientID forKey:@"patient_id"];
    
    __block NSArray *insulin = [NSArray new];
    
    [PatientGlucose query:@"my_unarchived_glucose" params:params offset:0     limit:100 async:^(NSArray *objects, NSError *error) {
        if (error == nil && objects.count > 0){
            insulin = objects;
        }

        for (int i=0; i<objects.count; i++) {
            NSLog(@" Array of glucose %@", [objects objectAtIndex:i]);
        }
        
    }];
        
    return insulin;
}

@end

