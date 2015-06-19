//
//  PatientEducation$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class EducationalReading$AP$;

@interface PatientEducation$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * archived;
@property (nonatomic, strong) NSString * educationalReadingDenormalized;
@property (nonatomic, strong) NSNumber * educationalReadingId;
@property (nonatomic, strong) NSString * educationalReadingUrl;
@property (nonatomic, strong) NSNumber * favorite;
@property (nonatomic, strong) NSNumber * patientId;
@property (nonatomic, strong) NSNumber * unread;
@property (nonatomic, strong) EducationalReading$AP$ * educationalReading;

@end
