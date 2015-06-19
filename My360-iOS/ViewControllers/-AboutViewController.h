//
//  AboutViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/14/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <APSDK/UserProfile.h>


@interface AboutViewController : BaseViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>{
IBOutlet UILabel *versionView;
}

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel * getVersionView;
@property(weak, nonatomic) IBOutlet UIImage* makeRoundedImage;

- (IBAction)getVersionButton;

@end
