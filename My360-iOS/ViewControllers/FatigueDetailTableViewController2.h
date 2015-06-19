//
//  FatigueDetailTableViewController2.h
//  My360-iOS
//
//  Created by Roberto M. Vera on 6/16/15.
//
//


#import <UIKit/UIKit.h>

#import "BaseFormViewController.h"
#import "BaseTableViewController.h"
#import "FatigueTableDataObjectModel.h"
//#import "BaseFormViewController.h"
#import <APSDK/PatientFatigueResult+Remote.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import "PIKCommon.h"
#import "PikConstants.h"


@protocol FatigueDetailTableViewController2Delegate <NSObject>

@end
//
@interface FatigueDetailTableViewController2: BaseTableViewController
- (IBAction)saveTapped:(id)sender;
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic ) FatigueTableDataObjectModel *modelObject;
@property (retain, nonatomic )NSMutableArray *tableDataFatigue;
@property (retain, nonatomic )NSMutableArray *tableDataFatigueFromDB;
@property (strong, nonatomic )NSMutableArray *tableCellResponse;

@property (strong, nonatomic )NSMutableArray *tableAnswer;
@property (strong, nonatomic )NSMutableArray *tableQuestion;

//RV Added 6/9/15

@property (nonatomic, weak) id <FatigueDetailTableViewController2Delegate> delegate;

@property (strong, nonatomic) PatientFatigueAnswer * patientFatigueAnswerObject;
@property (strong, nonatomic) PatientFatigueResult * patientFatigueResultObject;


@property (strong, nonatomic) NSNumber *physicalSubscaleValue;
@property (strong, nonatomic) NSNumber *psychosocialSubscaleValue;
@property (strong, nonatomic) NSNumber *cognitiveSubscaleValue;

@property (strong, nonatomic) NSNumber *sortIdValue;
@property (strong, nonatomic) NSDate * completeOnDate;
@property (strong, nonatomic) NSNumber *answerSegNumber;
@property (strong, nonatomic) NSString *questionLabel;
@property (strong, nonatomic) NSNumber *subscaleNumber;
@property (strong, nonatomic) NSNumber *patientId;



@property (nonatomic) BOOL editMode ;
@property  ( nonatomic) BOOL somethingChanged  ;
@property (strong, nonatomic )NSMutableArray *history;

- (IBAction)closeButtonTapped:(id)sender;
- (IBAction)saveTapped:(id)sender;

- (BOOL)saveTapped;
- (void)back;

@end
