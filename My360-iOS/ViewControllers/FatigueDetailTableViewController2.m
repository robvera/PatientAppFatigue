//
//  FatigueDetailTableViewController2.m
//  My360-iOS
//
//  Created by Roberto M. Vera on 6/16/15.
//
//


#import <APSDK/AuthManager.h>
#import <APSDK/PatientFatigueAnswer.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import <APSDK/PatientFatigueResult.h>
#import <APSDK/PatientFatigueResult+Remote.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>

#import <APSDK/Patient+Remote.h>


#import "PatientFatigueAnswerViewController.h"
#import "PatientFatigueResultViewController.h"
#import "FatigueTableViewCell.h"
#import "FatigueTableDataObjectModel.h"
#import "FatigueListViewController.h"
#import "FatigueDetailTableViewController2.h"
#import "FatigueCell.h"
#import "PIKCommon.h"
#import "PikConstants.h"



@interface FatigueDetailTableViewController2 ()

@end

@implementation FatigueDetailTableViewController2
int rowCounter;
NSNumber *patientId;
// Flag to determine if NEW or OLD Fatigue & determines if UPDATE or INSERT into db
BOOL IsNew;
NSMutableArray * updateAnswers;
//@synthesize tableDataFatigue ;

- (BOOL)saveTapped{
    return YES;
}




-(void)viewWillAppear:(BOOL)animated{
    if (updateAnswers.count > 0) {
        //Asumes this is an UPDATE to DB
        self.modelObject = [FatigueTableDataObjectModel sharedInstance];
        [self.modelObject setAnswers:updateAnswers];
        
    }
 
    
}
-(void)getModelData{
    self.modelObject = [FatigueTableDataObjectModel sharedInstance];
    NSArray * questions =    [[self.modelObject getTableData] copy];
    NSArray * answers =[self.modelObject getTableCellResponse];
    
    // FOr each tableDataFatigue  populate a PatientFatigueAnswer object
    for (int i=0; i< 21; i++) {
        PatientFatigueAnswer * newPatientFatigueAnswerObject = [PatientFatigueAnswer new];
        newPatientFatigueAnswerObject.patientFatigueResultId = patientId;
        newPatientFatigueAnswerObject.question = [questions objectAtIndex:i];
        newPatientFatigueAnswerObject.answer = [answers objectAtIndex:i];
        newPatientFatigueAnswerObject.sortId = [NSNumber numberWithInt:i] ;
#warning Need Subscale???
        [self.tableDataFatigue addObject:newPatientFatigueAnswerObject];
        //        NSLog(@"Rows = %lu", (unsigned long)self.tableDataFatigue.count);
    }
    
}


