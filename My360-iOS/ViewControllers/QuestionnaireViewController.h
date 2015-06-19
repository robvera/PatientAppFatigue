//
//  QuestionnaireViewController.h
//  My360-iOS
//
//  Created by Agustin Echeandia on 1/6/14.
//
//

#import "BaseFormViewController.h"
#import <APSDK/PatientJournal.h>
#import <APSDK/PatientJournalQuestionnaire.h>
#import <APSDK/ApplicationQuestionnaire.h>


@interface QuestionnaireViewController : BaseFormViewController

@property (nonatomic, strong) PatientJournal * patientJournal;
@property (nonatomic, strong) PatientJournalQuestionnaire * patientQuestionnaire;
@property (nonatomic, strong) ApplicationQuestionnaire * applicationQuestionnaire;

@property (strong, nonatomic) NSArray *pickerData;
@property (strong, nonatomic) UIPickerView *responsePicker;

@property (nonatomic, weak) IBOutlet UILabel * questionOneLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionTwoLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionThreeLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionFourLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionFiveLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionSixLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionSevenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionEightLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionNineLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionTenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionElevenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionTwelveLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionThirteenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionFourteenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionFifteenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionSixteenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionSeventeenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionEighteenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionNineteenLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionTwentyLabel;
@property (nonatomic, weak) IBOutlet UILabel * questionTwentyoneLabel;
//newly added -- rvera 5/6/14
@property (weak, nonatomic) IBOutlet UILabel * questionTwentytwoLabel;
@property (weak, nonatomic) IBOutlet UILabel * questionTwentythreeLabel;
@property (weak, nonatomic) IBOutlet UILabel * questionTwentyfourLabel;
@property (weak, nonatomic) IBOutlet UILabel * questionTwentyfiveLabel;



@property (nonatomic, weak) IBOutlet UITextField * questionOneTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwoTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionThreeTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionFourTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionFiveTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionSixTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionSevenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionEightTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionNineTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionElevenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwelveTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionThirteenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionFourteenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionFifteenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionSixteenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionSeventeenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionEighteenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionNineteenTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwentyTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwentyoneTextField;
//newly added -- rvera 5/6/14
@property (nonatomic, weak) IBOutlet UITextField * questionTwentytwoTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwentythreeTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwentyfourTextField;
@property (nonatomic, weak) IBOutlet UITextField * questionTwentyfiveTextField;

@end
















