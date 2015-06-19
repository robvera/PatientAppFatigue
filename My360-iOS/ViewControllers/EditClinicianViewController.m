//
//  EditClinicianViewController.m
//  My360-iOS
//
//  Created by Savio Vaz on 5/12/14.
//
//

#import "EditClinicianViewController.h"
#import "AppDelegate.h"
#import "PikConstants.h"
#import <APSDK/User.h>
#import <APSDK/AuthManager.h>
#import "AuthManager+Rules.h"
#import <APSDK/APObject+Remote.h>
#import <APSDK/PatientClinician.h>
#import "UIView+APViewExtensions.h"
#import "UIViewController+UI.h"
#import "UIColor+APColorExtension.h"
#import <APSDK/Patient+Remote.h>
#import <APSDK/ClinicianCodeRequest+Remote.h>
#import "PIKCommon.h"
#import "UIAlertView+Additions.h"


@interface EditClinicianViewController ()
{
    NSMutableString *__firstName;
    NSMutableString *__lastName;
    NSMutableString *__email;
    NSMutableString *__phone;
    NSMutableString *__fax;
    NSMutableString *__code;
    NSNumber *__patientID;
    Patient *__patient;
    
    NSMutableString *__foundClinicianFirstName;
    NSMutableString *__foundClinicianLastName;
    ClinicianCodeRequest *__clinicanCodeRequest;
    BOOL byPass;
    BOOL __sendEmail2Clinician;
    
    
}

@end

@implementation EditClinicianViewController
//@synthesize firstName,lastName,email,phone,code,patientID;

#pragma mark - VC methods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)close:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) initCheckBox{
    int x = 256;
    int y = 221;
    UIButton *checkbox ;
//            -  Commented  below - MSAA    cleanup svaz 11/27/14
//    BOOL checkBoxSelected;
    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20)];
                // 20x20 is the size of the checckbox that you want
                // create 2 images sizes 20x20 , one empty square and
                // another of the same square with the checkmark in it
                // Create 2 UIImages with these new images, then:
                
                [checkbox setBackgroundImage:[UIImage imageNamed:@"CheckBox_Empty.png"]
                                    forState:UIControlStateNormal];
//                [checkbox setBackgroundImage:[UIImage imageNamed:@"Green_Check_Box.png"]
//                                    forState:UIControlStateSelected];
                [checkbox setBackgroundImage:[UIImage imageNamed:@"Green_Check_Box.png"]
                                    forState:UIControlStateHighlighted];
                checkbox.adjustsImageWhenHighlighted=YES;
     
    
    [checkbox addTarget:self action:@selector(checkThis:) forControlEvents:UIControlEventTouchUpInside];
    
    
                [self.view addSubview:checkbox];
}

