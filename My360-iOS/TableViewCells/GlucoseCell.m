//
//  GlucoseCell.m
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/26/13.
//
//

#import "GlucoseCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"


@implementation GlucoseCell

@synthesize dateLabel;
@synthesize timeFrameLabel;
@synthesize glucoseLevelLabel;
@synthesize insulinLabel;
@synthesize carbohydratesLabel;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}


-(void)setup
{
    self.selectionStyle = UITableViewCellSelectionStyleGray;

    self.dateLabel.backgroundColor = [UIColor clearColor];
    self.dateLabel.textColor = [UIColor blackColor];
    [self.dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];

    self.timeFrameLabel.backgroundColor = [UIColor clearColor];
    self.timeFrameLabel.textColor = [UIColor darkBlue];
    [self.timeFrameLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];

    self.glucoseLevelLabel.backgroundColor = [UIColor clearColor];
    self.glucoseLevelLabel.textColor = [UIColor blackColor];
    [self.glucoseLevelLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
    self.insulinLabel.backgroundColor = [UIColor clearColor];
    self.insulinLabel.textColor = [UIColor blackColor];
    [self.insulinLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
    self.carbohydratesLabel.backgroundColor = [UIColor clearColor];
    self.carbohydratesLabel.textColor = [UIColor blackColor];
    [self.carbohydratesLabel setFont:[UIFont fontWithName:@"Helvetica" size:kMediumFontSize]];
    
}

-(void)configureWith:(PatientGlucose *)patientGlucose
{
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [formatter setDateFormat:@"yyyy-MM-dd"];

    NSString *dateString = [formatter stringFromDate:patientGlucose.glucoseOn];
    NSDate *dateFromString = [formatter dateFromString:dateString];

    [formatter setDateFormat:kDateFormat];

    self.dateLabel.text =  [formatter stringFromDate:dateFromString];
    self.timeFrameLabel.text = patientGlucose.timeFrame;
    
    if (patientGlucose.glucoseLevel) {
        self.glucoseLevelLabel.text = [NSString stringWithFormat:@"Glucose: %@", patientGlucose.glucoseLevel];

    }
    else {
        self.glucoseLevelLabel.text = @"Glucose: not set";

    }
    
    if (patientGlucose.insulin) {
        self.insulinLabel.text = [NSString stringWithFormat:@"Insulin: %@ units", patientGlucose.insulin];
        
    }
    else {
        self.insulinLabel.text = @"Insulin: not set";
        
    }
    
    if (patientGlucose.carbohydrates) {
        self.carbohydratesLabel.text = [NSString stringWithFormat:@"Carbs: %@ g", patientGlucose.carbohydrates];
        
    }
    else {
        self.carbohydratesLabel.text = @"Carbs: not set";
        
    }
    
    
}

@end