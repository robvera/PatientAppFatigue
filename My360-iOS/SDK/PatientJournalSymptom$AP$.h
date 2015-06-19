//
//  PatientJournalSymptom$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class PatientJournal$AP$;

@class Symptom$AP$;

@interface PatientJournalSymptom$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * patientJournalId;
@property (nonatomic, strong) NSNumber * symptomId;
@property (nonatomic, strong) PatientJournal$AP$ * patientJournal;
@property (nonatomic, strong) Symptom$AP$ * symptom;

@end
