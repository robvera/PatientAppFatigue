//
//  SimpleTableDataObjectModel.m
//  SimpleProjectSavio
//
//  Created by Savio Vaz on 6/2/15.
//  Copyright (c) 2015 SVaz LLC. All rights reserved.
//

#import "FatigueTableDataObjectModel.h"

@implementation FatigueTableDataObjectModel

static FatigueTableDataObjectModel *sharedInstance = nil;


+ (FatigueTableDataObjectModel *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance= [[super allocWithZone:nil] init];
    });
    
    return sharedInstance;
}

- (void) setAnswers:(NSMutableArray*) answers{
    self.tableCellResponse = answers;
}
- (instancetype)init{
    self.tableCellResponse = [NSMutableArray new];
    self.tableData = [NSArray arrayWithObjects:
                      @"I have been less alert.",
                      @"I have had difficulty paying attention for long periods of time.",
                      @"I have been unable to think clearly.",
                      @"I have been clumsy and uncoordinated.",
                      @"I have been forgetful.",
                      @"I have had to pace myself in my physical activities.",
                      @"I have been less motivated to do anything that requires physical effort.",
                      @"I have been less motivated to participate in social activities.",
                      @"I have been limited in my ability to do things away from home.",
                      @"I have had trouble maintaining physical effort for long periods.",
                      @"I have had difficulty making decisions.",
                      @"I have been less motivated to do anything that requires thinking.",
                      @"My muscles have felt weak.",
                      @"I have been physically uncomfortable.",
                      @"I have had trouble finishing tasks that require thinking.",
                      @"I have had difficulty organizing my thoughts when doing things at home or at work.",
                      @"I have been less able to complete tasks that require physical effort.",
                      @"My thinking has been slowed down.",
                      @"I have had trouble concentrating.",
                      @"I have limited my physical activities.",
                      @"I have needed to rest more often or for longer periods.", nil];
    
    // Stores default response on the first time for this parent row------
    // ie if this row to be creates is NNNN EEEE WWWW !!!!!!
    for (NSInteger i = 0; i < 21; i++){
        NSNumber *n =[NSNumber numberWithInt:-1] ;
       [self.tableCellResponse addObject:n];
    }
    
   return self;
}


- (void) setTableResponse:(int)segmentResponse forQuestionNumber:(int)questionNumber{
    // Insert into approptiate place the value of new tapped segment.
    
    //#1 for questionNumber set segmentResponse in array self.tableCellResponse
    // ex for question 20, response was Rarely
    
//    [self.tableCellResponse insertObject:[NSNumber numberWithInt:segmentResponse] atIndex:questionNumber];
    
    
    NSString *q = [self.tableData objectAtIndex:questionNumber];
    NSString *a =[self.tableCellResponse objectAtIndex:questionNumber];
     NSLog(@"Q = %@, A = %@", q,a);
    NSString *qnum = [NSString stringWithFormat:@"%d",  questionNumber  ];
    
//    [NSString stringWithFormat: @"%ld", (long)[NSString stringWithFormat: @"%ld", (long)questionNumber]];
    NSLog(@"qnum = %@ , response = %d", qnum ,segmentResponse );
    NSNumber * segmentRes  =[NSNumber numberWithInt:segmentResponse];

//      [self.tableCellResponse setValue:segmentRes  forKey: qnum];
    NSLog(@"before= %@ ",self.tableCellResponse);
    [self.tableCellResponse setObject:segmentRes atIndexedSubscript:questionNumber];
    NSLog(@"after= %@ ",self.tableCellResponse);
    
   
}

- (NSArray*)getTableData{
    return self.tableData;
}
- (NSMutableArray*)getTableCellResponse{
    return self.tableCellResponse;
}


@end
