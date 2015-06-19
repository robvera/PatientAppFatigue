//
//  EducationalReading$AP$.h
//  AnyPresence SDK
//

#import "APInternalObject.h"
#import "Typedefs.h"

@class Clinician$AP$;

@interface EducationalReading$AP$ : APInternalObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSDate * addedOn;
@property (nonatomic, strong) NSNumber * appId;
@property (nonatomic, strong) NSNumber * clinicianId;
@property (nonatomic, strong) NSNumber * defaultEducation;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSNumber * inactive;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSOrderedSet * patientEducations;
@property (nonatomic, strong) Clinician$AP$ * clinician;

@end