- (void) loadData{
    [self.tableView becomeFirstResponder];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    updateAnswers = [NSMutableArray new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:@"DataRetrieved" object:nil];
    
    patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
    
    if  (self.patientFatigueResultObject == nil){
        // Get dummy empty data for new entry
        self.tableDataFatigue = [NSMutableArray new];
        IsNew = YES;
        rowCounter =0;
        [self getModelData];
        [self.tableView reloadData];
        
    }
    else
    {
        // UPDATE ****
        IsNew =NO;
        // Load from DB for patient_id and selected Row in Parent Calling VC
        self.tableDataFatigue = [NSMutableArray new];
        self.tableDataFatigueFromDB =  [NSMutableArray new]  ;
        // blank data from Model
        [self getModelData];
//        [self loadFatigueAnswerExactMatch];
//         [self loadFatigueAnswer ];
        [self.tableDataFatigueFromDB addObjectsFromArray:[self loadFatigueAnswer ]];
        [self.tableView reloadData];
        
    }

    //How to call a function from another class file
//    PatientFatigueAnswerViewController *patientFatigueAnswerCall = [[PatientFatigueAnswerViewController alloc] init];
//    [patientFatigueAnswerCall writeToServer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSArray *)loadFatigueAnswer{
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    
    [params setObject:self.patientFatigueResultObject.id forKey:@"patient_fatigue_result_id"];
    NSError *error = nil;
    NSArray *objects =[PatientFatigueAnswer query:@"exact_match" params:params error:&error];
    
    if (error == nil && objects.count > 0){
          NSLog(@"%@",objects);
        return objects;
    }
    else {
        if(ERROR_CODE_401(error)) {
            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [app showSessionTerminatedAlert];
        }
        else {
           
            NSLog(@"%@",[error localizedDescription]);
        }
        return nil;
    }
    
}
- (void)loadFatigueAnswerExactMatch{
    
    NSLog(@"patientFatigueResultObject = %@, created- %@", self.patientFatigueResultObject.id  , self.patientFatigueResultObject.createdOn );
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:self.patientFatigueResultObject.id forKey:@"patient_fatigue_result_id"];
    [PatientFatigueAnswer query:@"exact_match" params:params offset:0 limit:21 async:^(NSArray * objects, NSError * error) {
        if (self.navigationController.topViewController == self) {
         //   self.listDataState = kDataStateReady;
            if (error) {
                [self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:[error localizedDescription] ? : @"Error"];
            } else {
                //                self.tableDataFatigueFromDB = [[NSMutableArray alloc] init];
                //                if (self.tableDataFatigue.count>0) {
                //                    NSLog(@"self.tableDataFatigue.count = %lu",(unsigned long)self.tableDataFatigue.count);
                //                    [self.tableDataFatigue removeAllObjects];
                //                }
                
                //                [self.tableDataFatigue addObjectsFromArray:self.history];
                [self.tableDataFatigueFromDB addObjectsFromArray:objects];
                //
                //                if (objects.count > kListLength - 1) {
                //                      if (self.tableDataFatigue.count>0) {
                //                    [self.tableDataFatigue removeLastObject];
                //                      }
                //                } else {
                //                    self.listDataState = kDataStateFull;
                //                }
                //[self popBusyOperation];
                NSLog(@"self.tableDataFatigue.count = %lu",(unsigned long)self.tableDataFatigueFromDB.count);
                //ispatch_sync(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"DataRetrieved" object:nil userInfo:nil];
                
                //  });
                //                [self.tableView reloadData];
                
            }
        } else [self popBusyOperation];
    }];
    //        [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection: Rows = %lu", (unsigned long)self.tableDataFatigue.count);
    return  self.tableDataFatigue.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cellForRowAtIndexPath -- indexPathRow  = %lu", (unsigned long)indexPath.row);
    static NSString *simpleTableIdentifier = @"FatigueTableCell";
    
    FatigueTableViewCell *cell = (FatigueTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    // FatigueTableViewCell *cell =  [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    PatientFatigueAnswer * newPatientFatigueAnswerObject =  [self.tableDataFatigue objectAtIndex:indexPath.row];
    cell.questionLabel.text = newPatientFatigueAnswerObject.question;
    if ( !IsNew) {
        if (self.tableDataFatigueFromDB.count > 0 ) {
            // getting db answers
            PatientFatigueAnswer * dbPatientFatigueAnswerObject =  [self.tableDataFatigueFromDB objectAtIndex:indexPath.row];
            NSInteger j = [dbPatientFatigueAnswerObject.answer integerValue];
            cell.segmentedControl.selectedSegmentIndex =j ;
             NSLog(@"*DB*   = Q = %@; *** a = %ld", newPatientFatigueAnswerObject.question,  (long)j  );
            
            self.modelObject = [FatigueTableDataObjectModel sharedInstance];
            
             updateAnswers =[self.modelObject getTableCellResponse];
            [updateAnswers insertObject:[NSNumber numberWithInteger:j] atIndex:indexPath.row];
            
        }
    }else{
        // NEW ANSWERS
        NSInteger j = [newPatientFatigueAnswerObject.answer integerValue];
        cell.segmentedControl.selectedSegmentIndex =j ;
        NSLog(@"*NEW*   = Q = %@; *** a = %ld", newPatientFatigueAnswerObject.question,  (long)j  );
    }
    
    //  no highlight cell when click
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //To make the size BIGGER 2 cell in "Sometimes"
    [[UISegmentedControl appearance] setContentMode:UIViewContentModeScaleToFill];
    [[UISegmentedControl appearance] setWidth:80.0 forSegmentAtIndex:2];
    cell.tag = indexPath.row;
    NSLog(@" -------------------");
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
//    NSString * test = [self.tableDataFatigue objectAtIndex:indexPath.row];
//    
//    int cell = [[self.tableCellResponse objectAtIndex:indexPath.row] intValue];
//    UIAlertView *messageAlert = [[UIAlertView alloc]
//                                 initWithTitle:@"Row Selected" message:[NSString stringWithFormat:@"Segment selected: %d, \n Question Label: %@",cell,test] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    
//    // Display Alert Message
//    [messageAlert show];
    
}




//============== Close Tapped Button  ===================

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//==============SaveTapped Button  ===================

