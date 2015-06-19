//
//  SimpleTableDataObjectModel.h
//  SimpleProjectSavio
//
//  Created by Savio Vaz on 6/2/15.
//  Copyright (c) 2015 SVaz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FatigueTableDataObjectModel : NSObject
+ (id)sharedInstance;
@property (retain, nonatomic ) NSArray *tableData;
@property (strong, nonatomic ) NSMutableArray *tableCellResponse;


-(void) setTableResponse:(int)segmentResponse forQuestionNumber:(int)questionNumber ;
- (NSArray*)  getTableData;
- (NSMutableArray*) getTableCellResponse;
- (void) setAnswers:(NSMutableArray*) answers;
@end
