    //
//  FatigueDetailTableViewController.m
//  SimpleTable
//
//  Created by Savio Vaz on 6/2/15.
//  Copyright (c) 2015 atpointofcare. All rights reserved.
//

#import <APSDK/AuthManager.h>
#import "FatigueDetailTableViewController.h"
#import "FatigueTableViewCell.h"
//#import "BaseFormViewController.h"
#import "PatientFatigueAnswerViewController.h"
#import "PatientFatigueResultViewController.h"
#import "BaseViewController.h"

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


@interface FatigueDetailTableViewController ()

@end
                               
@implementation FatigueDetailTableViewController
//NSArray *tableData;
//NSMutableArray *tableCellResponse;
int rowCounter;

@synthesize tableView, patientFatigueResultObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if  (self.patientFatigueResultObject == nil){
         // [self getNew];
        
        patientFatigueResult * newPatientFatigueResultObject = [patientFatigueResult new];
        newPatientFatigueResultObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
    
    }
    else
    {
        //sender = patientRow
       // [self getUpdate];

    
//        patientFatigueAnswer.patientFatigueResultId = patientFatigueResult.id;
//        patientFatigueAnswer.id = [[ConfigurationManager sharedManager] appID];
        
        [self loadFatigueAnswerExactMatch];
        
        
        
        
        
        
        
    }//end of else
    
    
        rowCounter =0;
        self.modelObject = [FatigueTableDataObjectModel sharedInstance];
        self.tableData = [self.modelObject getTableData];
        self.tableCellResponse =[self.modelObject getTableCellResponse];
    
    //How to call a function from another class file
    PatientFatigueAnswerViewController *patientFatigueAnswerCall = [[PatientFatigueAnswerViewController alloc] init];
    [patientFatigueAnswerCall writeToServer];
    
    
    
////if (self.patientFatigueAnswerObject) {
//        NSString *qLabel = [self.tableData objectAtIndex:0];
//        NSNumber *cellResponse = [self.tableCellResponse objectAtIndex:0];
//        self.questionLabel = qLabel;
//        self.answerSegNumber = cellResponse;
// //   }
    
