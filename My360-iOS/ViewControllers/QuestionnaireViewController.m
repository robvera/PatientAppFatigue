//
//  QuestionnaireViewController.m
//  My360-iOS
//
//  Created by Agustin Echeandia on 1/6/14.
//
//

#import "QuestionnaireViewController.h"
#import "PikConstants.h"
#import "UIViewController+UI.h"
#import "ConfigurationManager.h"
#import <APSDK/ApplicationQuestionnaire+Remote.h>
#import <APSDK/PatientJournalQuestionnaire+Remote.h>
#import <APSDK/APObject+Remote.h>
#define K_textfieldFontsize 20.0f

@interface QuestionnaireViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    
    NSString *emptyResponse;
    // NSString *emptyResponseValue;
}

@end

@implementation QuestionnaireViewController

float originalFontSize;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    emptyResponse = @"?";
    //emptyResponseValue = @"-1";
    
    [self loadData];
    
    self.somethingChanged = NO;
    
    self.pickerData = @[@"?", @"No", @"Yes"]; //@"N/A"
    
    self.responsePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    self.responsePicker.delegate = self;
    self.responsePicker.dataSource = self;
    self.responsePicker.showsSelectionIndicator = YES;
    
    //this is needed for supers textfield delegate methods.
    
    switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
        case MS:
             self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField ];
            break;
            
        case Diabetes:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField ];
            break;
            
        case COPD:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField, self.questionElevenTextField, self.questionTwelveTextField, self.questionThirteenTextField, self.questionFourteenTextField, self.questionFifteenTextField, self.questionSixteenTextField, self.questionSeventeenTextField, self.questionEighteenTextField, self.questionNineteenTextField, self.questionTwentyTextField, self.questionTwentyoneTextField, self.questionTwentytwoTextField, self.questionTwentythreeTextField, self.questionTwentyfourTextField, self.questionTwentyfiveTextField ];
            break;
            
        case MM:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField, self.questionElevenTextField, self.questionTwelveTextField, self.questionThirteenTextField, self.questionFourteenTextField, self.questionFifteenTextField, self.questionSixteenTextField];
            break;
            
        case RA:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField];
            break;
            
        case HepC:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField];
            break;
        
        case PD:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField];
            break;
       
        case IPF:
             self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField, self.questionElevenTextField, self.questionTwelveTextField, self.questionThirteenTextField, self.questionFourteenTextField, self.questionFifteenTextField];
            break;
        
        case Asthma:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField];
            break;
        
        case AAPA:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField];
            break;
        case BC:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField];
            break;
        case MDD:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField];
            break;
        case MDSAML:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField];
            break;
            
        case NSCLC:
            self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField]; //
            break;
            
        default:
            break;
    }
    
