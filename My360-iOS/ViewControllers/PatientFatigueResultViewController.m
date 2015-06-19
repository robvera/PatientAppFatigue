//
//  PatientFatigueResultViewController.m
//  My360-iOS
//
//  Created by Roberto M. Vera on 6/10/15.
//
//

#import "PatientFatigueResultViewController.h"
#import "PatientFatigueAnswerViewController.h"
#import "FatigueDetailTableViewController2.h"
#import <APSDK/AuthManager.h>
#import "FatigueDetailTableViewController2.h"
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


@interface PatientFatigueResultViewController ()

@end

@implementation PatientFatigueResultViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.modelObject = [FatigueTableDataObjectModel sharedInstance];
    self.tableDataValue = [self.modelObject getTableData];
    self.tableCellResponseValue =[self.modelObject getTableCellResponse];
    
    if (self.editMode) {
        
        self.archived = self.patientFatigueResultObject.archived;
        
        self.createdOnDate =  self.patientFatigueResultObject.createdOn;
        self.completedOnDate = self.patientFatigueResultObject.completedOn;
        self.isCompletedBool = self.patientFatigueResultObject.isCompleted;
        self.patientId =  self.patientFatigueResultObject.patientId;
        
        self.physicalSubscaleValue = self.patientFatigueResultObject.physicalSubscale;
        self.psychosocialSubscaleValue =  self.patientFatigueResultObject.psychosocialSubscale;
        self.cognitiveSubscaleValue = self.patientFatigueResultObject.cognitiveSubscale;
        
        //self.patientFatigueAnswersValue = self.patientFatigueResultObject.patientFatigueAnswers;
    }
    else {
        
        self.archived =  nil;
        self.createdOnDate = nil;
        self.completedOnDate = nil;
        self.isCompletedBool = nil;
        self.patientId = nil;
        self.physicalSubscaleValue = nil;
        self.psychosocialSubscaleValue = nil;
        self.patientFatigueAnswersValue = nil;
    }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)physicalSubscaleTotal{
    
    //questions Aswer from segment
    //Q4+Q6+Q7+Q10+Q13+Q14+Q17+Q20+Q21.
    
    //How to call a function from another class file
    FatigueTableViewCell *segmentedControlCall = [[FatigueTableViewCell alloc] init];
    [segmentedControlCall segmentedControlAction:(id) self];
    

    
//    switch ( ) {
//        case 1:
//            //if array position is = 3
//            //get value of array and add to
//            // totalValue = []
//            //return totalValue
//            break;
//        case 2:
//            <#statements#>
//            break;
//        case 3:
//            <#statements#>
//            break;
//        case 4:
//            <#statements#>
//            break;
//        case 5:
//            <#statements#>
//            break;
//        case 6:
//            <#statements#>
//            break;
//        case 7:
//            <#statements#>
//            break;
//        case 8:
//            <#statements#>
//            break;
//        case 9:
//            <#statements#>
//            break;
//            
//        default:
//            break;
//    }
    
}
-(void)psychosocialSubscaleTotal{
    
    //questions Aswer from segment
    //Q1+Q2+Q3+Q5+Q11+Q12+Q15+Q16+Q18+Q19
}
-(void)cognitiveSubscaleTotal{
    
    //questions Aswer from segment
    //Q8+Q9
}

-(void)addSubscaleTotal{
    
    // add cognitiveSubscaleValue + physicalSubscaleValue + psychosocialSubscaleValue
    
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
