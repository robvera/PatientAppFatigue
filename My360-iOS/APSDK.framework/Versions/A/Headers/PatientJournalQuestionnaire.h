//
//  PatientJournalQuestionnaire.h
//  AnyPresence SDK
//

/*!
 @header PatientJournalQuestionnaire
 @abstract PatientJournalQuestionnaire class
 */

#import "APObject.h"
#import "Typedefs.h"

@class PatientJournal;

/*!
 @class PatientJournalQuestionnaire
 @abstract Generated model object: PatientJournalQuestionnaire.
 @discussion Use @link //apple_ref/occ/cat/PatientJournalQuestionnaire(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientJournalQuestionnaire/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientJournalQuestionnaire : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientJournalQuestionnaire.
 @result Class representing the data source associated with a PatientJournalQuestionnaire.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var applicationQuestionnaireId
 @abstract Generated model property: application_questionnaire_id.
 */
@property (nonatomic, strong) NSNumber * applicationQuestionnaireId;

/*!
 @var columnEight
 @abstract Generated model property: column_eight.
 */
@property (nonatomic, strong) NSNumber * columnEight;

/*!
 @var columnEighteen
 @abstract Generated model property: column_eighteen.
 */
@property (nonatomic, strong) NSNumber * columnEighteen;

/*!
 @var columnEleven
 @abstract Generated model property: column_eleven.
 */
@property (nonatomic, strong) NSNumber * columnEleven;

/*!
 @var columnFifteen
 @abstract Generated model property: column_fifteen.
 */
@property (nonatomic, strong) NSNumber * columnFifteen;

/*!
 @var columnFive
 @abstract Generated model property: column_five.
 */
@property (nonatomic, strong) NSNumber * columnFive;

/*!
 @var columnFour
 @abstract Generated model property: column_four.
 */
@property (nonatomic, strong) NSNumber * columnFour;

/*!
 @var columnFourteen
 @abstract Generated model property: column_fourteen.
 */
@property (nonatomic, strong) NSNumber * columnFourteen;

/*!
 @var columnNine
 @abstract Generated model property: column_nine.
 */
@property (nonatomic, strong) NSNumber * columnNine;

/*!
 @var columnNineteen
 @abstract Generated model property: column_nineteen.
 */
@property (nonatomic, strong) NSNumber * columnNineteen;

/*!
 @var columnOne
 @abstract Generated model property: column_one.
 */
@property (nonatomic, strong) NSNumber * columnOne;

/*!
 @var columnSeven
 @abstract Generated model property: column_seven.
 */
@property (nonatomic, strong) NSNumber * columnSeven;

/*!
 @var columnSeventeen
 @abstract Generated model property: column_seventeen.
 */
@property (nonatomic, strong) NSNumber * columnSeventeen;

/*!
 @var columnSix
 @abstract Generated model property: column_six.
 */
@property (nonatomic, strong) NSNumber * columnSix;

/*!
 @var columnSixteen
 @abstract Generated model property: column_sixteen.
 */
@property (nonatomic, strong) NSNumber * columnSixteen;

/*!
 @var columnTen
 @abstract Generated model property: column_ten.
 */
@property (nonatomic, strong) NSNumber * columnTen;

/*!
 @var columnThirteen
 @abstract Generated model property: column_thirteen.
 */
@property (nonatomic, strong) NSNumber * columnThirteen;

/*!
 @var columnThree
 @abstract Generated model property: column_three.
 */
@property (nonatomic, strong) NSNumber * columnThree;

/*!
 @var columnTwelve
 @abstract Generated model property: column_twelve.
 */
@property (nonatomic, strong) NSNumber * columnTwelve;

/*!
 @var columnTwenty
 @abstract Generated model property: column_twenty.
 */
@property (nonatomic, strong) NSNumber * columnTwenty;

/*!
 @var columnTwentyfive
 @abstract Generated model property: column_twentyfive.
 */
@property (nonatomic, strong) NSNumber * columnTwentyfive;

/*!
 @var columnTwentyfour
 @abstract Generated model property: column_twentyfour.
 */
@property (nonatomic, strong) NSNumber * columnTwentyfour;

/*!
 @var columnTwentyone
 @abstract Generated model property: column_twentyone.
 */
@property (nonatomic, strong) NSNumber * columnTwentyone;

/*!
 @var columnTwentythree
 @abstract Generated model property: column_twentythree.
 */
@property (nonatomic, strong) NSNumber * columnTwentythree;

/*!
 @var columnTwentytwo
 @abstract Generated model property: column_twentytwo.
 */
@property (nonatomic, strong) NSNumber * columnTwentytwo;

/*!
 @var columnTwo
 @abstract Generated model property: column_two.
 */
@property (nonatomic, strong) NSNumber * columnTwo;

/*!
 @var patientJournalId
 @abstract Generated model property: patient_journal_id.
 */
@property (nonatomic, strong) NSNumber * patientJournalId;

/*!
 @var patientJournal
 @abstract Generated property for belongs-to relationship to patientJournal.
 */
@property (nonatomic, strong) PatientJournal * patientJournal;
@end