- (void)checkThis:(UIButton *) sender{
    
    
    int ui = [sender state];
    
    NSLog(@"Selected checkbox = %d",ui);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self initCheckBox];
    
    
    if (IS_IPAD) {//colorWithRed:64 green:101 blue:149 alpha:1.0
//        self.view.backgroundColor = [UIColor redColor ];
    }
    
    
    self.title=@"Clinician Code Request";
    
    self.firstName.inputAccessoryView = self.inputToolbar;
    self.firstName.returnKeyType = UIReturnKeyNext;
    self.firstName.layer.cornerRadius=8.0f;
    self.firstName.layer.masksToBounds=YES;
    self.firstName.layer.borderColor=[[UIColor redColor]CGColor];
    self.firstName.layer.borderWidth= 2.0f;
    
    self.lastName.inputAccessoryView = self.inputToolbar;
    self.lastName.returnKeyType = UIReturnKeyNext;
    self.lastName.layer.cornerRadius=8.0f;
    self.lastName.layer.masksToBounds=YES;
    self.lastName.layer.borderColor=[[UIColor redColor]CGColor];
    self.lastName.layer.borderWidth= 2.0f;
    
    self.email.inputAccessoryView = self.inputToolbar;
    self.email.returnKeyType = UIReturnKeyNext;
    self.phone.inputAccessoryView = self.inputToolbar;
    self.phone.returnKeyType = UIReturnKeyNext;
    
    self.fax.inputAccessoryView = self.inputToolbar;
    self.fax.returnKeyType = UIReturnKeyNext;
    
    self.codeField.inputAccessoryView = self.inputToolbar;
    self.codeField.returnKeyType = UIReturnKeyNext;
    self.codeField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    self.scrollView.contentSize = CGSizeMake(2000, 2000);
    if (self.dict_UnRegisteredClinician !=nil) {
        // Set up as its setup in previous controller
        NSLog(@"Dict on VC = %@",self.dict_UnRegisteredClinician );
        self.firstName.text = [self.dict_UnRegisteredClinician objectForKey:@"firstName"];
        self.lastName.text = [self.dict_UnRegisteredClinician objectForKey:@"lastName"];
        self.email.text = [self.dict_UnRegisteredClinician objectForKey:@"email"];
        self.phone.text = [self.dict_UnRegisteredClinician objectForKey:@"phone"];
        self.fax.text = [self.dict_UnRegisteredClinician objectForKey:@"fax"];
        self.codeField.text = [self.dict_UnRegisteredClinician objectForKey:@"codeField"];
        self.email.text = [self.dict_UnRegisteredClinician objectForKey:@"emailAddress"];
        
//        NSNumber *isOn  = (self.sendEmail2Clinician.isOn ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0]);
        NSString *isOnSTR = (NSString*) [self.dict_UnRegisteredClinician objectForKey:@"send_email_flag"];
        BOOL isOn;
        if ([isOnSTR isEqualToString:@"1"]) {
              isOn = 1;
        }else{
              isOn = 0;
        }
        [self.sendEmail2Clinician setOn:isOn];
        
    }
    __patient = [Patient new];
    __patient.id =((User *)[AuthManager defaultManager].currentCredentials).id;
    __patientID = ((User *)[AuthManager defaultManager].currentCredentials).id;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if(textField == self.phone )
    {
        textField.text = [[PIKCommon sharedInstance] formatPhone:textField shouldChangeCharactersInRange:range replacementString:string];
        return NO;
    }
    if(textField == self.fax )
    {
        textField.text = [[PIKCommon sharedInstance] formatPhone:textField shouldChangeCharactersInRange:range replacementString:string];
        return NO;
    }
    //    Added to insure all codes are set to UPPERCASE        - svaz 7/7/14
    if(textField == self.codeField )  {
        NSRange lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
        
        if (lowercaseCharRange.location != NSNotFound) {
            textField.text = [textField.text stringByReplacingCharactersInRange:range
                                                                     withString:[string uppercaseString]];
            return NO;
        }
        
    }
    
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.activeField = textField;
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // If this field is the password field, Log in
    // Otherwise follow tab chain
    [self navigateNextTextField];
    
    return NO;
}

- (IBAction)keyboardDonePressed:(id)sender{
    [self.email resignFirstResponder];
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.codeField resignFirstResponder];
    [self.phone resignFirstResponder];
    [self.fax resignFirstResponder];
    [self.sendEmail2Clinician resignFirstResponder];
    
    
}

#pragma mark -- Database methods


//CHECKS IF PATIENT_CLIENT EXISTS FOR A PASSED IN CLINICIAN
- (BOOL) search4PatientClinician:(Clinician *) clinician{
    if (clinician == nil) {
        return NO;
    }
    __block  BOOL patientClinicianFound = NO;
    // there should only be one !! else we have a problem in the Clinician Web Portal
    self.clinician =  clinician;
    
    // First Check to make sure clinician is not already added
    //****************************************************************************
    // *** self.currentClinicians set in SEGUE of ClinicinsListPageViewController.m
    for (PatientClinician *patientClinician in self.currentClinicians) {
        if (patientClinician.id && self.clinician.id && [self.clinician.id isEqualToNumber:patientClinician.clinician.id]) {
            NSString *message  = [NSString stringWithFormat:@"%@ %@ has already been added.\nPlease try another Clinician.",self.clinician.firstName,self.clinician.lastName];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            self.clinician = nil;
            [self popBusyOperation];
            patientClinicianFound=YES;
            
        }
    }
    return patientClinicianFound;
}