//    if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField,
//                         self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField ];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == MS) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField ];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == COPD) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField, self.questionElevenTextField, self.questionTwelveTextField, self.questionThirteenTextField, self.questionFourteenTextField, self.questionFifteenTextField, self.questionSixteenTextField, self.questionSeventeenTextField, self.questionEighteenTextField, self.questionNineteenTextField, self.questionTwentyTextField, self.questionTwentyoneTextField, self.questionTwentytwoTextField, self.questionTwentythreeTextField, self.questionTwentyfourTextField, self.questionTwentyfiveTextField ];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == MM) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField, self.questionNineTextField, self.questionTenTextField, self.questionElevenTextField, self.questionTwelveTextField, self.questionThirteenTextField, self.questionFourteenTextField, self.questionFifteenTextField, self.questionSixteenTextField];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == RA) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField, self.questionEightTextField];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == HepC) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == PD) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == IPF) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField, self.questionSixTextField, self.questionSevenTextField];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == Asthma) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField];
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//        self.fields = @[ self.questionOneTextField, self.questionTwoTextField, self.questionThreeTextField, self.questionFourTextField, self.questionFiveTextField];
//    }
    
    for (UITextField *textField in self.fields) {
        textField.inputView = self.responsePicker;
        textField.inputAccessoryView = self.inputAccessoryViewToolbar;
        textField.placeholder = @"?";//  kFieldPlaceHolderText;
        textField.adjustsFontSizeToFitWidth = TRUE;
        originalFontSize = textField.font.pointSize;
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Data
- (void)loadData
{
    if ([AppDelegate hasConnectivity]) {
        [self pushBusyOperation];
        
        
        if (self.editMode) {
            
            NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
            [params setObject:self.patientJournal.id forKey:@"patient_journal_id"];
            
            [PatientJournalQuestionnaire query:@"exact_match" params:params offset:NSNotFound limit:NSNotFound async:^(NSArray *objects, NSError *error) {
                
                [self popBusyOperation];
                
                if (error) {
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else {
                        [self showMessage:[error localizedDescription] ? : @"Error"];
                    }
                }
                else {
                    
                    self.patientQuestionnaire = [objects firstObject];
                    
                    if (self.patientQuestionnaire) {
                        
                        NSMutableDictionary *queryparams = [[NSMutableDictionary alloc]init];
                        // [queryparams setObject:self.patientQuestionnaire.applicationQuestionnaireId forKey:@"id"];
                        [queryparams setObject:self.patientQuestionnaire.applicationQuestionnaireId forKey:@"app_id"];
                       
                        NSLog(@"applicationQuestionnaireId.... = %@",self.patientQuestionnaire.applicationQuestionnaireId);
                         NSLog(@"App_id.... = %@",self.patientQuestionnaire.patientJournalId);
                        
                        
                        [ApplicationQuestionnaire query:@"exact_match" params:queryparams async:^(NSArray *objects, NSError *error) {
                            if (error) {
                                if(ERROR_CODE_401(error)) {
                                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                    [app showSessionTerminatedAlert];
                                }
                                else {
                                    [self showMessage:[error localizedDescription] ? : @"Error"];
                                }
                            }
                            else
                                switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
                                    case MS:
                                    case Diabetes:
                                    case COPD:
                                    case MM:
                                    case RA:
                                    case HepC:
                                    case PD:
                                    case IPF:
                                    case Asthma:
                                    case AAPA:
                                    case BC:
                                    case MDD:
                                    case MDSAML:
                                    case NSCLC:
                                        self.applicationQuestionnaire = [objects firstObject];
                                        
                                        self.questionOneLabel.text = self.applicationQuestionnaire.columnOne;
                                        self.questionTwoLabel.text = self.applicationQuestionnaire.columnTwo;
                                        self.questionThreeLabel.text = self.applicationQuestionnaire.columnThree;
                                        self.questionFourLabel.text = self.applicationQuestionnaire.columnFour;
                                        self.questionFiveLabel.text = self.applicationQuestionnaire.columnFive;
                                        self.questionSixLabel.text = self.applicationQuestionnaire.columnSix;
                                        self.questionSevenLabel.text = self.applicationQuestionnaire.columnSeven;
                                        self.questionEightLabel.text = self.applicationQuestionnaire.columnEight;
                                        self.questionNineLabel.text = self.applicationQuestionnaire.columnNine; /* RV added New rows */
                                        self.questionTenLabel.text = self.applicationQuestionnaire.columnTen;
                                        self.questionElevenLabel.text = self.applicationQuestionnaire.columnEleven;
                                        self.questionTwelveLabel.text = self.applicationQuestionnaire.columnTwelve;
                                        self.questionThirteenLabel.text = self.applicationQuestionnaire.columnThirteen;
                                        self.questionFourteenLabel.text = self.applicationQuestionnaire.columnFourteen;
                                        self.questionFifteenLabel.text = self.applicationQuestionnaire.columnFifteen;
                                        self.questionSixteenLabel.text = self.applicationQuestionnaire.columnSixteen;
                                        self.questionSeventeenLabel.text = self.applicationQuestionnaire.columnSeventeen;
                                        self.questionEighteenLabel.text = self.applicationQuestionnaire.columnEighteen;
                                        self.questionNineteenLabel.text = self.applicationQuestionnaire.columnNineteen;
                                        self.questionTwentyLabel.text = self.applicationQuestionnaire.columnTwenty;
                                        self.questionTwentyoneLabel.text = self.applicationQuestionnaire.columnTwentyone;
                                        
                                        self.questionTwentytwoLabel.text = self.applicationQuestionnaire.columnTwentytwo;
                                        self.questionTwentythreeLabel.text = self.applicationQuestionnaire.columnTwentythree;
                                        self.questionTwentyfourLabel.text = self.applicationQuestionnaire.columnTwentyfour;
                                        self.questionTwentyfiveLabel.text = self.applicationQuestionnaire.columnTwentyfive;
                                        
                                        
                                        [self setResponses];
                                        break;
                                        
                                    default:
                                        break;
                                }
                                
//                                if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//                                     || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//                                
//                                self.applicationQuestionnaire = [objects firstObject];
//                                
//                                self.questionOneLabel.text = self.applicationQuestionnaire.columnOne;
//                                self.questionTwoLabel.text = self.applicationQuestionnaire.columnTwo;
//                                self.questionThreeLabel.text = self.applicationQuestionnaire.columnThree;
//                                self.questionFourLabel.text = self.applicationQuestionnaire.columnFour;
//                                self.questionFiveLabel.text = self.applicationQuestionnaire.columnFive;
//                                self.questionSixLabel.text = self.applicationQuestionnaire.columnSix;
//                                self.questionSevenLabel.text = self.applicationQuestionnaire.columnSeven;
//                                self.questionEightLabel.text = self.applicationQuestionnaire.columnEight;
//                                self.questionNineLabel.text = self.applicationQuestionnaire.columnNine; /* RV added New rows */
//                                self.questionTenLabel.text = self.applicationQuestionnaire.columnTen;
//                                self.questionElevenLabel.text = self.applicationQuestionnaire.columnEleven;
//                                self.questionTwelveLabel.text = self.applicationQuestionnaire.columnTwelve;
//                                self.questionThirteenLabel.text = self.applicationQuestionnaire.columnThirteen;
//                                self.questionFourteenLabel.text = self.applicationQuestionnaire.columnFourteen;
//                                self.questionFifteenLabel.text = self.applicationQuestionnaire.columnFifteen;
//                                self.questionSixteenLabel.text = self.applicationQuestionnaire.columnSixteen;
//                                self.questionSeventeenLabel.text = self.applicationQuestionnaire.columnSeventeen;
//                                self.questionEighteenLabel.text = self.applicationQuestionnaire.columnEighteen;
//                                self.questionNineteenLabel.text = self.applicationQuestionnaire.columnNineteen;
//                                self.questionTwentyLabel.text = self.applicationQuestionnaire.columnTwenty;
//                                self.questionTwentyoneLabel.text = self.applicationQuestionnaire.columnTwentyone;
//                                
//                                self.questionTwentytwoLabel.text = self.applicationQuestionnaire.columnTwentytwo;
//                                self.questionTwentythreeLabel.text = self.applicationQuestionnaire.columnTwentythree;
//                                self.questionTwentyfourLabel.text = self.applicationQuestionnaire.columnTwentyfour;
//                                self.questionTwentyfiveLabel.text = self.applicationQuestionnaire.columnTwentyfive;
//
//                                
//                                [self setResponses];
//                            }
                        }];
                    }
                    //  NSLog(@"questionNineLabel..... = %@",self.questionNineLabel);
                    
                    
                    [self popBusyOperation];
                }
            }];
        }
        else if (!self.patientQuestionnaire){ //this is the first time here
            
            self.patientQuestionnaire = [PatientJournalQuestionnaire new];
            
            NSDictionary *params = [NSDictionary dictionary];
            
            [ApplicationQuestionnaire query:@"my_app_questions" params:params async:^(NSArray *objects, NSError *error) {
                if (error) {
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else {
                        [self showMessage:[error localizedDescription] ? : @"Error"];
                    }
                }
                else
                    switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
                        case MS:
                        case Diabetes:
                        case COPD:
                        case MM:
                        case RA:
                        case HepC:
                        case PD:
                        case IPF:
                        case Asthma:
                        case AAPA:
                        case BC:
                        case MDD:
                        case MDSAML:
                        case NSCLC:
                            self.applicationQuestionnaire = [objects firstObject];
                            
                            self.questionOneLabel.text = self.applicationQuestionnaire.columnOne;
                            self.questionTwoLabel.text = self.applicationQuestionnaire.columnTwo;
                            self.questionThreeLabel.text = self.applicationQuestionnaire.columnThree;
                            self.questionFourLabel.text = self.applicationQuestionnaire.columnFour;
                            self.questionFiveLabel.text = self.applicationQuestionnaire.columnFive;
                            self.questionSixLabel.text = self.applicationQuestionnaire.columnSix;
                            self.questionSevenLabel.text = self.applicationQuestionnaire.columnSeven;
                            self.questionEightLabel.text = self.applicationQuestionnaire.columnEight;
                            self.questionNineLabel.text = self.applicationQuestionnaire.columnNine; /* RV added New rows */
                            self.questionTenLabel.text = self.applicationQuestionnaire.columnTen;
                            self.questionElevenLabel.text = self.applicationQuestionnaire.columnEleven;
                            self.questionTwelveLabel.text = self.applicationQuestionnaire.columnTwelve;
                            self.questionThirteenLabel.text = self.applicationQuestionnaire.columnThirteen;
                            self.questionFourteenLabel.text = self.applicationQuestionnaire.columnFourteen;
                            self.questionFifteenLabel.text = self.applicationQuestionnaire.columnFifteen;
                            self.questionSixteenLabel.text = self.applicationQuestionnaire.columnSixteen;
                            self.questionSeventeenLabel.text = self.applicationQuestionnaire.columnSeventeen;
                            self.questionEighteenLabel.text = self.applicationQuestionnaire.columnEighteen;
                            self.questionNineteenLabel.text = self.applicationQuestionnaire.columnNineteen;
                            self.questionTwentyLabel.text = self.applicationQuestionnaire.columnTwenty;
                            self.questionTwentyoneLabel.text = self.applicationQuestionnaire.columnTwentyone;
                            
                            self.questionTwentytwoLabel.text = self.applicationQuestionnaire.columnTwentytwo;
                            self.questionTwentythreeLabel.text = self.applicationQuestionnaire.columnTwentythree;
                            self.questionTwentyfourLabel.text = self.applicationQuestionnaire.columnTwentyfour;
                            self.questionTwentyfiveLabel.text = self.applicationQuestionnaire.columnTwentyfive;
                            
                            
                            self.questionOneTextField.text = @"?";
                            self.questionTwoTextField.text = @"?";
                            self.questionThreeTextField.text = @"?";
                            self.questionFourTextField.text = @"?";
                            self.questionFiveTextField.text = @"?";
                            self.questionSixTextField.text = @"?";
                            self.questionSevenTextField.text = @"?";
                            self.questionEightTextField.text = @"?";
                            self.questionNineTextField.text = @"?";   /* RV added New rows */
                            self.questionTenTextField.text = @"?";
                            self.questionElevenTextField.text = @"?";
                            self.questionTwelveTextField.text = @"?";
                            self.questionThirteenTextField.text = @"?";
                            self.questionFourteenTextField.text = @"?";
                            self.questionFifteenTextField.text = @"?";
                            self.questionSixteenTextField.text = @"?";
                            self.questionSeventeenTextField.text = @"?";
                            self.questionEighteenTextField.text = @"?";
                            self.questionNineteenTextField.text = @"?";
                            self.questionTwentyTextField.text = @"?";
                            self.questionTwentyoneTextField.text = @"?";
                            
                            self.questionTwentytwoTextField.text = @"?";
                            self.questionTwentythreeTextField.text = @"?";
                            self.questionTwentyfourTextField.text = @"?";
                            self.questionTwentyfiveTextField.text = @"?";
                            
                            
                            self.questionOneTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwoTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionThreeTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionFourTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionFiveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionSixTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionSevenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionEightTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionNineTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionElevenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwelveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionThirteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionFourteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionFifteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionSixteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionSeventeenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionEighteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionNineteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwentyTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwentyoneTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            
                            self.questionTwentytwoTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwentythreeTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwentyfourTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            self.questionTwentyfiveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
                            break;
                            
                        default:
                            break;
                    }
//                    if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA)  {
//                    
//                    self.applicationQuestionnaire = [objects firstObject];
//                    
//                    self.questionOneLabel.text = self.applicationQuestionnaire.columnOne;
//                    self.questionTwoLabel.text = self.applicationQuestionnaire.columnTwo;
//                    self.questionThreeLabel.text = self.applicationQuestionnaire.columnThree;
//                    self.questionFourLabel.text = self.applicationQuestionnaire.columnFour;
//                    self.questionFiveLabel.text = self.applicationQuestionnaire.columnFive;
//                    self.questionSixLabel.text = self.applicationQuestionnaire.columnSix;
//                    self.questionSevenLabel.text = self.applicationQuestionnaire.columnSeven;
//                    self.questionEightLabel.text = self.applicationQuestionnaire.columnEight;
//                    self.questionNineLabel.text = self.applicationQuestionnaire.columnNine; /* RV added New rows */
//                    self.questionTenLabel.text = self.applicationQuestionnaire.columnTen;
//                    self.questionElevenLabel.text = self.applicationQuestionnaire.columnEleven;
//                    self.questionTwelveLabel.text = self.applicationQuestionnaire.columnTwelve;
//                    self.questionThirteenLabel.text = self.applicationQuestionnaire.columnThirteen;
//                    self.questionFourteenLabel.text = self.applicationQuestionnaire.columnFourteen;
//                    self.questionFifteenLabel.text = self.applicationQuestionnaire.columnFifteen;
//                    self.questionSixteenLabel.text = self.applicationQuestionnaire.columnSixteen;
//                    self.questionSeventeenLabel.text = self.applicationQuestionnaire.columnSeventeen;
//                    self.questionEighteenLabel.text = self.applicationQuestionnaire.columnEighteen;
//                    self.questionNineteenLabel.text = self.applicationQuestionnaire.columnNineteen;
//                    self.questionTwentyLabel.text = self.applicationQuestionnaire.columnTwenty;
//                    self.questionTwentyoneLabel.text = self.applicationQuestionnaire.columnTwentyone;
//                    
//                    self.questionTwentytwoLabel.text = self.applicationQuestionnaire.columnTwentytwo;
//                    self.questionTwentythreeLabel.text = self.applicationQuestionnaire.columnTwentythree;
//                    self.questionTwentyfourLabel.text = self.applicationQuestionnaire.columnTwentyfour;
//                    self.questionTwentyfiveLabel.text = self.applicationQuestionnaire.columnTwentyfive;
//                    
//                    
//                    self.questionOneTextField.text = @"?";
//                    self.questionTwoTextField.text = @"?";
//                    self.questionThreeTextField.text = @"?";
//                    self.questionFourTextField.text = @"?";
//                    self.questionFiveTextField.text = @"?";
//                    self.questionSixTextField.text = @"?";
//                    self.questionSevenTextField.text = @"?";
//                    self.questionEightTextField.text = @"?";
//                    self.questionNineTextField.text = @"?";   /* RV added New rows */
//                    self.questionTenTextField.text = @"?";
//                    self.questionElevenTextField.text = @"?";
//                    self.questionTwelveTextField.text = @"?";
//                    self.questionThirteenTextField.text = @"?";
//                    self.questionFourteenTextField.text = @"?";
//                    self.questionFifteenTextField.text = @"?";
//                    self.questionSixteenTextField.text = @"?";
//                    self.questionSeventeenTextField.text = @"?";
//                    self.questionEighteenTextField.text = @"?";
//                    self.questionNineteenTextField.text = @"?";
//                    self.questionTwentyTextField.text = @"?";
//                    self.questionTwentyoneTextField.text = @"?";
//                    
//                    self.questionTwentytwoTextField.text = @"?";
//                    self.questionTwentythreeTextField.text = @"?";
//                    self.questionTwentyfourTextField.text = @"?";
//                    self.questionTwentyfiveTextField.text = @"?";
//                    
//                    
//                    self.questionOneTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwoTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionThreeTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionFourTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionFiveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionSixTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionSevenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionEightTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionNineTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionElevenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwelveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionThirteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionFourteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionFifteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionSixteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionSeventeenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionEighteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionNineteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwentyTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwentyoneTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    
//                    self.questionTwentytwoTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwentythreeTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwentyfourTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    self.questionTwentyfiveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
//                    
//                }
                
                [self popBusyOperation];
                
            }];
            
        }
        else { //semi editMode - user tapped questionnaire button a second time before saving the Journal
            
            
            NSDictionary *params = [NSDictionary dictionary];
            
            [ApplicationQuestionnaire query:@"my_app_questions" params:params async:^(NSArray *objects, NSError *error) {
                if (error) {
                    if(ERROR_CODE_401(error)) {
                        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [app showSessionTerminatedAlert];
                    }
                    else {
                        [self showMessage:[error localizedDescription] ? : @"Error"];
                    }
                }
                else
                    switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
                        case MS:
                        case Diabetes:
                        case COPD:
                        case MM:
                        case RA:
                        case HepC:
                        case PD:
                        case IPF:
                        case Asthma:
                        case AAPA:
                        case BC:
                        case MDD:
                        case MDSAML:
                        case NSCLC:
                            self.applicationQuestionnaire = [objects firstObject];
                            
                            self.questionOneLabel.text = self.applicationQuestionnaire.columnOne;
                            self.questionTwoLabel.text = self.applicationQuestionnaire.columnTwo;
                            self.questionThreeLabel.text = self.applicationQuestionnaire.columnThree;
                            self.questionFourLabel.text = self.applicationQuestionnaire.columnFour;
                            self.questionFiveLabel.text = self.applicationQuestionnaire.columnFive;
                            self.questionSixLabel.text = self.applicationQuestionnaire.columnSix;
                            self.questionSevenLabel.text = self.applicationQuestionnaire.columnSeven;
                            self.questionEightLabel.text = self.applicationQuestionnaire.columnEight;
                            self.questionNineLabel.text = self.applicationQuestionnaire.columnNine; /* RV added New rows */
                            self.questionTenLabel.text = self.applicationQuestionnaire.columnTen;
                            self.questionElevenLabel.text = self.applicationQuestionnaire.columnEleven;
                            self.questionTwelveLabel.text = self.applicationQuestionnaire.columnTwelve;
                            self.questionThirteenLabel.text = self.applicationQuestionnaire.columnThirteen;
                            self.questionFourteenLabel.text = self.applicationQuestionnaire.columnFourteen;
                            self.questionFifteenLabel.text = self.applicationQuestionnaire.columnFifteen;
                            self.questionSixteenLabel.text = self.applicationQuestionnaire.columnSixteen;
                            self.questionSeventeenLabel.text = self.applicationQuestionnaire.columnSeventeen;
                            self.questionEighteenLabel.text = self.applicationQuestionnaire.columnEighteen;
                            self.questionNineteenLabel.text = self.applicationQuestionnaire.columnNineteen;
                            self.questionTwentyLabel.text = self.applicationQuestionnaire.columnTwenty;
                            self.questionTwentyoneLabel.text = self.applicationQuestionnaire.columnTwentyone;
                            
                            self.questionTwentytwoLabel.text = self.applicationQuestionnaire.columnTwentytwo;
                            self.questionTwentythreeLabel.text = self.applicationQuestionnaire.columnTwentythree;
                            self.questionTwentyfourLabel.text = self.applicationQuestionnaire.columnTwentyfour;
                            self.questionTwentyfiveLabel.text = self.applicationQuestionnaire.columnTwentyfive;
                            
                            
                            [self setResponses];
                            break;
                            
                        default:
                            break;
                    }
                
//                    if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == MS
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == COPD
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == MM
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == RA
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == HepC
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == PD
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == IPF
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == Asthma
//                         || [[[ConfigurationManager sharedManager] appID] integerValue] == AAPA)  {
//                    
//                    self.applicationQuestionnaire = [objects firstObject];
//                    
//                    self.questionOneLabel.text = self.applicationQuestionnaire.columnOne;
//                    self.questionTwoLabel.text = self.applicationQuestionnaire.columnTwo;
//                    self.questionThreeLabel.text = self.applicationQuestionnaire.columnThree;
//                    self.questionFourLabel.text = self.applicationQuestionnaire.columnFour;
//                    self.questionFiveLabel.text = self.applicationQuestionnaire.columnFive;
//                    self.questionSixLabel.text = self.applicationQuestionnaire.columnSix;
//                    self.questionSevenLabel.text = self.applicationQuestionnaire.columnSeven;
//                    self.questionEightLabel.text = self.applicationQuestionnaire.columnEight;
//                    self.questionNineLabel.text = self.applicationQuestionnaire.columnNine; /* RV added New rows */
//                    self.questionTenLabel.text = self.applicationQuestionnaire.columnTen;
//                    self.questionElevenLabel.text = self.applicationQuestionnaire.columnEleven;
//                    self.questionTwelveLabel.text = self.applicationQuestionnaire.columnTwelve;
//                    self.questionThirteenLabel.text = self.applicationQuestionnaire.columnThirteen;
//                    self.questionFourteenLabel.text = self.applicationQuestionnaire.columnFourteen;
//                    self.questionFifteenLabel.text = self.applicationQuestionnaire.columnFifteen;
//                    self.questionSixteenLabel.text = self.applicationQuestionnaire.columnSixteen;
//                    self.questionSeventeenLabel.text = self.applicationQuestionnaire.columnSeventeen;
//                    self.questionEighteenLabel.text = self.applicationQuestionnaire.columnEighteen;
//                    self.questionNineteenLabel.text = self.applicationQuestionnaire.columnNineteen;
//                    self.questionTwentyLabel.text = self.applicationQuestionnaire.columnTwenty;
//                    self.questionTwentyoneLabel.text = self.applicationQuestionnaire.columnTwentyone;
//                    
//                    self.questionTwentytwoLabel.text = self.applicationQuestionnaire.columnTwentytwo;
//                    self.questionTwentythreeLabel.text = self.applicationQuestionnaire.columnTwentythree;
//                    self.questionTwentyfourLabel.text = self.applicationQuestionnaire.columnTwentyfour;
//                    self.questionTwentyfiveLabel.text = self.applicationQuestionnaire.columnTwentyfive;
//                    
//                    
//                    [self setResponses];
//                    
//                }
                
                [self popBusyOperation];
            }];
        }
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
}



