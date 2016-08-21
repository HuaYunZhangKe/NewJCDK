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
}
/*
 1.所有在导航视图控制器第一层的视图控制器导航栏都隐藏，不在第一层的视图控制器导航栏不隐藏
 2....
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSArray *viewControllers = [NSArray arrayWithArray:self.navigationController.viewControllers];
    if (viewControllers.count != 0)
    {
            UIViewController *firstVC = [self.navigationController.viewControllers objectAtIndex:0];
        
            if (self == firstVC)
            {
                self.navigationController.navigationBarHidden = YES;
            }
            else
            {
                self.navigationController.navigationBarHidden = NO;
            }
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    
}

/*
 1.设置状态栏的颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
