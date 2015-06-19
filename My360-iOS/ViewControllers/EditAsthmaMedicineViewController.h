//
//  EditAsthmaMedicineViewController.h
//  My360-iOS
//
//  Created by Savio Vaz on 10/27/14.
//
//

#import "BaseViewController.h"

#import <APSDk/PatientAsthma+Remote.h>
#import <APSDk/PatientAsthma.h>
#import <APSDK/PatientAsthmaActionMedication+Remote.h>
#import "NSDate+APDateExtension.h"

@interface EditAsthmaMedicineViewController : BaseViewController <UITextFieldDelegate, UITextFieldDelegate , UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *medicine;
@property (weak, nonatomic) IBOutlet UITextField *dose;
@property (weak, nonatomic) IBOutlet UITextField *frequency;
@property (nonatomic) BOOL editMode;
 @property (nonatomic,strong) NSNumber *myActionPlanID;


@property (nonatomic,strong) NSString *medicationType;
@property (strong, nonatomic) PatientAsthmaActionMedication *currentAsthmaMedicationObject;

- (IBAction)saveAction:(id)sender;

@end
