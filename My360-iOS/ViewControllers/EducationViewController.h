//
//  EducationViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/15/13.
//
//

#import "BaseFormViewController.h"
#import <APSDK/PatientEducation.h>


@interface EducationViewController : UIViewController <UIWebViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) PatientEducation *patientEducation;

@property (strong, nonatomic) NSString *urlString;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
