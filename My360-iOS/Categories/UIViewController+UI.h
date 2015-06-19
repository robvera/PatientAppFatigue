//
//  UIViewController+UI.h
//  AnyPresence
//
//  Created by AnyPresence, Inc. on 12/11/12.
//  Copyright (c) 2012 AnyPresence, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UI)

- (void)pushBusyOperation;
- (void)pushBusyOperationDeterminate;
- (void)setBusyOperationProgress:(float)progress;
- (void)popBusyOperation;
- (void)showMessage:(NSString *)message;

@end
