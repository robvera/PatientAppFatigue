//
//  PatientFatigueAnswerViewController.m
//  My360-iOS
//
//  Created by Roberto M. Vera on 6/10/15.
//
//

#import "PatientFatigueAnswerViewController.h"
#import "FatigueDetailTableViewController2.h"
#import <APSDK/AuthManager.h>
#import "FatigueTableViewCell.h"
#import "BaseFormViewController.h"

#import "FatigueTableDataObjectModel.h"
#import "FatigueListViewController.h"
#import <APSDK/PatientFatigueAnswer.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import <APSDK/PatientFatigueResult.h>
#import <APSDK/PatientFatigueResult+Remote.h>
#import "FatigueCell.h"

#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "FatigueCell.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PIKCommon.h"
#import "PikConstants.h"


@interface PatientFatigueAnswerViewController ()

@end

@implementation PatientFatigueAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelObject = [FatigueTableDataObjectModel sharedInstance];
    self.tableDataValue = [self.modelObject getTableData];
    self.tableCellResponseValue =[self.modelObject getTableCellResponse];
    
    if (self.editMode) {
        
        self.answerSegNumber = self.patientFatigueAnswerObject.answer;
        self.questionLabel = self.patientFatigueAnswerObject.question;
        self.patientFatigueResultIdValue = self.patientFatigueAnswerObject.patientFatigueResultId;
        self.sortIdNumber = self.patientFatigueAnswerObject.sortId;
        
    }
    else {
        self.answerSegNumber =  nil;
        self.questionLabel = nil;
        self.patientFatigueResultIdValue = nil;
        self.sortIdNumber = nil;
        self.subscaleTotal = nil;
    }
    
         
         
    //    self.id= self.id;
    
    //    NSUInteger count = [self.tableCellResponseValue count];
    //    for (NSUInteger index = 0; index < count ; index++) {
    //        [self doSomethingWith:[self.tableCellResponseValue objectAtIndex:index]];
    //    }
    //
    
    //    NSNumber *cellResponse = [self.tableCellResponseValue objectAtIndex:0];
    //    self.answerSegNumber = cellResponse;
    //
    //    NSString *qLabel = [self.tableDataValue objectAtIndex:0];
    //    self.questionLabel = qLabel;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) writeToServer{
   ///code
    
 }







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
