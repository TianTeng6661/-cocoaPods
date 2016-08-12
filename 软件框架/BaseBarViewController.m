//
//  BaseBarViewController.m
//  软件框架
//
//  Created by lzsc on 16/6/6.
//  Copyright © 2016年 lzsc. All rights reserved.
//

#import "BaseBarViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThredViewController.h"
#import "FourthViewController.h"

#import "OtherNavViewController.h"
#import "BaseNavViewController.h"

#import "MacroHeader.h"

@interface BaseBarViewController ()

@property (nonatomic, strong) NSMutableArray * controllers;

@end

@implementation BaseBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _controllers = [[NSMutableArray alloc]init];

     FirstViewController * vc1=[[FirstViewController alloc]init];
     [self addOneChlildVc:vc1 title:@"第一" imageName:@"1" selectedImageName:@"1-1"];


    SecondViewController * vc2=[[SecondViewController alloc]init];
    [self addOneChlildVc:vc2 title:@"第二" imageName:@"2" selectedImageName:@"2-2"];


     ThredViewController * vc3=[[ThredViewController alloc]init];
    [self addOneChlildVc:vc3 title:@"第三" imageName:@"3" selectedImageName:@"3-3"];


     FourthViewController * vc4=[[FourthViewController alloc]init];
    [self addOneChlildVc:vc4 title:@"第四" imageName:@"4" selectedImageName:@"4-4"];

//控制字体未选中时候的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    //0xafaffa
//控制字体选中时候的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    //0x359df5

}

-(void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    //设置标题
    childVc.title=title;
    //设置每一个控制器的背景色
    //childVc.view.backgroundColor=[UIColor yellowColor];
    //设置图标
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    //设置选中的图标
    UIImage * selectedImage=[UIImage imageNamed:selectedImageName];
    //设置不渲染(r如果渲染，则图片选中的颜色为蓝色)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    childVc.tabBarItem.selectedImage = selectedImage;

    //添加为tabbar控制器的子控制器
    BaseNavViewController * nav=[[BaseNavViewController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];

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
