//
//  EditAllergyPageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/12/13.
//
//

#import "BaseFormViewController.h"
#import <APSDK/UserProfile.h>
#import "DCRoundSwitch.h"

@interface EditAllergyPageViewController : BaseFormViewController


@property (nonatomic, strong) UserProfile * userProfile;

@property (strong, nonatomic) IBOutlet DCRoundSwitch *foodAllergySwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *medicationAllergySwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *seasonalAllergySwitch;


- (BOOL)saveTapped;
- (void)back;

@end
