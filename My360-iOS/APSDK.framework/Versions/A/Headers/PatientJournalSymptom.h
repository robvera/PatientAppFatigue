//
//  PatientJournalSymptom.h
//  AnyPresence SDK
//

/*!
 @header PatientJournalSymptom
 @abstract PatientJournalSymptom class
 */

#import "APObject.h"
#import "Typedefs.h"

@class PatientJournal;

@class Symptom;

/*!
 @class PatientJournalSymptom
 @abstract Generated model object: PatientJournalSymptom.
 @discussion Use @link //apple_ref/occ/cat/PatientJournalSymptom(Remote) @/link to add CRUD capabilities.
 The @link //apple_ref/occ/instp/PatientJournalSymptom/id @/link field is set as primary key (see @link //apple_ref/occ/cat/APObject(RemoteConfig) @/link) in [self init].
 */
@interface PatientJournalSymptom : APObject {
}

/*!
 @method dataSource
 @abstract Returns the data source class associated with a PatientJournalSymptom.
 @result Class representing the data source associated with a PatientJournalSymptom.
 */
+ (Class)dataSource;

/*!
 @var id
 @abstract Generated model property: id.
 @discussion Primary key. Generated on the server.
 */
@property (nonatomic, strong) NSNumber * id;

/*!
 @var patientJournalId
 @abstract Generated model property: patient_journal_id.
 */
@property (nonatomic, strong) NSNumber * patientJournalId;

/*!
 @var symptomId
 @abstract Generated model property: symptom_id.
 */
@property (nonatomic, strong) NSNumber * symptomId;

/*!
 @var patientJournal
 @abstract Generated property for belongs-to relationship to patientJournal.
 */
@property (nonatomic, strong) PatientJournal * patientJournal;
/*!
 @var symptom
 @abstract Generated property for belongs-to relationship to symptom.
 */
@property (nonatomic, strong) Symptom * symptom;
@end