-(void) insertData{
NSLog(@"insertData");
    
    //INSERT NEW ROW
    [self pushBusyOperation];
    
    __block NSMutableArray *childObjects = [NSMutableArray new];
    
    NSNumber *incomplete = [NSNumber numberWithInt:0];
    NSNumber *subscale = [NSNumber numberWithInt:0];
    NSNumber *physicalSubscale = [NSNumber numberWithInt:0];
    NSNumber *psychosocialSubscale = [NSNumber numberWithInt:0];
    NSNumber *cognitiveSubscale = [NSNumber numberWithInt:0];
    __block NSNumber *patient_fatigue_result_id ;
    
    // NSMutableArray *array = [self.modelObject getTableCellResponse] ;
    NSArray * question =[self.modelObject getTableData];
    NSArray * answers =[self.modelObject getTableCellResponse];
    NSNumber *kk ;
    
    for (int i = 0 ; i<21; i++) {
        int questionNum = i+ 1;
        
        kk =[answers objectAtIndex:i];
        
        NSLog(@" KK===  %@    ", kk);
        
        if(questionNum == 1 || questionNum == 2 || questionNum == 3 || questionNum == 5 || questionNum == 11 || questionNum == 12 || questionNum == 15 || questionNum == 16 || questionNum == 18 || questionNum == 19){
            
            cognitiveSubscale = [NSNumber numberWithInteger:[cognitiveSubscale integerValue] + [kk integerValue] ];
            self.cognitiveSubscaleValue = cognitiveSubscale;
            
        }
        
        else if (questionNum == 4 || questionNum == 6 || questionNum == 7 || questionNum == 10 || questionNum == 13 || questionNum == 14 || questionNum == 17 || questionNum == 20 || questionNum == 21){
            
            physicalSubscale = [NSNumber numberWithInteger:[physicalSubscale integerValue] + [kk integerValue] ];
            self.physicalSubscaleValue = physicalSubscale;
            
        }
        else if (questionNum == 8 || questionNum == 9 ){
            psychosocialSubscale = [NSNumber numberWithInteger:[psychosocialSubscale integerValue] + [kk integerValue] ];
            self.psychosocialSubscaleValue = psychosocialSubscale;
            
        }
        
        
        if([kk isEqualToNumber:[NSNumber numberWithInt:-1 ] ]){
            incomplete = [NSNumber numberWithInt:-1];
        }
    }// END of For Loop
    
    
    
    
    //Getting values  for teh Subscale(s)
    if(incomplete == [NSNumber numberWithInt: -1]){
        self.physicalSubscaleValue =[NSNumber numberWithInt:  -1];
        self.psychosocialSubscaleValue =[NSNumber numberWithInt:  -1];
        self.cognitiveSubscaleValue =[NSNumber numberWithInt:  -1];
        self.subscaleNumber =[NSNumber numberWithInt:  -1];
    }
    else{
        self.subscaleNumber = [NSNumber numberWithInteger:[physicalSubscale integerValue] + [psychosocialSubscale integerValue]  + [cognitiveSubscale integerValue]];
    }
    
    
    //////////////////////// //////////////////////// //////////////////////// ///////////
    ////////////////////////  newPatientFatigueResult /////////////////////////////////////
    
    PatientFatigueResult *newPatientFatigueResultObject = [PatientFatigueResult new];
    
     newPatientFatigueResultObject.patientId = ((User *)[AuthManager defaultManager].currentCredentials).id;
    
    //newPatientFatigueResultObject.completedOn = self.completeOnDate;
    newPatientFatigueResultObject.completedOn = [NSDate date];
    newPatientFatigueResultObject.createdOn = [NSDate date];
    //newPatientFatigueResultObject.isCompleted = [NSNumber numberWithBool:YES];
    newPatientFatigueResultObject.isCompleted = incomplete;
    newPatientFatigueResultObject.totalSubscale = self.subscaleNumber;
    newPatientFatigueResultObject.physicalSubscale = self.physicalSubscaleValue;
    newPatientFatigueResultObject.psychosocialSubscale = self.psychosocialSubscaleValue;
    newPatientFatigueResultObject.cognitiveSubscale = self.cognitiveSubscaleValue;
   
    
    NSLog(@"completedOn %@",newPatientFatigueResultObject.completedOn);
    NSLog(@"createdOn %@",newPatientFatigueResultObject.createdOn);
    NSLog(@"sortId %@",newPatientFatigueResultObject.totalSubscale);
    NSLog(@"physicalSubscale %@",newPatientFatigueResultObject.physicalSubscale);
    NSLog(@"psychosocialSubscale %@",newPatientFatigueResultObject.psychosocialSubscale);
    NSLog(@"cognitiveSubscale %@",newPatientFatigueResultObject.cognitiveSubscale);
    NSLog(@"patientId %@",newPatientFatigueResultObject.patientId);
    //NSLog(@"newPatientFatigueResultObject.id %@",newPatientFatigueResultObject.id);
    
//    [newPatientFatigueResultObject  createAsync:^(PatientFatigueResult *obj, NSError * error) {
    
    
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
            [self showMessage:@"Alerts record successfully saved."];
            
            //patient_fatigue_result_id = obj;
            
            //NSLog(@"1. createAsync Success %@ ", obj );
            //                [self dismissViewControllerAnimated:YES completion:nil];
            
            //  Get id of the saved Parent Object -- this is use to populate the children
            [self pushBusyOperation];
            PIKCommon *c = [PIKCommon sharedInstance] ;
            [c printObjectContents:newPatientFatigueResultObject];

            
           patient_fatigue_result_id =  obj;
            //patient_fatigue_result_id =  @67;

            
///////////////////////////////// //////////////////////// //////////////////////// ///////////
//////////////////////////////  PatientFatigueAnswer /////////////////////////////////////
            
            for (int i = 0 ; i<21; i++) {
               
                PatientFatigueAnswer *newPatientFatigueAnswerObject = [PatientFatigueAnswer new];
                newPatientFatigueAnswerObject.answer = [answers objectAtIndex:i];
                newPatientFatigueAnswerObject.question = [question objectAtIndex:i];
                newPatientFatigueAnswerObject.sortId = [NSNumber numberWithInt:i];
                newPatientFatigueAnswerObject.patientFatigueResultId = patient_fatigue_result_id;
                
                NSLog(@"answer %@",newPatientFatigueAnswerObject.answer );
                NSLog(@"question %@",newPatientFatigueAnswerObject.question);
                NSLog(@"sortId %@",newPatientFatigueAnswerObject.sortId);
                NSLog(@"patientFatigueResultId %@",patient_fatigue_result_id);
                
                //  In a loop insert individual children, for 21 row, if there is and error in between populate message to try again and refresh the page.
                //  Gets id of the saved Parent Object -- this is use to populate the children
                [newPatientFatigueAnswerObject  createAsync:^(id obj, NSError * error) {
                    if (error) {
                        [self popBusyOperation];
                        if(ERROR_CODE_401(error)) {
                            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                            [app showSessionTerminatedAlert];
                        }
                        else [self showMessage:@"=New Fatigue record failed to add.="];
                        return;
                    } else {
                        //                [self popBusyOperation];
                        [self showMessage:@"Alerts record successfully saved."];
//                        NSLog(@"createAsync Success %@ ", obj );
//
                        
                        
                        
                        
                        //patient_fatigue_result_id =  @520;
//                        NSLog(@"obj.id %@", obj.id);
                        //                [self dismissViewControllerAnimated:YES completion:nil];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }
                }];
             
            
            } // END of for loop
            
           // [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
    [self popBusyOperation];
    

    
}


-(void) updateData{
    
    /*
     1. Get the ChildObjects
     2. Calc cubsacles
     3. Update Child Objhects
     4 Update ParentObject
     */
    
    [self pushBusyOperation];
//    patientId
    self.modelObject = [FatigueTableDataObjectModel sharedInstance];
    NSArray * answers =[self.modelObject getTableCellResponse];
    NSLog(@"%@", answers);
    self.patientFatigueResultObject.isCompleted = [NSNumber numberWithBool:YES];
    self.patientFatigueResultObject.cognitiveSubscale=[NSNumber numberWithInt:2];
    self.patientFatigueResultObject.physicalSubscale= [NSNumber numberWithInt:3];
    self.patientFatigueResultObject.psychosocialSubscale=[NSNumber numberWithInt:4];
    self.patientFatigueResultObject.completedOn= [NSDate date];
    
    [self.patientFatigueResultObject updateAsync:^(id object, NSError *error) {
        if(error){
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }
            else [self showMessage:@"Fatigue Results record failed to save."];
            //return  ;
        }
        else {
            NSLog(@"Update successful Fatigue Results *********** %@", object);
            //[self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
    for (int i=0; i<21; i++) {
        if (self.tableDataFatigueFromDB.count > 0 ) {
            // getting db answers
            PatientFatigueAnswer * dbPatientFatigueAnswerObject =  [self.tableDataFatigueFromDB objectAtIndex:i];
            dbPatientFatigueAnswerObject.answer = [answers objectAtIndex:i];
            
#warning mark TODO - SUBSCALES/DATES AND OTHER VALUES
        [dbPatientFatigueAnswerObject updateAsync:^(id object, NSError *error) {
            //[self.patientFatigueAnswerObject update:&err];
            
            if(error){
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else {
                    [self popBusyOperation];
                    [self showMessage:@"Fatigue record failed to save."];
                    return  ;
                }
            }
            else {
                NSLog(@"*********** Update successful Answers *********** %@", object);
                //[self.navigationController popViewControllerAnimated:YES];
            }
        }];
    }
    }
    [self popBusyOperation];
}

- (IBAction)saveTapped:(id)sender {
  
    if (IsNew) {
        // Get the modified Data from the cell
        [self getModelData];
        [self insertData];
    }else{
        [self updateData];
    }
    return;
}


-(void)back{
    
    //  if(!self.editMode){
  // [super back];
    //return;
    //   }
    
    
   // if([self saveTapped]) [super back];
   // else return;
}

@end
