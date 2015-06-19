//
//  FatigueTableViewCell.h
//  SimpleTable
//
//  Created by Roberto M. Vera on 5/26/15.
//  Copyright (c) 2015 atpointofcare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <APSDK/PatientFatigueAnswer.h>
#import <APSDK/PatientFatigueResult.h>

@interface FatigueTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *qLableCount;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedControlAction:(id)sender;

@property (strong, nonatomic) PatientFatigueAnswer * patientFatigueAnswer;
@property (strong, nonatomic) PatientFatigueResult * patientFatigueResult;



@end
