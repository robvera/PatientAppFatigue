//
//  PatientFatigueAnswerViewController.h
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

@interface PatientFatigueAnswerViewController : BaseFormViewController

@property (strong, nonatomic) PatientFatigueAnswer * patientFatigueAnswerObject;

@property (strong, nonatomic ) FatigueTableDataObjectModel *modelObject;
@property (strong, nonatomic )NSArray *tableDataValue;
@property (strong, nonatomic )NSMutableArray *tableCellResponseValue;

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * answerSegNumber;
@property (nonatomic, strong) NSNumber * patientFatigueResultIdValue;
@property (nonatomic, strong) NSString * questionLabel;
@property (nonatomic, strong) NSNumber * sortIdNumber;
@property (nonatomic, strong) NSNumber * subscaleTotal;

- (void) writeToServer;

@end
