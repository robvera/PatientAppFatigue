//
//  UIViewController+UI.m
//  AnyPresence
//
//  Created by AnyPresence, Inc. on 12/11/12.
//  Copyright (c) 2012 AnyPresence, Inc.. All rights reserved.
//

#import <objc/runtime.h>
#import "MBProgressHUD.h"
#import "UIViewController+UI.h"

@interface UIViewController (Busy_Private)

@property (nonatomic, assign) NSInteger operationCount;
@property (nonatomic, retain) UIView * busyView;

@end

@implementation UIViewController (UI)

- (void)pushBusyOperation {
    assert([self isViewLoaded]);
   // NSLog(@" ## pushBusyOperation");
    if (!self.busyView) {
        MBProgressHUD * hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.dimBackground = YES;
        hud.removeFromSuperViewOnHide = YES;
        self.busyView = hud;
    }
    
    if (++self.operationCount > 0) {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        [self.view addSubview:self.busyView];
        [(MBProgressHUD *)self.busyView show:YES];
    // NSLog(@"## pushBusyOperation = %d", self.operationCount);
    }
}

- (void)pushBusyOperationDeterminate{
    assert([self isViewLoaded]);
    
    if (!self.busyView) {
        MBProgressHUD * hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.mode = MBProgressHUDModeDeterminate;
        hud.progress = 0.0f;
        hud.dimBackground = YES;
        hud.removeFromSuperViewOnHide = YES;
        hud.labelText = @"Installing Data";
        self.busyView = hud;
    }
    
    if (++self.operationCount > 0) {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        [self.view addSubview:self.busyView];
        [(MBProgressHUD *)self.busyView show:YES];
    }
}
- (void)setBusyOperationProgress:(float)progress{
    ((MBProgressHUD *)self.busyView).progress = progress;
}

- (void)popBusyOperation {
    //NSLog(@"** popBusyOperation");
    if (--self.operationCount <= 0) {
        [(MBProgressHUD *)self.busyView hide:YES];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"***popBusyOperation-RV*** = %d", self.operationCount);
    }
}

- (void)showMessage:(NSString *)message {
    
    //added to trap "Forbidden message" - svaz 12/16/14
    if ([message isEqualToString:@"Forbidden"]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Timed out!"
                                                         message:@"You have been logged out due to inactivity. Please go to Settings, logout and then log back in to continue."
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert show];
    }else {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil
                                                         message:message
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert show];
    }
}

@end

@implementation UIViewController (Busy_Private)

static id __operationCountKey;
static id __busyViewKey;

- (void)setOperationCount:(NSInteger)operationCount {
    objc_setAssociatedObject(self, &__operationCountKey, [NSNumber numberWithInt:operationCount], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)operationCount {
    return [objc_getAssociatedObject(self, &__operationCountKey) integerValue];
}

- (void)setBusyView:(UIView *)busyView {
    objc_setAssociatedObject(self, &__busyViewKey, busyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)busyView {
    return (UIView *)objc_getAssociatedObject(self, &__busyViewKey);
}

@end