//    // Configure Labels
//    [self.firstLabel setText:@"First Label"];
//    [self.secondLabel setText:@"Second Label"];
//    [self.thirdLabel setText:@"Third Label"];
    
    
}
     

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadFatigueAnswerExactMatch{
    [PatientFatigueAnswer query:@"exact_match" params:nil offset:self.tableData.count limit:kListLength async:^(NSArray * objects, NSError * error) {
        if (self.navigationController.topViewController == self) {
            self.listDataState = kDataStateReady;
            if (error) {
                [self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:[error localizedDescription] ? : @"Error"];
            } else {
                [self.tableData removeAllObjects];
                [self.tableData addObjectsFromArray:history];
                [self.tableData addObjectsFromArray:objects];
                if (objects.count > kListLength - 1) {
                    [self.tableData removeLastObject];
                } else {
                    self.listDataState = kDataStateFull;
                }
                [self.tableView reloadData];
                //            - ios cleanup svaz 1/12/15
                //                       [self resize:self.tableView
                //                                 to:CGSizeMake(CGRectGetWidth(self.tableView.frame),
                //                                               self.tableData.count * self.tableView.rowHeight +
                //                                               (self.listDataState == kDataStateFull ? 0 : self.tableView.rowHeight))
                //                           animated:animated];
                //            - ios cleanup svaz 1/12/15  -end
                
                [self popBusyOperation];
                
                if(!HAS_DATA){
                    [self.toolBar showToolBarInView:self.view animated:NO];
                    CGRect frame = self.view.bounds;
                    frame.origin.y += self.toolBar.frame.size.height;
                    //   HIDE TUTORIAL FOR IPAD         -  MSAA cleanup svaz 11/27/14
                    int tutorialX = 0;
                    if (IS_IPAD) {
                        tutorialX =+150;
                    }
                    
                    
                    self.tutorialView = [[TutorialView alloc]initWithFrame:frame];
                    [self.view addSubview:self.tutorialView];
                    
                    UILabel *newLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+tutorialX, 200, 300, 40)];
                    newLabel.text = @"Tap to start adding survey";
                    newLabel.backgroundColor = [UIColor clearColor];
                    newLabel.textColor = [UIColor whiteColor];
                    [self.tutorialView addSubview:newLabel];
                    
                    Arrow *newArrow = [[Arrow alloc]init];
                    newArrow.head = CGPointMake(105+tutorialX, 5);
                    newArrow.tail = CGPointMake(105+tutorialX, 200);
                    [self.tutorialView addArrow:newArrow];
                    
                    
                }
                
            }
        } else [self popBusyOperation];
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"Rows = %lu", (unsigned long)self.tableData.count);
    return  self.tableData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
     NSLog(@"count = %lu", (unsigned long)self.tableData.count);
    
    self.tableCellResponse =[self.modelObject getTableCellResponse];
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    FatigueTableViewCell *cell = (FatigueTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.questionLabel.text = [self.tableData objectAtIndex:indexPath.row];
    NSUInteger n =  [[self.tableCellResponse objectAtIndex:indexPath.row] intValue];
    cell.segmentedControl.selectedSegmentIndex =  [[self.tableCellResponse objectAtIndex:indexPath.row] intValue];
    cell.segmentedControl.selectedSegmentIndex = n;
    
    //To make the size BIGGER 2 cell in "Sometimes"
    [[UISegmentedControl appearance] setContentMode:UIViewContentModeScaleToFill];
    [[UISegmentedControl appearance] setWidth:80.0 forSegmentAtIndex:2];
    
    NSInteger rowNumber = cell.tag ;
    NSLog(@"Question # =  %ld",(long)rowNumber);
    NSLog(@"*** n= %ld", (long)cell.segmentedControl.selectedSegmentIndex);
    NSLog(@" -------------------");
    //////////////////////////////
    
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    for (NSInteger j = 0; j < [self.tableView numberOfSections]; ++j)
    {
        for (NSInteger i = 0; i < [self.tableView numberOfRowsInSection:j]; ++i)
        {
            [cells addObject:[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
        }
    }
    
    self.tableCellResponse =[self.modelObject getTableCellResponse];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

//Light blue color every other cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row % 2 == 0){
        cell.contentView.backgroundColor = [UIColor colorWithRed:0.81 green:0.89 blue:0.95 alpha:1.0];
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
   NSString * test = [self.tableData objectAtIndex:indexPath.row];
    
    int cell = [[self.tableCellResponse objectAtIndex:indexPath.row] intValue];
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:[NSString stringWithFormat:@"Segment selected: %d, \n Question Label: %@",cell,test] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];

    

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//============== Close Tapped Button  ===================

- (IBAction)closeButtonTapped:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
    
}

//==============SaveTapped Button  ===================

- (IBAction)saveTapped:(id)sender {
    
   // [self saveTapped];
    
    [self pushBusyOperation];
    
    
    //UPDATE ROW
    if (self.editMode && self.somethingChanged) {
 
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        ///NSError *err = nil;
        //self.patientFatigueAnswer.patientFatigueResultId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        
        self.patientFatigueAnswerObject.answer = self.answerSegNumber;
        self.patientFatigueAnswerObject.question = self.questionLabel;
        self.patientFatigueAnswerObject.subscale = self.subscaleNumber;
        
        self.patientFatigueResultObject.createdOn = [NSDate date];
        self.patientFatigueResultObject.completedOn = self.completeOnDate;
        self.patientFatigueResultObject.isCompleted= [NSNumber numberWithBool:YES];
        self.patientFatigueResultObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        self.patientFatigueResultObject.physicalSubscale = self.physicalSubscaleValue;
        self.patientFatigueResultObject.psychosocialSubscale = self.psychosocialSubscaleValue;
        self.patientFatigueResultObject.cognitiveSubscale = self.cognitiveSubscaleValue;
        
        [self pushBusyOperation];

            [self.patientFatigueAnswerObject updateAsync:^(id object, NSError *error) {
            //[self.patientFatigueAnswerObject update:&err];
            
            if(error){
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:@"Fatigue record failed to save."];
                //return  ;
            }
            else {
                NSLog(@"Update successful ***********");
                [self.navigationController popViewControllerAnimated:YES];
            }

        }];
    } else{
        //INSERT NEW ROW
        
        PatientFatigueAnswer *newPatientFatigueAnswerObject = [PatientFatigueAnswer new];
        
        PatientFatigueResult *newPatientFatigueResultObject = [PatientFatigueResult new];
        
        newPatientFatigueResultObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
        
        //newPatientFatigueAnswerObject.appId = [[ConfigurationManager sharedManager] appID]  ;
        newPatientFatigueAnswerObject.answer = self.answerSegNumber;
        newPatientFatigueAnswerObject.question = self.questionLabel;
        newPatientFatigueAnswerObject.subscale = self.subscaleNumber;
        newPatientFatigueAnswerObject.sortId = self.sortIdValue;
//
        
        //appId ??
        //patientFatigueResultId ??
//        newPatientFatigueAnswerObject.answer = @2;
//        newPatientFatigueAnswerObject.question = @"Question 2";
//        newPatientFatigueAnswerObject.subscale = @2;
//        newPatientFatigueAnswerObject.sortId = @2;
        
        //not surehow to call this ID??
        newPatientFatigueAnswerObject.patientFatigueResultId = @22222;
        ////
        newPatientFatigueResultObject.createdOn = [NSDate date];
        newPatientFatigueResultObject.completedOn = self.completeOnDate;
         newPatientFatigueResultObject.isCompleted= [NSNumber numberWithBool:YES];
        
         newPatientFatigueResultObject.physicalSubscale = self.physicalSubscaleValue;
         newPatientFatigueResultObject.psychosocialSubscale = self.psychosocialSubscaleValue;
         newPatientFatigueResultObject.cognitiveSubscale = self.cognitiveSubscaleValue;
        

        //need to create a newPatientFatigueResultObject
        //get the ID of that
        
        [newPatientFatigueResultObject  createAsync:^(id obj, NSError * error) {
            if (error) {
                [self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:@"New Fatigue record failed to add."];
            } else {
                //                [self popBusyOperation];
                //[_self showMessage:@"Alerts record successfully saved."];
                NSLog(@"createAsync Success  " );
                //                [self dismissViewControllerAnimated:YES completion:nil];
                [self.navigationController popViewControllerAnimated:YES];
                
                
            }
        }];
        
        
    }
    
    //
    
    
    [self popBusyOperation];


} //----------- END of saveTapped----------


//============== Back Tapped Button  ===================



-(void)back{
    
    if(!self.editMode){
        [super back];
        return;
    }
    
    
    if([self saveTapped]) [super back];
    else return;
}

@end
