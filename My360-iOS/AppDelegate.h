//
//  AppDelegate.h
//  MSPatient
//
//  Generated by AnyPresence, Inc on 2013-02-26
//  Copyright (c) 2013. All rights reserved.
//sv comment

#import <UIKit/UIKit.h>

#define LAST_REFERENCE_UPDATE @"2012-07-30"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UIWindow * window;
@property (nonatomic, strong) NSData * apnToken;
@property (nonatomic, assign) BOOL sessionOpen;
@property (nonatomic, assign) BOOL needsFowardToTreatmentTaken;

@property (strong, nonatomic) NSArray *scheduleData;
@property (strong, nonatomic) NSArray *treatmentTypeData;
@property (strong, nonatomic) NSArray *treatmentScheduleData;
@property (strong, nonatomic) NSArray *ingestionMethodData;
@property (strong, nonatomic) NSArray *dosageUomData;
@property (strong, nonatomic) NSArray *medicationData;
@property (strong, nonatomic) NSArray *missingTreatmentReasonData;
@property (strong, nonatomic) NSArray *testTypeData;
@property (strong, nonatomic) NSArray *labResultStatusData;
@property (strong, nonatomic) NSArray *moodData;
@property (strong, nonatomic) NSArray *symptomData;
@property (strong, nonatomic) NSArray *abilityData;
@property (strong, nonatomic) NSArray *sideEffectData;

+ (NSString *)interpolateString:(NSString *)string;
+ (NSString *)interpolateString:(NSString *)string objectInstance:(id)instance;
+ (BOOL)hasConnectivity;
+ (void)showNoConnecttivityAlert;
+ (void)subscribeToChannel:(NSString *)channel withToken:(NSData *)token;
- (void)showSessionTerminatedAlert;
- (void)setRootTabBar;
- (void)setRootLoginController;
- (BOOL)finishedLoadingReferenceData;
- (BOOL)finishedLoadingLabReferenceData;
- (BOOL)finishedLoadingJournalReferenceData;
- (BOOL)finishedLoadingExacerbationData;
- (BOOL)finishedLoadingSideEffectData;
- (BOOL)finishedLoadingAllReferenceData;
- (float)referenceLoadingProgress;
- (void)loadAllReferenceData;
- (void)downloadAllReferenceData;
- (BOOL)copyDefaultReferenceData;
- (BOOL)referenceFilesExist;
- (void)checkAndUpdateReferenceData;
@end
