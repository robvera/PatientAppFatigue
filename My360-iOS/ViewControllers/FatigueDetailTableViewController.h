//
//  FatigueDetailTableViewController.h
//  SimpleTable
//
//  Created by Savio Vaz on 6/2/15.
//  Copyright (c) 2015 atpointofcare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "FatigueTableDataObjectModel.h"
//#import "BaseFormViewController.h"
#import <APSDK/PatientFatigueResult+Remote.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import "PIKCommon.h"
#import "PikConstants.h"

//@interface TableViewController : UITableViewController

@protocol FatigueDetailTableViewControllerDelegate <NSObject>

@end
@interface FatigueDetailTableViewController : BaseTableViewController

//@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic ) FatigueTableDataObjectModel *modelObject;
//@property (strong, nonatomic )NSArray *tableData;
@property (strong, nonatomic )NSMutableArray *tableCellResponse;

@property (strong, nonatomic )NSMutableArray *tableAnswer;
@property (strong, nonatomic )NSMutableArray *tableQuestion;

//RV Added 6/9/15

@property (nonatomic, weak) id <FatigueDetailTableViewControllerDelegate> delegate;

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


- (IBAction)closeButtonTapped:(id)sender;
- (IBAction)saveTapped:(id)sender;

- (BOOL)saveTapped;
- (void)back;


@end
