//
//  GuidepagesViewController.m
//  软件框架
//
//  Created by lzsc on 16/6/6.
//  Copyright © 2016年 lzsc. All rights reserved.
//

#import "GuidepagesViewController.h"
#import "MacroHeader.h"
#import "BaseBarViewController.h"
#import "AppDelegate.h"


@interface GuidepagesViewController ()<UIScrollViewDelegate>
{
    // 创建页码控制器
    UIPageControl *pageControl;
    // 判断是否是第一次进入应用
    BOOL flag;
}
@end

@implementation GuidepagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initSubviews];
}

- (void)initSubviews {
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width , Main_Screen_Height)];
    for (int i=0; i<3; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Y%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Main_Screen_Width * i, 0, Main_Screen_Width, Main_Screen_Height)];
        // 在最后一页创建按钮
        if (i == 2) {
            // 必须设置用户交互 否则按键无法操作
            imageView.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(Main_Screen_Width / 3, Main_Screen_Height * 7 / 8, Main_Screen_Width / 3, Main_Screen_Height / 16);
            [button setTitle:@"点击进入" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.layer.borderWidth = 2;
            button.layer.cornerRadius = 5;
            button.clipsToBounds = YES;
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
        imageView.image = image;

        imageView.backgroundColor = RGBACOLOR(( arc4random() % 256  ), ( arc4random() % 256  ), ( arc4random() % 256 ), 1);

        [myScrollView addSubview:imageView];
    }
    myScrollView.bounces = NO;
    myScrollView.pagingEnabled = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.contentSize = CGSizeMake(Main_Screen_Width * 3, Main_Screen_Height);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];

    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(Main_Screen_Width / 3, Main_Screen_Height * 15 / 16, Main_Screen_Width / 3, Main_Screen_Height / 16)];
    // 设置页数
    pageControl.numberOfPages = 3;
    // 设置页码的点的颜色
    pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    // 设置当前页码的点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];

    [self.view addSubview:pageControl];
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算当前在第几页
    pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
}

// 点击按钮保存数据并切换根视图控制器
- (void) go:(UIButton *)sender{
    flag = YES;
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    // 保存用户数据
    [useDef setBool:flag forKey:@"notFirst"];
    [useDef synchronize];
    // 切换根视图控制器

    AppDelegate *ap = (AppDelegate*)[UIApplication sharedApplication].delegate;
    BaseBarViewController* tavc=[[BaseBarViewController alloc]init];
    tavc.delegate = (id)ap;
    ap.window.rootViewController = tavc;
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