// SEARCH FOR CLINICIAN BY COUPON CODE - ENTERED
- (id) search4ClinicianByCode{
    if (![AppDelegate hasConnectivity]) {
        [AppDelegate showNoConnecttivityAlert];
        return nil;
    }
    
    NSDictionary *queryAttributes;
    if (__code.length != 0) {
        queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:__code, @"coupon_code", nil];
    }else{
        // NOTHING TO SEARCH AS NO CODE HAS BEEN ENTERED !!!
        return nil;
    }
    
    __block BOOL clinicianIsFound = NO;
    [self.codeField resignFirstResponder];
    [self pushBusyOperation];
    NSError *error;
    NSArray *objects = [Clinician query:@"exact_match" params:queryAttributes error:&error];
    if (objects.count) {
        // there should only be one !! else we have a problem in the Clinician Web Portal
        self.clinician = (Clinician *)[objects objectAtIndex:0];
        clinicianIsFound =YES;
        [self popBusyOperation];
        __foundClinicianFirstName = [self.clinician.firstName mutableCopy];
        __foundClinicianLastName = [self.clinician.lastName mutableCopy] ;
        NSString *message = [NSString stringWithFormat:@"Is this the right clinician: '%@ %@'.  If not then please check the code carefully. We have a registered Clinician with this code:'%@'", __foundClinicianFirstName, __foundClinicianLastName, self.codeField.text];
        
        if (!self.doesAlertViewExist) {
            [self popBusyOperation];
            [UIAlertView presentWithTitle:@"Found!"
                                  message:message
                                  buttons:@[ @"YES", @"NO" ]
                            buttonHandler:^(NSUInteger index) {
                                // CLINICIAN IS THE CORRECTE ONE SO  - YES pressed
                                if(index == 0){
                                    NSLog(@"YESSTHIS IS THE RIGHT CLINICIAN");
                                    if ([self search4PatientClinician: self.clinician  ]) {
                                        return  ;  // do not create as PatientClinician exists !!
                                    }else{
                                        
                                        [self createPatientClinician];
                                        //                                        if (!byPass) {
                                        [self updateClinicianCodeRequestFinal:__clinicanCodeRequest];
                                        //                                        }else{
                                        [self.navigationController popViewControllerAnimated:YES];
                                        //                                        }
                                    }
                                }
                                else{
                                    // Some code
                                    NSLog(@"NO So warn about CLINICIAN");
                                    
                                }
                                
                            }];
        }
        return self.clinician;
    }
    else {
        self.clinician = nil;
        // ERRORS!!!!!!
        
        if (error != nil) {
            
            
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
                [self popBusyOperation];
                return nil;
            }else{
                
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to search for Clinician provider code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
        }else {
            
            if (!self.doesAlertViewExist) {
                [self popBusyOperation];
                NSString *message = [[NSString alloc] initWithFormat:  @"Unable to locate Clinicians with Code of %@",  __code ];
                
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                //                [self.codeField becomeFirstResponder];
            }
            
            
            [self popBusyOperation];
            return  nil;
        }
        
    }
    
    //  CLINICIAN does not exist
    if (!clinicianIsFound) {
        [self showMessage:@"No Clinician found by the entered code"];
        self.clinician = nil;
        return nil;
    }
    return self.clinician;
}

-(BOOL) doesAlertViewExist {
    for (UIWindow* window in [UIApplication sharedApplication].windows){
        for (UIView *subView in [window subviews]){
            if ([subView isKindOfClass:[UIAlertView class]]) {
                NSLog(@"has AlertView");
                return YES;
            }else {
                NSLog(@"No AlertView");
                return NO;
            }
        }
    }
    return NO;
}

