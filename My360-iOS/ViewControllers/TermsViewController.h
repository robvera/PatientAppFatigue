//
//  TermsViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/21/13.
//
//

#import "BaseViewController.h"

@interface TermsViewController : BaseViewController


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextView *textView;


-(IBAction)acceptPressed:(id)sender;
-(IBAction)cancelPressed:(id)sender;

@end
