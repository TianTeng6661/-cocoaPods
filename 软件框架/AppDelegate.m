//
//  AppDelegate.m
//  软件框架
//
//  Created by lzsc on 16/6/6.
//  Copyright © 2016年 lzsc. All rights reserved.
//

#import "AppDelegate.h"

#import "BaseNavViewController.h"
#import "BaseBarViewController.h"
#import "GuidepagesViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    NSUserDefaults * useDef=[NSUserDefaults standardUserDefaults];
    //使用NSUserDefaults读取用户数据
    if(![useDef boolForKey:@"notFirst"]){
//如果是第一次进入引导页
        _window.rootViewController=[[GuidepagesViewController alloc]init];

    }else{
//否则直接进入
        BaseBarViewController * tavc=[[BaseBarViewController alloc]init];
        tavc.delegate=self;
        _window.rootViewController=tavc;

    }
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
