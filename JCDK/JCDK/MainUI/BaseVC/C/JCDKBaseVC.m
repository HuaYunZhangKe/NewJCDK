//
//  JCDKBaseVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//
#import "UIColor+YYAdd.h"
#import "JCDKBaseVC.h"

@interface JCDKBaseVC ()

@end

@implementation JCDKBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kAppColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
  }
/*
 1.所有在导航视图控制器第一层的视图控制器导航栏都隐藏，不在第一层的视图控制器导航栏不隐藏
 2....
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    NSArray *viewControllers = [NSArray arrayWithArray:self.navigationController.viewControllers];
//    if (viewControllers.count != 0)
//    {
//            UIViewController *firstVC = [self.navigationController.viewControllers objectAtIndex:0];
//        
//            if (self == firstVC)
//            {
//                self.navigationController.navigationBarHidden = YES;
//            }
//            else
//            {
//                self.navigationController.navigationBarHidden = NO;
//            }
//    }
    self.navigationController.navigationBarHidden = YES;

}
- (void)viewDidAppear:(BOOL)animated
{
    
}

/*
 1.设置状态栏的颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
//设置系统导航栏暂时不使用
- (void)setJCDKNavigationBar
{
    [self.navigationItem setHidesBackButton:YES ];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"rerturn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController .navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor =  kAppColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
