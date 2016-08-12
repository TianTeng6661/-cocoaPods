//
//  BaseNavViewController.m
//  软件框架
//
//  Created by lzsc on 16/6/6.
//  Copyright © 2016年 lzsc. All rights reserved.
//

#import "BaseNavViewController.h"
#import "MacroHeader.h"
#define Main_Height [[UIScreen mainScreen] bounds].size.height
#define Main_Width [[UIScreen mainScreen] bounds].size.width

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

+(void)initialize{

    [self setupTheNav];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = NO;
}
+(void)setupTheNav{

    float Height_667;
    float Width_375;
    //判断该当前的设备，以便做适配用
    if(IS_IPHONE_4){
        Height_667 = Main_Screen_Height/960;
        Width_375 = Main_Screen_Width/640;

    }else if (IS_IPHONE_5){
        Height_667=Main_Screen_Height/1136;
        Width_375=Main_Screen_Width/640;

    }else if (IS_IPHONE_6){

        Height_667=Main_Screen_Height/1334;
        Width_375=Main_Screen_Width/750;

    }
    else if (IS_IPHONE_6P){
        Height_667=Main_Screen_Height/1920;
        Width_375=Main_Screen_Width/1080;

    }



    //设置导航条背景
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置导航栏图片的话
    //    UIImage *image = [UIImage imageNamed:@"topbarbg_ios7"];
    //    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    //设置颜色

    [navBar setBarTintColor:UIColorFromRGB(0x3a6fd7)];

    // 设置全局状态栏样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    /*

     itemAtt[NSFontAttributeName] = [UIFont systemFontOfSize:20*kHCWLScale];
     itemAtt[NSForegroundColorAttributeName] = UIColorFromRGB(0xffffff);
     [self.navigationController.navigationBar setTitleTextAttributes:itemAtt];
     //    View controller-based status bar appearance

     self.navigationController.navigationBar.barTintColor=UIColorFromRGB(0x3970d7);
     // 返回按钮的样式 白色
     [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

     */
    // 设置导航条标题字体样式
    NSMutableDictionary *titleAtt = [NSMutableDictionary dictionary];
    // titleAtt[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    //titleAtt[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    titleAtt[NSFontAttributeName]=[UIFont systemFontOfSize:20*kHCWLScale];

    titleAtt[NSForegroundColorAttributeName] = UIColorFromRGB(0xffffff);
    [navBar setTitleTextAttributes:titleAtt];

    // 返回按钮的样式 白色
    [navBar setTintColor:[UIColor whiteColor]];

    // 设置导航条item的样式 字体颜色 大小
    NSMutableDictionary *itemAtt = [NSMutableDictionary dictionary];

    itemAtt[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15];
    itemAtt[NSForegroundColorAttributeName] = [UIColor whiteColor];
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    [barItem setTitleTextAttributes:itemAtt forState:UIControlStateNormal];

}
#pragma mark------重写系统方法
-(BOOL)shouldAutorotate{

    return [self.visibleViewController shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{

    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}
-(void)popSelf {

    [self popViewControllerAnimated:YES];

}

-(UIBarButtonItem*)createBackButton

{

    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"矢量智能对象"] style:UIBarButtonItemStyleDone target:self action:@selector(popSelf)];

}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.viewControllers.count>=1) {
        //        if ([self viewController:viewController.view]) {
        //            DLog(@"111");
        //            viewController.hidesBottomBarWhenPushed = NO;
        //
        //        }else {
        //            viewController.hidesBottomBarWhenPushed = YES;
        //
        //        }

        viewController.hidesBottomBarWhenPushed = YES;

    }

    [super pushViewController:viewController animated:animated];

    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {

        viewController.navigationItem.leftBarButtonItem =[self createBackButton];

        viewController.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;


    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
