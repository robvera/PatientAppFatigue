//
//  PatientFatigueResultViewController.h
//  My360-iOS
//
//  Created by Roberto M. Vera on 6/10/15.
//
//

#import <UIKit/UIKit.h>
#import "FatigueTableDataObjectModel.h"
#import "BaseFormViewController.h"
#import <APSDK/PatientFatigueResult+Remote.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import "PIKCommon.h"
#import "PikConstants.h"

@interface PatientFatigueResultViewController : BaseFormViewController

@property (strong, nonatomic) PatientFatigueResult * patientFatigueResultObject;

@property (strong, nonatomic ) FatigueTableDataObjectModel *modelObject;
@property (strong, nonatomic )NSArray *tableDataValue;
@property (strong, nonatomic )NSMutableArray *tableCellResponseValue;

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSNumber * cognitiveSubscaleValue;
@property (nonatomic, strong) NSDate * completedOnDate;
@property (nonatomic, strong) NSDate * createdOnDate;
@property (nonatomic, strong) NSNumber * isCompletedBool;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * physicalSubscaleValue;
@property (nonatomic, strong) NSNumber * psychosocialSubscaleValue;
@property (nonatomic, strong) NSOrderedSet * patientFatigueAnswersValue;



@end