- (BOOL)createPatientClinician
{
    // WE REC'D THE CODE FROM THE PHYSICIAN SO NOW IT SHOULD BE MOVED TO THE
    // CLINICIAN & PATIENTS_CLINICIANS TABLES
    
    NSString *codeString = __code;
    if (codeString.length == 0) {
        return NO;
    }
    
    [self.codeField resignFirstResponder];
    __block BOOL isSuccessful = NO;
    if ([AppDelegate hasConnectivity]) {
        
        NSError *error = nil;
        PatientClinician *newPatientClinician = [PatientClinician new];
        newPatientClinician.patient = __patient;
        newPatientClinician.clinician = self.clinician;
        newPatientClinician.clinicianId = self.clinician.id;
        newPatientClinician.patientId = __patientID;
        
        [newPatientClinician create:&error];
        
        if (error != nil) {
            
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }else{
                NSLog(@"Unable to add care ClinicianID %@", self.clinician.id);
                NSLog(@"Unable to add care __patientID %@", __patientID);
                NSLog(@"Unable to add care Clinician provider. Error - %@", error);
                
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to add Clinician. Please check the code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
        }
        else {
            
            // Update , cause now its entered and Patient should not see this
            NSLog(@"newPatientClinician CREATED Successfully.");
            isSuccessful=YES;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        [AppDelegate showNoConnecttivityAlert];
    }
    
    return isSuccessful;
}



- (BOOL) createClinicianCodeRequest{
    
    if (__code.length !=0) {
        if ([self search4ClinicianByCode] == nil) {
            
            return NO;
        }
    }
    
    __block BOOL isCreated = NO;
    ClinicianCodeRequest *clinician_code_request = [ClinicianCodeRequest new];
    clinician_code_request.dateRequested = [NSDate date];
    
    clinician_code_request.patientId = __patientID;
    clinician_code_request.patient = __patient;
    if (__code.length !=0) {
        // NEW
        clinician_code_request.statusFlag = @"M";
        // Trying to enter a code?
        
    }else{
        // add to PATIENTCLINICIAN table
        clinician_code_request.statusFlag = @"N";
    }
    
    clinician_code_request.firstName = __firstName;
    clinician_code_request.lastName = __lastName;
    
    
    clinician_code_request.emailAddress = (__email.length !=0) ?  __email :  @"" ; //__email  ;//self.email.text;
    clinician_code_request.phone = (__phone.length !=0) ?  __phone :  @"" ;
    clinician_code_request.fax = (__fax.length !=0) ?  __fax :  @"" ;
    
    
    // Added - svaz 10/24/14  Email switch
    if (__sendEmail2Clinician == YES) {
        clinician_code_request.sendEmailFlag = [NSNumber numberWithInt:1];
    }else{
        clinician_code_request.sendEmailFlag = [NSNumber numberWithInt:0];
    }
    // end added
    
    
    // THIS WILL SEND EMAIL OUT TO CLINICIAN !!!          - svaz 5/12/14
    // UPON create, email goes to clinician_requests@atpointofcare.com  in STAGE/PROD only!!!
    // check settings table for mail
    [clinician_code_request createAsync:^(id object, NSError *error) {
        [self popBusyOperation];
        if (error ) {
            NSLog(@"Error - %@", error);
            [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to add Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            isCreated = NO;
        }
        else {
            NSLog(@"Care Provider CREATED Successfully = %@ -id= ", object  );
            __clinicanCodeRequest = object;
            isCreated =  YES;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
    return isCreated ;
    
}

- (void) updateClinicianCodeRequestFinal:(ClinicianCodeRequest *)c  {
    if (__code.length !=0) {
        // Create Clinical
        c.statusFlag = @"M"; // Moved to Clinicans object/table
    }
    NSError *e;
    BOOL isSaved =[c update:&e];
    
    if (isSaved) {
        NSLog(@"Care Provider UPDATED Successfully updateClinicianCodeRequestFinal. %@", c);
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        if (e ) {
            
            if(ERROR_CODE_401(e)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }else{
                NSLog(@"updateClinicianRequest Error - %@", e);
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to Request care provider code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
            
        }
        
    }
}


- (BOOL) updateClinicianCodeRequest:(ClinicianCodeRequest *)c  {
    
    
    
    __block BOOL saved=NO;
    c.dateRequested = [NSDate date];
    c.emailAddress = (__email.length !=0) ?  __email :  @"" ;
    c.patientId = __patientID;
    c.firstName = __firstName;
    c.lastName = __lastName;
    c.phone = (__phone.length !=0) ?  __phone :  @"" ;
    c.fax = (__fax.length !=0) ?  __fax :  @"" ;
    c.patient = __patient;
    
    //added svaz 10/24/14
    if (__sendEmail2Clinician == YES) {
        c.sendEmailFlag = [NSNumber numberWithInt:1];
    }else{
        c.sendEmailFlag = [NSNumber numberWithInt:0];
    }

    
    NSLog(@"self.lastName.text = %@", __lastName);
    if (self.dict_UnRegisteredClinician !=nil){
        c.id = [self.dict_UnRegisteredClinician objectForKey:@"id"];
    }
    
    
    
    
    [c updateAsync:^(id object, NSError *error) {
        [self popBusyOperation];
        if (error ) {
            
            if(ERROR_CODE_401(error)) {
                AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [app showSessionTerminatedAlert];
            }else{
                NSLog(@"updateClinicianRequest Error - %@", error);
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to Request care provider code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            }
            saved = NO;
        }
        else {
            
            NSLog(@"Care Provider UPDATED Successfully. %@", object);
            [self popBusyOperation];
            [self.navigationController popViewControllerAnimated:YES];
            saved = YES;
        }
    }];
    return saved;
}


- (BOOL) validate{
    BOOL isSuccess = YES;
    
    if (__code.length!=0) {
        isSuccess = YES;
        return isSuccess;
    }
    
    if (__firstName.length==0) {
        isSuccess = NO;
        [self.firstName becomeFirstResponder];
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter the First Name of the Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return isSuccess;
    }
    if (__lastName.length==0) {
        isSuccess = NO;
        [self.lastName becomeFirstResponder];
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter the Last Name of the Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return isSuccess;
    }
    
    
    
    // New functionality - user can enter phone OR fax OR email or code
    
    if (    (__email.length!=0) || (__phone.length!=0) || (__fax.length!=0) ){
        
        
        if     (__email.length!=0) {
            NSLog(@"__email fields set");
            if (![[PIKCommon sharedInstance] validateEmail:__email]) {
                isSuccess = NO;
                [self.email becomeFirstResponder];
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please check email for the Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                return isSuccess;
            }
            
        }
        
        
        
        if     (__phone.length!=0) {
            NSLog(@"__phone fields set");
            if (![[PIKCommon sharedInstance] validatePhone:__phone]) {
                isSuccess = NO;
                [self.phone becomeFirstResponder];
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter a valid phone number for  the Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                return isSuccess;
            }
            
        }
        
        
        
        if     (__fax.length!=0) {
            NSLog(@"__fax fields set");
            if (![[PIKCommon sharedInstance] validatePhone:__fax]) {
                isSuccess = NO;
                [self.phone becomeFirstResponder];
                [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter a valid fax number for  the Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                return isSuccess;
            }
            
        }
        
    }else{
        
        [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter a valid email or phone or fax number for  the Clinician." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return NO;
    }
    
    return isSuccess;
}

- (IBAction)savedTapped {
    
    // Send email out if no code, everytime.
    // Create Clinician if code exists and this is not a dup in CLinicians
    byPass = NO;
    NSLog(@"Saved Clinician - send email object out by email");
    [self resignFirstResponder];
    
    if ([AppDelegate hasConnectivity]) {
        [self pushBusyOperation];
        
        // 1. GET FORM FIELDS
        __firstName = [[self.firstName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
        __lastName = [[self.lastName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
        __email = [[self.email.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
        __phone = [[self.phone.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
        __fax = [[self.fax.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
        __code = [[self.codeField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
        
 
              //added svaz 10/24/14
        BOOL isOn = self.sendEmail2Clinician.isOn;
 
        if (isOn) {
            __sendEmail2Clinician = YES;//[NSNumber numberWithInt:1];
        }else{
            __sendEmail2Clinician= NO;//[NSNumber numberWithInt:0];
        }

        
        
        
        __foundClinicianFirstName = nil;
        __foundClinicianLastName = nil;
        if (![self validate]) {
            [self popBusyOperation];
            return;
        }
        //       *****************************************************************************
        //       **** I M P O R T A  N T ********
        //       ****   BYPASS - IF CODE IS ENTERED JUST CREATE THE PATIENTCLINICIAN OBJECT
        //       *****************************************************************************
        if ((__firstName.length || __lastName.length || __email.length || __phone.length || __fax.length) && (!__code.length)) {
            byPass = NO;
            
        }else if (__code.length !=0) {
            byPass = YES;
            
        }
        
        __clinicanCodeRequest = nil;
        NSDictionary *queryAttributes = [NSDictionary dictionaryWithObjectsAndKeys:__patientID , @"patient_id",__firstName, @"first_name",__lastName , @"last_name",nil];
        
        // FIND THE ClinicianCodeRequest, if exists BY EMAIL
        [ClinicianCodeRequest query:@"exact_match" params:queryAttributes async:^(NSArray * objects, NSError *error){
            BOOL isFound = NO;
            if ( error == nil) {
                for (ClinicianCodeRequest *c in objects) {
                    NSLog(@"c.firstName = %@, %@, %@", c.firstName, c.lastName, c.emailAddress );
                    
                    if ([c.patientId isEqualToNumber:__patientID] && ([c.lastName isEqualToString:__lastName] && [c.firstName isEqualToString:__firstName] )){
                        // FOUND so UPDATE
                        isFound = YES;
                        __clinicanCodeRequest = c;
                        
                        if (__code.length !=0) {
                            if ([self search4ClinicianByCode] == nil) {
                                //                                [self showMessage:@"No Clinician found by the entered code"];
                                break;
                            }
                        }else{
                            
                            [self updateClinicianCodeRequest:c  ];
                            __clinicanCodeRequest = c;
                            break;
                        }
                    }
                }
                if (!isFound) {
                    // CREATE NEW ENTRY
                    [self createClinicianCodeRequest];
                }
            } else if (error ) {
                
                if(ERROR_CODE_401(error)) {
                    [self popBusyOperation];
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }else{
                    [self popBusyOperation];
                    
                    NSLog(@"Find ClinicianRequest Error - %@", error);
                    [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Unable to Find Clinician Code." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                }
            }
            
        }];
    }
    //    [self popBusyOperation];
}
///#### ADDED TO TEST EMAIL


-(IBAction)sendRequestEmail:(id)sender{
// Change Functionality          - svaz 5/12/14
    UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"Enter care provider email address" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Send", nil];
    [dialog setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[dialog textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeEmailAddress];
    [dialog show];

//    EditClinicianViewController *controller = [[EditClinicianViewController alloc] init];


//    (EditClinicianViewController *)[segue destinationViewController];
//    controller.currentClinicians = [NSArray arrayWithArray:currentClinicians];

//    [self presentViewController:controller animated:YES completion:nil];
//           EditClinicianViewController *controller = (FindClinicianViewController *)[segue destinationViewController];

    
    
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        ClinicianCodeRequest *ccr  = [ClinicianCodeRequest new];
        
        ccr.dateRequested = [NSDate date];
        ccr.emailAddress = [alertView textFieldAtIndex:0].text;
        Patient *me = [Patient new];
        me.id = ((User *)[AuthManager defaultManager].currentCredentials).id;
        ccr.patient = me;
        
        [self pushBusyOperation];
//        __block FindClinicianViewController * _self = self;
        
        [ccr createAsync:^(id obj, NSError * error) {
            if (error) {
                [self popBusyOperation];
                if(ERROR_CODE_401(error)) {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [app showSessionTerminatedAlert];
                }
                else [self showMessage:@"Care Provider Code Request record failed to add."];
            } else {
                [self popBusyOperation];
                
                //[_self showMessage:@"Journal record successfully added."];
                //[_self.navigationController popViewControllerAnimated:YES];
                //[_self dismissModalViewControllerAnimated:YES];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
    }
}


@end
