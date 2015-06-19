//
//  JournalReasonGlobalObject.h
//  My360-iOS
//
//  Created by Savio Vaz on 4/1/14.
//
//

#import <Foundation/Foundation.h>

@interface JournalReasonGlobalObject : NSObject
+ (id)sharedInstance;
- (NSMutableArray*) getTreatmentList;
- (NSArray*) getJournalReasons;

@property (nonatomic, strong) NSMutableArray *patientTreatmentsObjects;
@property (nonatomic, strong)  NSMutableArray *adherence;
@property (nonatomic, strong)  NSMutableArray *completeListOfObjects;
@property (nonatomic) BOOL treatmentsComplete;
@property (nonatomic) BOOL adherenceLogsComplete;
@property (nonatomic, strong) NSString * treatmentsComplete2;
@property (nonatomic, strong) NSString * adherenceLogsComplete2;
@property (nonatomic, strong) NSDate *currentDate;

enum recordStatus : NSInteger {
    recordNEW = 1,
    recordOLD = 2,
    recordModifiedOLD = 3,
    recordModifiedNEW = 4
};

- (NSDate *) getParsedDate:(NSDate*) theDate2Parse;
-(NSString *)getUTCFormateDate:(NSDate *)localDate;
@end
