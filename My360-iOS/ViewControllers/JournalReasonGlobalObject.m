//
//  JournalReasonGlobalObject.m
//  My360-iOS
//
//  Created by Savio Vaz on 4/1/14.
//
//
#import <objc/runtime.h>
#import "JournalReasonGlobalObject.h"
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "UIViewController+UI.h"
#import <APSDK/PatientTreatment.h>
#import <APSDk/TreatmentType.h>
#import <APSDK/AuthManager.h>
#import <APSDK/PatientTreatment+Remote.h>
#import <APSDK/MissingTreatmentReason.h>
#import "LoadingTableViewCell.h"
#import "MBProgressHUD.h"
#import "UIView+APViewExtensions.h"
#import <APSDK/Medication.h>
#import "DatedContentCell.h"
#import "UIColor+APColorExtension.h"
#import <APSDK/APObject+Remote.h>
#import "ChartDateListViewController.h"
#import <APSDK/APObject+RemoteRelationships.h>
#import "PikConstants.h"
#import <APSDK/PatientAdherenceLog+Remote.h>
#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "PikConstants.h"
#import <APSDK/Patient+Remote.h>
#import "UIViewController+UI.h"

@interface JournalReasonGlobalObject (){
    NSArray *takingMedications ;
    NSInteger patientId;
    NSMutableArray * tableData;
}
@end

@implementation JournalReasonGlobalObject
static JournalReasonGlobalObject *sharedInstance = nil;


+ (JournalReasonGlobalObject *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance= [[super allocWithZone:nil] init];
    });
    
    return sharedInstance;
}


