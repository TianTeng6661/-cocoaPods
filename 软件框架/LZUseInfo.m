//
//  LZUseInfo.m
//  Investment
//
//  Created by lzsc on 16/3/30.
//  Copyright © 2016年 zhangteng. All rights reserved.
//

#import "LZUseInfo.h"

//#import "PCCircleViewConst.h"


@implementation LZUseInfo
singleton_implementation(LZUseInfo);


-(void)synchronizeToSandBox{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    /*
    [defaults setObject:self.loginUserName forKey:UserNameKey];
    [defaults setObject:self.loginPhoneNumber forKey:PhoneKey];

    [defaults setObject:self.loginPwd forKey:PwdKey];
    [defaults setBool:self.login forKey:LoginKey];
    [defaults setBool:YES forKey:NoticationKey];  //新登录的用户默认接受通知
    
    [defaults setBool:self.verified forKey:VerifiedKey];
    */
    [defaults synchronize];
}

-(void)loadDataFromSandBox{
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    self.loginPhoneNumber = [defaults objectForKey:PhoneKey];

    self.loginUserName = [defaults objectForKey:UserNameKey];
    self.loginPwd = [defaults objectForKey:PwdKey];
    self.login = [defaults boolForKey:LoginKey];
    self.verified = [defaults boolForKey:VerifiedKey];
    */
}

+ (BOOL)loginwhetherSuccess {
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    return [defaults boolForKey:LoginKey];
  */
    return nil;
}

+ (BOOL)loginwheherVerified {
/*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    return [defaults boolForKey:VerifiedKey];
    */
    return nil;
}


+ (void)clearUserInfo {
    
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:UserNameKey];
    [defaults removeObjectForKey:PwdKey];
    [defaults removeObjectForKey:LoginKey];
    [defaults synchronize];
    
    
    LZUseInfo *user = [[LZUseInfo alloc]init];
    [user loadDataFromSandBox];
    
    
    
   // [PCCircleViewConst RemoveGestureWithKey]; //删除手势
    
    [MBProgressHUD showMessage:@"退出登录成功" afterDelay:1.2];
   */
}





@end
