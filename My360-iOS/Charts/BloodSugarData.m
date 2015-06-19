//
//  BloodSugarData.m
//  My360-iOS
//
//  Created by Savio Vaz on 6/25/14.
//
//



/* WORKING API CODE
 if(map.has_key?(key))
 if(map[key].has_key?(time_frame))
 map[key][time_frame] += glucose_reading
 map["time_frame_sort"] = time_frame_sort_id
 # innermap[time_frame] += glucose_reading
 else
 map[key][time_frame] = glucose_reading
 
 map["time_frame_sort"] = time_frame_sort_id
 
 end
 
 else
 
 innermap = {}
 
 innermap[time_frame] = glucose_reading
 
 map[key]  = innermap
 
 end
 
 
 
 
 */

#import "BloodSugarData.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/Chart+Remote.h>
#import "OrderedDictionary.h"

@implementation BloodSugarData
- (id)init {
    self = [super init];
    if (self) {
        
        // Init datasource
        _data = [NSMutableDictionary new];
        
        //init keys (used for series)
        _dataKeys = [NSArray arrayWithObjects:@"BloodSugarData", nil];
        //_dataKeys = [NSMutableArray new];
        
        //init categories
        _categories = [[NSArray alloc] init];
        
        //        _chartType = CHART_TYPE_BAR;
        _chartType = CHART_TYPE_LINE;
        [self setPatientId:[NSNumber numberWithInt:-1]];
        //        _sortType = CHART_SORT_NONE;
        _sortType = CHART_SORT_DAY;
        
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
        
        NSArray *objects = [Chart query:@"blood_sugar_report" params:queryAttributes error:&error];
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        
        Chart *crtsort = [objects objectAtIndex:0];
        
        NSArray *ka = [crtsort.chartdata allKeys] ;
        //        NSLog(@"all Keys %@",ka);
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
                    if ( [key_TimeFrame rangeOfString:toFind].location == NSNotFound) {
                        
                    
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

@end


/* works 8/17/14 but not well
 {
 "After a snack" = 12;
 "After lunch" = 22;
 "Before a snack" = 55;
 "Before bedtime" = 55;
 "Before breakfast" = 30;
 "Before lunch" = 33;
 Breakfast = 45;
 "During the night" = 22;
 "time_frame_sort" = 6;
 }
 
 
 
 if(map.has_key?(key))
 if(map[key].has_key?(time_frame))
 map[key][time_frame] += glucose_reading
 # map[key][time_frame]["time_frame_sort"] = time_frame_sort_id
 else
 map[key][time_frame] = glucose_reading
 map[key]["time_frame_sort"] = time_frame_sort_id
 end
 else
 innermap = {}
 # sort={}
 innermap[time_frame] = glucose_reading
 innermap["time_frame_sort"] = time_frame_sort_id
 #sort["time_frame_sort"] = time_frame_sort_id
 map[key]=innermap
 end
 */
