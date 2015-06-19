//
//  ClinicianSettingCell.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/22/13.
//
//

#import "ClinicianSettingCell.h"
#import "PikConstants.h"
#import "UIColor+APColorExtension.h"
#import <APSDK/PatientClinician+Remote.h>
#import "AuthManager+Rules.h"
#import "UIViewController+UI.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/Clinician+Remote.h>


@implementation ClinicianSettingCell

@synthesize patientClinician;
@synthesize allowAccessButton;



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
    [super setup];

    self.allowAccessButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 5, 66, 84)];

    [self.allowAccessButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.allowAccessButton];
    
}


-(void) configureWith:(PatientClinician *)clinician
{
    self.patientClinician = clinician;
    
    self.contentLabel.text = [NSString stringWithFormat:@"%@ %@", clinician.clinician.firstName, clinician.clinician.lastName];
    
    CGRect viewFrame = self.contentLabel.frame;
    viewFrame.origin.y = 28; //move it down to accomodate the taller cell
    self.contentLabel.frame = viewFrame;
    

    if ([clinician.canClinicianRead boolValue]) {
        
        UIImage *buttonBackgroundImage = [UIImage imageNamed:@"Sync_NoBg.png"];
        [self.allowAccessButton setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];

    }
    else {
        UIImage *buttonBackgroundImage = [UIImage imageNamed:@"No_Sync_NoBG.png"];
        [self.allowAccessButton setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];

    }
}


-(void)buttonPressed
{
    
    BOOL canRead = [self.patientClinician.canClinicianRead boolValue];
    
    if (canRead == NO) {
        //changing to allow access so put up warning
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Selecting yes will give your clinician access to your information. Are you sure you want to do this?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alertView show];
    }
    else {
        [self changeAccess];
    }
    
}

-(void)changeAccess
{
    
    BOOL canRead = [self.patientClinician.canClinicianRead boolValue];
    
    self.patientClinician.canClinicianRead = [NSNumber numberWithBool:!canRead];
    
    __unsafe_unretained ClinicianSettingCell * _self = self;
    
    [self.patientClinician updateAsync:^(id obj, NSError * error) {
        if (error) {
        }
        else {
            
            _self.patientClinician = obj;
            
            if ([_self.patientClinician.canClinicianRead boolValue]) {
                
                UIImage *buttonBackgroundImage = [UIImage imageNamed:@"Sync_NoBg.png"];
                [_self.allowAccessButton setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
                
            }
            else {
                UIImage *buttonBackgroundImage = [UIImage imageNamed:@"No_Sync_NoBG.png"];
                [_self.allowAccessButton setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
                
            }
        }
    }];
}


#pragma mark - AlertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1) {
        //user clicked OK so make the change
        [self changeAccess];
    }
    
}





@end
