//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

#import "iKYLoadView.h"

@interface MBProgressHUD (HM)


+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;


+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
//+ (MBProgressHUD *)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;


+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

//+ (MBProgressHUD *)showHUB;

+ (void )showloadHUB;

+ (void)hideloadHUB;

@end
