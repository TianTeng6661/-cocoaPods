//
//  LZUseInfo.h
//  Investment
//
//  Created by lzsc on 16/3/30.
//  Copyright © 2016年 zhangteng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Singleton.h"

@interface LZUseInfo : NSObject

singleton_interface(LZUseInfo);



@property(nonatomic,copy)NSString *loginUserName;//登录账号
@property(nonatomic,copy)NSString *loginPhoneNumber;//登录账号

@property(nonatomic,copy)NSString *loginPwd;//登录密码
@property(nonatomic,assign,getter=isLogin)BOOL login;//登录是否成功
/**
 *  是否实名认证
 */
@property(nonatomic,assign,getter=isVerified)BOOL verified;



/**
 数据保存到沙盒，保存运行内存与沙盒的数据同步
 */
-(void)synchronizeToSandBox;

/*
 *程序一启动时从沙盒获取数据
 */
-(void)loadDataFromSandBox;
/***
 *判断是否登录成功,YES是登录成功;
 *
 ***/
+ (BOOL)loginwhetherSuccess;

+ (void)clearUserInfo;

+ (BOOL)loginwheherVerified;


@end
