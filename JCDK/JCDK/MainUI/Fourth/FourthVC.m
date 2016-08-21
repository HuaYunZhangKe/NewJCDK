//
//  FourthVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FourthVC.h"
#import "NavigationView.h"

@interface FourthVC ()

@end

@implementation FourthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self setNavigationBar];
}
- (void)setNavigationBar
{
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:2];
    [navigationView setNib2];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    navigationView.buttonBlock2 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边第1个按钮点击
        }
        if (button == 2)
        {
            //推荐赛事按钮点击
        }
        if (button == 3)
        {
            //赛事资讯第按钮点击
        }
        if (button == 4)
        {
            //右边第2个按钮点击
        }
        if (button == 5)
        {
            //右边第1个按钮点击
        }
        
        
    };
    [self.view addSubview:navigationView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
