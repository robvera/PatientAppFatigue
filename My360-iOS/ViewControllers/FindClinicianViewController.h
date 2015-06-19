//
//  FindClinicianViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/18/13.
//
//

#import "BaseViewController.h"
#import <APSDK/Clinician.h>


@interface FindClinicianViewController : BaseViewController

@property (strong, nonatomic) NSArray *currentClinicians;
@property (nonatomic, strong) Clinician *clinician;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UITextField *codeField;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;


-(IBAction)searchPressed:(id)sender;
-(IBAction)savePressed:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)sendRequestEmail:(id)sender;


@end
