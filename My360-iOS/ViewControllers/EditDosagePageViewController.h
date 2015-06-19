//
//  EditDosagePageViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import "BaseFormViewController.h"
#import <APSDK/DosageUom.h>


@interface EditDosagePageViewController : BaseFormViewController{
}

@property (strong, nonatomic) UIPickerView *dosageUomPicker;

@property (strong, nonatomic) DosageUom *dosageUom;
@property (strong, nonatomic) NSNumber *dosage;

-(void)back;

@end
