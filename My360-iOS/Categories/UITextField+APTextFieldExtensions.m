//
//  UITextField+APTextFieldExtensions.m
//  MSPatient
//
//  Created by David Benko on 4/3/13.
//
//

#import "UITextField+APTextFieldExtensions.h"
#import <objc/runtime.h>

static char nextTextFieldHash;
static char previousTextFieldHash;

@implementation UITextField (APTextFieldExtensions)

-(UITextField *) nextTextField {
    return objc_getAssociatedObject(self, &nextTextFieldHash);
}
-(void) setNextTextField:(UITextField *)nextTextField {
    objc_setAssociatedObject(self, &nextTextFieldHash, nextTextField, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *) previousTextField {
    return objc_getAssociatedObject(self, &previousTextFieldHash);
}
-(void) setPreviousTextField:(UITextField *)nextTextField {
    objc_setAssociatedObject(self, &previousTextFieldHash, nextTextField, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