- (id)init
{
    self = [super init];
    
    if (self) {
        
        self.adherenceLogsComplete2 = @"NO";
        self.treatmentsComplete2 = @"NO";
        [self.adherenceLogsComplete2 addObserver:self forKeyPath:@"YES" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self.treatmentsComplete2 addObserver:self forKeyPath:@"YES" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
    if ([self.adherenceLogsComplete2  isEqual: @"YES"] && [self.treatmentsComplete2  isEqual: @"YES"] )
    {
        [self combineData];
    }
}

- (NSArray*) getJournalReasons{
    self.treatmentsComplete2 = @"NO";
    self.adherenceLogsComplete2= @"NO";
    [self getTreatmentList ];
    [self getAdherences]; //logs
    takingMedications = nil;  // nothing until postnotifications
    return takingMedications;
}

#pragma mark - Getting the data piecemeal

- (void)getAdherences {
    if ([AppDelegate hasConnectivity])
    {
        //        NSMutableDictionary *attrs = [[NSMutableDictionary alloc]init];
        //        NSNumber *updateDate = [NSNumber numberWithFloat:[self.currentDate timeIntervalSince1970]];
        //        [attrs setObject:updateDate forKey:@"log_on"];
        
        //        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        //        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        [PatientAdherenceLog query:@"my_adherence_logs" params:nil offset:0 limit:kListLength async:^(NSArray * objects, NSError * error) {
            
            if (error) {
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
            } else {
                
                [self extractAdherence:objects];
            }
            
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
}

- (void) printObjectContents:(id) object{
    
    
    unsigned int numberOfProperties = 0;
    objc_property_t *propertyArray = class_copyPropertyList([object class], &numberOfProperties);
    
    for (NSUInteger i = 0; i < numberOfProperties; i++)
    {
        objc_property_t property = propertyArray[i];
        NSString *name = [[NSString alloc] initWithUTF8String:property_getName(property)];
        NSString *attributesString = [[NSString alloc] initWithUTF8String:property_getAttributes(property)];
        NSLog(@"Property %lu:= %@ *** type=:= %@",(unsigned long)i, name, attributesString);
    }
    
}


- (NSDate *) getParsedDate:(NSDate*) theDate2Parse{
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    id t  = [NSTimeZone timeZoneWithAbbreviation:@"UTC"] ;
    formatter.timeZone = t;
    NSString *theCurrentDate = [formatter stringFromDate:theDate2Parse];
    theCurrentDate= [theCurrentDate substringToIndex:10];
    NSDate *theCurrentDateParsed = [formatter dateFromString:theCurrentDate];
    return theCurrentDateParsed;
}


-(NSString *)getUTCFormateDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    return dateString;
}



- (void) extractAdherence:(NSArray*) adherenceObjects{
    
    self.adherence = [[NSMutableArray alloc] init]; // reinitialize
    if(adherenceObjects.count  ){
        //        [self printObjectContents:[adherenceObjects objectAtIndex:0]];
        
//        NSString *theCurrentDateString = [self getUTCFormateDate:self.currentDate];
        NSDate *curDate = [self getParsedDate:self.currentDate];
        
        for (PatientAdherenceLog *object in adherenceObjects) {
            
//            NSString *logOnAdherenceString = [self getUTCFormateDate:object.logOn];
            NSDate *logonDate = [self getParsedDate:object.logOn];
            
            // ONLY BRING IN RELEVANT DATES FROM ADHERENCELOGS
//            if([theCurrentDateString isEqualToString:logOnAdherenceString] ){
              if ([curDate compare:logonDate] == NSOrderedSame) {
                    
                
                NSMutableDictionary *sortedAdherenceLogDict = [NSMutableDictionary new];
                NSString *medication = [NSString new];
                NSDate *logOn = [NSDate new];
                NSNumber *timesMissedPerDay = [NSNumber new];
                NSNumber *tookMedication= [NSNumber new];
                NSNumber*missingTreatmentReasonId= [NSNumber new];
                NSNumber *logId= [NSNumber new];
                
                logOn = object.logOn;
                timesMissedPerDay = object.timesMissedPerDay;
                tookMedication = object.tookMedication;
                missingTreatmentReasonId = object.missingTreatmentReasonId;
                
                // SAFE WAY TO INSURE THAT THIS VALUE BELOW IS NEVER NIL
                if (missingTreatmentReasonId == nil) {
                    missingTreatmentReasonId = [NSNumber numberWithInt:0];
                }
                if (timesMissedPerDay == nil) {
                    timesMissedPerDay = [NSNumber numberWithInt:0];
                }
                
                NSNumber *patientTreatmentId = object.patientTreatmentId;
                //                 NSLog(@" ***** patientTreatmentId = %@", patientTreatmentId);
                
                logId = object.id;
                
                
                if ([object.treatmentTypeDenormalized isEqualToString:@"Medication"]) {
                    medication = object.medicationDenormalized;
                }
                else {
                    medication = object.treatmentTypeDenormalized;
                }
                //            enum recordStatus recordInsertedStatus = recordOLD;
                [sortedAdherenceLogDict  setObject:@"recordOLD" forKey:@"recordStatus"];
                [sortedAdherenceLogDict  setObject:@"" forKey:@"recordCurrentStatus"];
                [sortedAdherenceLogDict  setObject:logId forKey:@"logId"];
                [sortedAdherenceLogDict  setObject:logOn forKey:@"logOn"];
                [sortedAdherenceLogDict setObject:timesMissedPerDay forKey:@"timesMissedPerDay"];
                [sortedAdherenceLogDict setObject:tookMedication forKey:@"tookMedication"];
                [sortedAdherenceLogDict setObject:medication forKey:@"medication"];
                [sortedAdherenceLogDict setObject:missingTreatmentReasonId forKey:@"missingTreatmentReasonId"];
                //            [sortedAdherenceLogDict setObject:missingReasonName forKey:@"missingReasonName"];
                [sortedAdherenceLogDict setObject:patientTreatmentId forKey:@"patientTreatmentId"];
                [self.adherence addObject:sortedAdherenceLogDict];
                //              NSLog(@" Adherence Sorted Dict Logs%@", sortedAdherenceLogDict);
            } // IF STATEMENT ON DATES CAOMPARE
        }  // end for loop
    }
    
    NSLog(@" Adherence extracted array of Dict %@", self.adherence);
    
    self.adherenceLogsComplete2=@"YES";
    [self combineData];
}




- (NSMutableArray *) combineData{
    
    /*
     Loop thru Treatments - outer loop
     Loop thru Adherence Logs - inner loop
     Combine and display
     
     */
    NSMutableDictionary *completedDict = [NSMutableDictionary new];
    NSMutableArray *completedArray = [NSMutableArray new];
    
    //GET INTO THIS IF BOTH EXTRACTIONS ARE COMPLETE, FROM ASCHYNCRONOUS RETRIEVES
    if ([self.adherenceLogsComplete2  isEqual: @"YES"] && [self.treatmentsComplete2  isEqual: @"YES"] )
    {
        if  (self.patientTreatmentsObjects != nil || self.patientTreatmentsObjects.count != 0) {
            for (NSInteger p=0; p< self.patientTreatmentsObjects.count; p++) {
                
                completedDict = [self.patientTreatmentsObjects objectAtIndex:p];
                NSString * medNameApatientTreatments = [completedDict objectForKey:@"medicationFromTreatment"];
                BOOL matchFound = NO;
                if (self.adherence != nil || self.adherence.count != 0) {
                    //Loop thru this object and add
                    for (NSInteger a=0; a< self.adherence.count; a++) {
                        NSMutableDictionary *tempAdherence = [self.adherence objectAtIndex:a];
                        NSString * medNameAdherence = [tempAdherence objectForKey:@"medication"];
                        if ([medNameApatientTreatments isEqualToString:medNameAdherence]) {
                            [completedDict addEntriesFromDictionary:tempAdherence];
                            [completedArray addObject:completedDict];
                            [completedDict setObject:[NSNumber  numberWithInt:1] forKey:@"tookMedication"];
                            matchFound = YES;
                            break;
                        }
                        else{
                            matchFound = NO;
                        }
                        
                    }
                    if (!matchFound) {
                        //No match so then just copy - but set took medication to 0
                        [completedDict setObject:[NSNumber  numberWithInt:0] forKey:@"tookMedication"];
                        [completedArray addObject:completedDict];
                    }
                    
                    // end for loop adherence
                    
                }//end if adherence
                else{
                    // There is no logs
                    [completedArray addObject:completedDict];
                }
                
            } //end for adherence
            
        }
        
        else{
            // There are no TREATMENTS, therefore do a UIAlert
            NSLog(@" THERE ARE NO TREATMENTS - CANNOT CONTINUE");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Treatments  "
                                                            message:@"Please enter some treatments"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            
            
            
        }
        //end if patient
        
    }
    NSLog(@" completedArray =%@ ",completedArray);
    self.completeListOfObjects = [completedArray copy];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RetrieveOfLogsComplete" object:self];
    return completedArray;
}




- (void) extractTreatments:(NSArray*) patientTreatmentObjects{
    self.patientTreatmentsObjects = [NSMutableArray new]; // reset everytime we are here
    
    NSDate *curDate = [self getParsedDate:self.currentDate];
    
    if(patientTreatmentObjects.count  ){
        [self printObjectContents:[patientTreatmentObjects objectAtIndex:0]];
        for (PatientTreatment *object in patientTreatmentObjects) {
            NSOrderedSet *patientAdherenceLogsObject = [[NSOrderedSet alloc] init];
            NSMutableDictionary * sortedpatientTreatmentsDict = [[NSMutableDictionary alloc] init];
            NSNumber *medicationId = [[NSNumber alloc] init];
            NSDate * endOn = [[NSDate alloc] init];
            NSDate * startOn = [[NSDate alloc] init];
            NSNumber * treatmentTypeId =[[NSNumber alloc] init];
            NSString *medName = [[NSString alloc]init];
            
            patientAdherenceLogsObject =  object.patientAdherenceLogs;  // ordered set in PatientTreatment
            endOn = [self getParsedDate:object.endOn];
            startOn = [self getParsedDate:object.startOn];
            
            //if currDate is between startOn and endOn dates, then copy, else pass
            if (([curDate compare:startOn] == NSOrderedSame || [curDate compare:startOn] == NSOrderedDescending    ) &&  ([curDate compare:endOn] == NSOrderedSame || [curDate compare:endOn] ==  NSOrderedAscending )) {
                
                medicationId = object.medicationId;
                treatmentTypeId = object.treatmentTypeId;
                NSNumber *treatmentId = object.id;
                // Collect the treatment like "SMOKING SESSETION and MEDICINE NAME"
                if ([object.treatmentTypeId isEqualToNumber:@1])
                {
                    medName = object.medicationDenormalized;
                }
                else
                {
                    AppDelegate *ad = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    for(TreatmentType *tt in ad.treatmentTypeData){
                        if([treatmentTypeId isEqualToNumber:tt.id]){
                            medName = tt.name;;
                            break;
                        }
                    }
                }
                
                [sortedpatientTreatmentsDict  setObject:object.startOn  forKey:@"startOn"];
                [sortedpatientTreatmentsDict  setObject:object.endOn forKey:@"endOn"];
                [sortedpatientTreatmentsDict  setObject:medName forKey:@"medicationFromTreatment"];
                [sortedpatientTreatmentsDict  setObject:@"recordNEW" forKey:@"recordStatus"];
                [sortedpatientTreatmentsDict  setObject:treatmentId forKey:@"treatmentId"];
                [self.patientTreatmentsObjects addObject:sortedpatientTreatmentsDict];
            }
        }// end compare dates
        
        self.treatmentsComplete2=@"YES";
        NSLog(@" patientTreatments extracted array of Dict %@", self.patientTreatmentsObjects);
        [self combineData];
        
    }
}


- (NSMutableArray *)  getTreatmentList{
    if ([AppDelegate hasConnectivity])
    {
        self.patientTreatmentsObjects = [NSMutableArray new];
        
        [PatientTreatment query:@"my_unarchived_treatments" params:nil async:^(NSArray * objects, NSError * error) {
            if (error) {
                //                    [self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else
                    NSLog(@"ERROR = %@", error);
                //                        [self showMessage:[error localizedDescription] ? : @"Error"];
            }
            else{
                [self.patientTreatmentsObjects  addObjectsFromArray:objects] ;
                [self extractTreatments:(NSArray*) objects];
            }
        }];
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    
    return self.patientTreatmentsObjects;
}



#pragma mark - Set & Get

- (id) getUser{
    return ((User *)[AuthManager defaultManager].currentCredentials).id;
}


- (void)  showMessage:(NSString*)title  message:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}




@end