//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+HM.h"
#import "NSString+size.h"

@implementation MBProgressHUD (HM)

+ (void )showloadHUB {

    [[iKYLoadView shareLoadView] showLoadingViewWithBlur];

    
}

+ (void)hideloadHUB {
    [[iKYLoadView shareLoadView] dismissLoadingViewWithBlur];

}

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.2];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}



+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}
/*
+ (MBProgressHUD *)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    UIView * view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
   // hud.labelText = message;
    view.centerY = Main_Screen_Height/2+100;
    hud.mode = MBProgressHUDModeCustomView;
    UILabel *label = [[UILabel alloc]init];
    hud.customView = label;
    ViewRadius(label, 3);
    label.font = [UIFont systemFontOfSize:17];
    label.text = message;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    CGSize size = [NSString sizeForNoticeTitle:message font:label.font];
    [label  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hud).offset(100);
        make.centerX.equalTo(hud);
        make.width.equalTo([NSNumber numberWithFloat:size.width+20]);
        make.height.equalTo([NSNumber numberWithFloat:size.height+20]);

    }];
    

    
    hud.customView.backgroundColor = [UIColor lightGrayColor];
    hud.color = [UIColor clearColor];
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    // 1秒之后再消失
    [hud hide:YES afterDelay:delay];
    
    return hud;
}
*/

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