#pragma mark - Actions

-(void)gatherResponses
{
    //set all the data fields to user selections
//    self.patientQuestionnaire.applicationQuestionnaireId = self.applicationQuestionnaire.id;
    self.patientQuestionnaire.applicationQuestionnaireId = self.applicationQuestionnaire.appId;
    
    
    if ([self.questionOneTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnOne = @1;
    }
    else if ([self.questionOneTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnOne = @2;
    }
    else if ([self.questionOneTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnOne = @0;
    }
    else {
        self.patientQuestionnaire.columnOne = @-1;  //?
    }
    
    if ([self.questionTwoTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwo = @1;
    }
    else if ([self.questionTwoTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwo = @2;
    }
    else if ([self.questionTwoTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwo = @0;
    }

    else {
        self.patientQuestionnaire.columnTwo = @-1;
    }
    
    if ([self.questionThreeTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnThree = @1;
    }
    else if ([self.questionThreeTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnThree = @2;
    }
    else if ([self.questionThreeTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnThree = @0;
    }
    else {
        self.patientQuestionnaire.columnThree = @-1;
    }
    
    if ([self.questionFourTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnFour = @1;
    }
    else if ([self.questionFourTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnFour = @2;
    }
    else if ([self.questionFourTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnFour = @0;
    }
    else {
        self.patientQuestionnaire.columnFour = @-1;
    }
    
    if ([self.questionFiveTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnFive = @1;
    }
    else if ([self.questionFiveTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnFive = @2;
    }
    else if ([self.questionFiveTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnFive = @0;
    }
    else {
        self.patientQuestionnaire.columnFive = @-1;
    }
    
    if ([self.questionSixTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnSix = @1;
    }
    else if ([self.questionSixTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnSix = @2;
    }
    else if ([self.questionSixTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnSix = @0;
    }
    else {
        self.patientQuestionnaire.columnSix = @-1;
    }
    
    if ([self.questionSevenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnSeven = @1;
    }
    else if ([self.questionSevenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnSeven = @2;
    }
    else if ([self.questionSevenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnSeven = @0;
    }
    else {
        self.patientQuestionnaire.columnSeven = @-1;
    }
    
    if ([self.questionEightTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnEight = @1;
    }
    else if ([self.questionEightTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnEight = @2;
    }
    else if ([self.questionEightTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnEight = @0;
    }
    else {
        self.patientQuestionnaire.columnEight = @-1;
    }
    
    if ([self.questionNineTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnNine = @1;
    }
    else if ([self.questionNineTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnNine = @2;
    }
    else if ([self.questionNineTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnNine = @0;
    }
    else {
        self.patientQuestionnaire.columnNine = @-1;
    }
    
    if ([self.questionTenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTen = @1;
    }
    else if ([self.questionTenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTen = @2;
    }
    else if ([self.questionTenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTen = @0;
    }
    else {
        self.patientQuestionnaire.columnTen = @-1;
    }
    
    if ([self.questionElevenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnEleven = @1;
    }
    else if ([self.questionElevenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnEleven = @2;
    }
    else if ([self.questionElevenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnEleven = @0;
    }
    else {
        self.patientQuestionnaire.columnEleven = @-1;
    }
    
    if ([self.questionTwelveTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwelve = @1;
    }
    else if ([self.questionTwelveTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwelve = @2;
    }
    else if ([self.questionTwelveTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwelve = @0;
    }
    else {
        self.patientQuestionnaire.columnTwelve = @-1;
    }
    
    if ([self.questionThirteenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnThirteen = @1;
    }
    else if ([self.questionThirteenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnThirteen = @2;
    }
    else if ([self.questionThirteenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnThirteen = @0;
    }
    else {
        self.patientQuestionnaire.columnThirteen = @-1;
    }
    
    if ([self.questionFourteenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnFourteen = @1;
    }
    else if ([self.questionFourteenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnFourteen = @2;
    }
    else if ([self.questionFourteenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnFourteen = @0;
    }
    else {
        self.patientQuestionnaire.columnFourteen = @-1;
    }
    
    if ([self.questionFifteenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnFifteen = @1;
    }
    else if ([self.questionFifteenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnFifteen = @2;
    }
    else if ([self.questionFifteenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnFifteen = @0;
    }
    else {
        self.patientQuestionnaire.columnFifteen = @-1;
    }
    
    if ([self.questionSixteenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnSixteen = @1;
    }
    else if ([self.questionSixteenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnSixteen = @2;
    }
    else if ([self.questionSixteenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnSixteen = @0;
    }
    else {
        self.patientQuestionnaire.columnSixteen = @-1;
    }
    
    if ([self.questionSeventeenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnSeventeen = @1;
    }
    else if ([self.questionSeventeenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnSeventeen = @2;
    }
    else if ([self.questionSeventeenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnSeventeen = @0;
    }
    else {
        self.patientQuestionnaire.columnSeventeen = @-1;
    }
    
    if ([self.questionEighteenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnEighteen = @1;
    }
    else if ([self.questionEighteenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnEighteen = @2;
    }
    else if ([self.questionEighteenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnEighteen = @0;
    }
    else {
        self.patientQuestionnaire.columnEighteen = @-1;
    }
    
    if ([self.questionNineteenTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnNineteen = @1;
    }
    else if ([self.questionNineteenTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnNineteen = @2;
    }
    else if ([self.questionNineteenTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnNineteen = @0;
    }
    else {
        self.patientQuestionnaire.columnNineteen = @-1;
    }
    
    if ([self.questionTwentyTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwenty = @1;
    }
    else if ([self.questionTwentyTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwenty = @2;
    }
    else if ([self.questionTwentyTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwenty = @0;
    }
    else {
        self.patientQuestionnaire.columnTwenty = @-1;
    }
//------------------
    if ([self.questionTwentyoneTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwentyone = @1;
    }
    else if ([self.questionTwentyoneTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwentyone = @2;
    }
    else if ([self.questionTwentyoneTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwentyone = @0;
    }
    else {
        self.patientQuestionnaire.columnTwentyone = @-1;
    }
//------------------
    if ([self.questionTwentytwoTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwentytwo = @1;
    }
    else if ([self.questionTwentytwoTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwentytwo = @2;
    }
    else if ([self.questionTwentytwoTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwentytwo = @0;
    }
    else {
        self.patientQuestionnaire.columnTwentytwo = @-1;
    }
    //------------------
    if ([self.questionTwentythreeTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwentythree = @1;
    }
    else if ([self.questionTwentythreeTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwentythree = @2;
    }
    else if ([self.questionTwentythreeTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwentythree = @0;
    }
    else {
        self.patientQuestionnaire.columnTwentythree = @-1;
    }
    //------------------
    if ([self.questionTwentyfourTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwentyfour = @1;
    }
    else if ([self.questionTwentyfourTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwentyfour = @2;
    }
    else if ([self.questionTwentyfourTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwentyfour = @0;
    }
    else {
        self.patientQuestionnaire.columnTwentyfour = @-1;
    }
    //------------------
    if ([self.questionTwentyfiveTextField.text isEqualToString:@"No"]) {
        self.patientQuestionnaire.columnTwentyfive = @1;
    }
    else if ([self.questionTwentyfiveTextField.text isEqualToString:@"Yes"]) {
        self.patientQuestionnaire.columnTwentyfive = @2;
    }
    else if ([self.questionTwentyfiveTextField.text isEqualToString:@"?"]) {
        self.patientQuestionnaire.columnTwentyfive = @0;
    }
    else {
        self.patientQuestionnaire.columnTwentyfive = @-1;
    }
    //------------------

    
}


-(void)setResponses {
    
    if ([self.patientQuestionnaire.columnOne intValue] == 1) {
        self.questionOneTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnOne intValue] == 2) {
        self.questionOneTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnOne intValue] == 0) {
        self.questionOneTextField.text = @"?";
    }
    else {
        self.questionOneTextField.text = emptyResponse;
        self.questionOneTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnTwo intValue] == 1) {
        self.questionTwoTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwo intValue] == 2) {
        self.questionTwoTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwo intValue] == 0) {
        self.questionTwoTextField.text = @"?";
    }
    else {
        self.questionTwoTextField.text = emptyResponse;
        self.questionTwoTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnThree intValue] == 1) {
        self.questionThreeTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnThree intValue] == 2) {
        self.questionThreeTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnThree intValue] == 0) {
        self.questionThreeTextField.text = @"?";
    }
    else {
        self.questionThreeTextField.text = emptyResponse;
        self.questionThreeTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnFour intValue] == 1) {
        self.questionFourTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnFour intValue] == 2) {
        self.questionFourTextField.text = @"Yes";
    }

    else if ([self.patientQuestionnaire.columnFour intValue] == 0) {
        self.questionFourTextField.text = @"?";
    }
    else {
        self.questionFourTextField.text = emptyResponse;
        self.questionFourTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnFive intValue] == 1) {
        self.questionFiveTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnFive intValue] == 2) {
        self.questionFiveTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnFive intValue] == 0) {
        self.questionFiveTextField.text = @"?";
    }
    else {
        self.questionFiveTextField.text = emptyResponse;
        self.questionFiveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnSix intValue] == 1) {
        self.questionSixTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnSix intValue] == 2) {
        self.questionSixTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnSix intValue] == 0) {
        self.questionSixTextField.text = @"?";
    }
    else {
        self.questionSixTextField.text = emptyResponse;
        self.questionSixTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnSeven intValue] == 1) {
        self.questionSevenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnSeven intValue] == 2) {
        self.questionSevenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnSeven intValue] == 0) {
        self.questionSevenTextField.text = @"?";
    }
    else {
        self.questionSevenTextField.text = emptyResponse;
        self.questionSevenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    
    if ([self.patientQuestionnaire.columnEight intValue] == 1) {
        self.questionEightTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnEight intValue] == 2) {
        self.questionEightTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnEight intValue] == 0) {
        self.questionEightTextField.text = @"?";
    }
    else {
        self.questionEightTextField.text = emptyResponse;
        self.questionEightTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Nine ---
    if ([self.patientQuestionnaire.columnNine intValue] == 1) {
        self.questionNineTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnNine intValue] == 2) {
        self.questionNineTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnNine intValue] == 0) {
        self.questionNineTextField.text = @"?";
    }
    else {
        self.questionNineTextField.text = emptyResponse;
        self.questionNineTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Ten ---
    if ([self.patientQuestionnaire.columnTen intValue] == 1) {
        self.questionTenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTen intValue] == 2) {
        self.questionTenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTen intValue] == 0) {
        self.questionTenTextField.text = @"?";
    }
    else {
        self.questionTenTextField.text = emptyResponse;
        self.questionTenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Eleven ---
    if ([self.patientQuestionnaire.columnEleven intValue] == 1) {
        self.questionElevenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnEleven intValue] == 2) {
        self.questionElevenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnEleven intValue] == 0) {
        self.questionElevenTextField.text = @"?";
    }
    else {
        self.questionElevenTextField.text = emptyResponse;
        self.questionElevenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ twelve ---
    if ([self.patientQuestionnaire.columnTwelve intValue] == 1) {
        self.questionTwelveTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwelve intValue] == 2) {
        self.questionTwelveTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwelve intValue] == 0) {
        self.questionTwelveTextField.text = @"?";
    }
    else {
        self.questionTwelveTextField.text = emptyResponse;
        self.questionTwelveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ thirteen---
    if ([self.patientQuestionnaire.columnThirteen intValue] == 1) {
        self.questionThirteenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnThirteen intValue] == 2) {
        self.questionThirteenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnThirteen intValue] == 0) {
        self.questionThirteenTextField.text = @"?";
    }
    else {
        self.questionThirteenTextField.text = emptyResponse;
        self.questionThirteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ fourteen---
    if ([self.patientQuestionnaire.columnFourteen intValue] == 1) {
        self.questionFourteenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnFourteen intValue] == 2) {
        self.questionFourteenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnFourteen intValue] == 0) {
        self.questionFourteenTextField.text = @"?";
    }
    else {
        self.questionFourteenTextField.text = emptyResponse;
        self.questionFourteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ fifteen---
    if ([self.patientQuestionnaire.columnFifteen intValue] == 1) {
        self.questionFifteenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnFifteen intValue] == 2) {
        self.questionFifteenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnFifteen intValue] == 0) {
        self.questionFifteenTextField.text = @"?";
    }
    else {
        self.questionFifteenTextField.text = emptyResponse;
        self.questionFifteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Sixteen---
    if ([self.patientQuestionnaire.columnSixteen intValue] == 1) {
        self.questionSixteenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnSixteen intValue] == 2) {
        self.questionSixteenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnSixteen intValue] == 0) {
        self.questionSixteenTextField.text = @"?";
    }
    else {
        self.questionSixteenTextField.text = emptyResponse;
        self.questionSixteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Seventeen---
    if ([self.patientQuestionnaire.columnSeventeen intValue] == 1) {
        self.questionSeventeenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnSeventeen intValue] == 2) {
        self.questionSeventeenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnSeventeen intValue] == 0) {
        self.questionSeventeenTextField.text = @"?";
    }
    else {
        self.questionSeventeenTextField.text = emptyResponse;
        self.questionSeventeenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Eighteen---
    if ([self.patientQuestionnaire.columnEighteen intValue] == 1) {
        self.questionEighteenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnEighteen intValue] == 2) {
        self.questionEighteenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnEighteen intValue] == 0) {
        self.questionEighteenTextField.text = @"?";
    }
    else {
        self.questionEighteenTextField.text = emptyResponse;
        self.questionEighteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Nineteen---
    if ([self.patientQuestionnaire.columnNineteen intValue] == 1) {
        self.questionNineteenTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnNineteen intValue] == 2) {
        self.questionNineteenTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnNineteen intValue] == 0) {
        self.questionNineteenTextField.text = @"?";
    }
    else {
        self.questionNineteenTextField.text = emptyResponse;
        self.questionNineteenTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Twenty---
    if ([self.patientQuestionnaire.columnTwenty intValue] == 1) {
        self.questionTwentyTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwenty intValue] == 2) {
        self.questionTwentyTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwenty intValue] == 0) {
        self.questionTwentyTextField.text = @"?";
    }
    else {
        self.questionTwentyTextField.text = emptyResponse;
        self.questionTwentyTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //------ Twentyone---
    if ([self.patientQuestionnaire.columnTwentyone intValue] == 1) {
        self.questionTwentyoneTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwentyone intValue] == 2) {
        self.questionTwentyoneTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwentyone intValue] == 0) {
        self.questionTwentyoneTextField.text = @"?";
    }
    else {
        self.questionTwentyoneTextField.text = emptyResponse;
        self.questionTwentyoneTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
//----------
    if ([self.patientQuestionnaire.columnTwentytwo intValue] == 1) {
        self.questionTwentytwoTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwentytwo intValue] == 2) {
        self.questionTwentytwoTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwentytwo intValue] == 0) {
        self.questionTwentytwoTextField.text = @"?";
    }
    else {
        self.questionTwentytwoTextField.text = emptyResponse;
        self.questionTwentytwoTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //----------
    if ([self.patientQuestionnaire.columnTwentythree intValue] == 1) {
        self.questionTwentythreeTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwentythree intValue] == 2) {
        self.questionTwentythreeTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwentythree intValue] == 0) {
        self.questionTwentythreeTextField.text = @"?";
    }
    else {
        self.questionTwentythreeTextField.text = emptyResponse;
        self.questionTwentythreeTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //----------
    if ([self.patientQuestionnaire.columnTwentyfour intValue] == 1) {
        self.questionTwentyfourTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwentyfour intValue] == 2) {
        self.questionTwentyfourTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwentyfour intValue] == 0) {
        self.questionTwentyfourTextField.text = @"?";
    }
    else {
        self.questionTwentyfourTextField.text = emptyResponse;
        self.questionTwentyfourTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //----------
    if ([self.patientQuestionnaire.columnTwentyfive intValue] == 1) {
        self.questionTwentyfiveTextField.text = @"No";
    }
    else if ([self.patientQuestionnaire.columnTwentyfive intValue] == 2) {
        self.questionTwentyfiveTextField.text = @"Yes";
    }
    else if ([self.patientQuestionnaire.columnTwentyfive intValue] == 0) {
        self.questionTwentyfiveTextField.text = @"?";
    }
    else {
        self.questionTwentyfiveTextField.text = emptyResponse;
        self.questionTwentyfiveTextField.font = [UIFont systemFontOfSize:K_textfieldFontsize];
    }
    //----------


}


-(void) saveTapped
{
    
    if (self.somethingChanged && self.editMode) {
        
        
        [self gatherResponses];
        
        [self pushBusyOperation];
        [self.patientQuestionnaire updateAsync:^(id object, NSError *error) {
          
            
            [self popBusyOperation];
            
            if(error){
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else
                    [self showMessage:@"Questionnaire responses failed to save."];
            }
            else {
                [self.navigationController popViewControllerAnimated:YES];
                
            }
        }];
    }
    else  if (!self.editMode) { //this is a new questionnaire
        
        [self gatherResponses];
        
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: self.patientQuestionnaire, @"questionnaire", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"questionnaireCompleted" object:nil userInfo:userInfo];
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}


//navigation button action
-(void)back{
    
    [self saveTapped];
}


#pragma mark - Textfield Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.somethingChanged = YES;
    
    if (textField.text.length == 0) {
        //set a default value
        textField.text = [self.pickerData objectAtIndex:0];
        [self.responsePicker selectRow:0 inComponent:0 animated:YES];
    }
    else {
        //set picker selection to value in text field
        NSInteger row = [self.pickerData indexOfObject:textField.text];
        if (row >= 1 && row <= 3) {
            [self.responsePicker selectRow:row inComponent:0 animated:YES];
        }
        else{
            [self.responsePicker selectRow:0 inComponent:0 animated:YES];
        }
        
        
    }
    
    return YES;
}


#pragma mark - PickerView delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.pickerData.count;
}


-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.pickerData objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    for (UITextField *textField in self.fields) {
        
        if (textField.isFirstResponder) {
            textField.text = [self.pickerData objectAtIndex:row];
            
            textField.font = [UIFont systemFontOfSize:originalFontSize];
            break;
        }
    }
}


@end




