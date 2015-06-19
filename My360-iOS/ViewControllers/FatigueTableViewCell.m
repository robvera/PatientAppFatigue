//
//  FatigueTableViewCell.m
//  SimpleTable
//
//  Created by Roberto M. Vera on 5/26/15.
//  Copyright (c) 2015 atpointofcare. All rights reserved.
//

#import "FatigueTableViewCell.h"
#import "FatigueTableDataObjectModel.h"
#import "BaseFormViewController.h"

#import "FatigueListViewController.h"
#import <APSDK/PatientFatigueAnswer.h>
#import <APSDK/PatientFatigueAnswer+Remote.h>
#import <APSDK/PatientFatigueResult.h>
#import <APSDK/PatientFatigueResult+Remote.h>
#import "FatigueCell.h"

#import <APSDK/User.h>
#import "AuthManager+Rules.h"
#import "LoadingTableViewCell.h"
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "FatigueCell.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/APObject+RemoteRelationships.h>
#import "PIKCommon.h"
#import "PikConstants.h"


@implementation FatigueTableViewCell

@synthesize qLableCount = _qLableCount;
@synthesize questionLabel = _questionLabel;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize segmentedControl;
@synthesize patientFatigueAnswer;
@synthesize patientFatigueResult;



- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)segmentedControlAction:(id)sender {
    
    //check if its the same control that triggered the change event
    if ([sender isEqual:self.segmentedControl]){
        
        //get index position for the selected control
        NSInteger selectedIndex = [sender selectedSegmentIndex];
        
        //assinged selected index to a ranking
        NSInteger segmentRanking = selectedIndex;
        
        //get the Text for the segmented control that was selected
        NSString *segmentTitle = [sender titleForSegmentAtIndex:selectedIndex];
       
        //get actuall question
        NSString *questionLabel = self.questionLabel.text;
       // NSString *s = self.segmentedControl.tag;
       // NSString *y = [self.segmentedControl titleForSegmentAtIndex:selectedIndex];
        //let log this info to the console
        NSLog(@"Segment at position == '%li' ---", (long)selectedIndex);
        NSLog(@"Segment ranking == '%li' ---", (long)segmentRanking);
        NSLog(@"Segment Title Lable == '%@' ---", segmentTitle);
        NSLog(@"Question Label text =='%@' ---", questionLabel);
        NSLog(@"++++++++++++++++++++++++++++++++++++");
        
        //#1 -get question number minus 1
        
        
        NSInteger rowNumber = self.tag ;
        // so row 5 -1 = 4
        //#2- getSelected Index
        //#3 call setTableResponse from SimpleTableObjectModel
         NSLog(@"FatigueTableViewCell.m: Question # =  %d, (int)selectedIndex = %d",(int)rowNumber, (int)selectedIndex);
        FatigueTableDataObjectModel * dataModel = [FatigueTableDataObjectModel sharedInstance];
        [dataModel setTableResponse: (int)selectedIndex   forQuestionNumber:(int)rowNumber];
       
        
    }

}






@end
