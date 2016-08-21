//
//  JCDKTabBarVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKTabBarVC.h"
#import "FHomeVC.h"
#import "SHomeVC.h"
#import "THomeVC.h"
#import "FourthVC.h"
#import "FiveHomeVC.h"
#import "UIImage+Utils.h"
@interface JCDKTabBarVC ()

@end

@implementation JCDKTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -视图配置
- (void)setTabbar
{
 
    NSArray *naviArr = @[self.firstNaviVC, self.secondNaviVC, self.thirdNaviVC, self.fourthNaviVC, self.fivthNaviVC];
    NSArray *itemsNormalPic = @[@"menu_index_an.png", @"menu_befen_an.png", @"menu_ball_an.png", @"menu_tujian_an.png", @"menu_my_an.png"];
    NSArray *itemsSelectedPics = @[@"menu_index_liliang.png", @"menu_befen_liang.png",@"menu_ball_liang.png" , @"menu_tujian_liang.png", @"menu_my_liang.png"];
    NSArray *itemsTitle = @[@"首页",@"比分",@"猜球",@"推荐",@"我的"];
    for(int i = 0;i<naviArr.count;i++)
    {
        UIViewController *controller = naviArr[i];
        UITabBarItem *tabItem = [[UITabBarItem alloc] init];
        tabItem.tag = i;
        CGFloat nwidth = 17;
        CGFloat nheight = 17;
        CGFloat swidth = 24;
        CGFloat sheight = 24;
        if (i == 2)
        {
            nwidth = 16;
            nheight = 16;
            swidth = 22.5;
            sheight = 22.5;

        }
        if (i == 4)
        {
            nwidth = 15;
            nheight = 17;
            swidth = 22;
            sheight = 25;
        }
        UIImage *norPic = [[[UIImage imageNamed:itemsNormalPic[i] ] scaleImageToSize:CGSizeMake(nwidth, nheight) ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [tabItem setImage:norPic];
        UIImage *selectedPic = [[[UIImage imageNamed:itemsSelectedPics[i]] scaleImageToSize:CGSizeMake(swidth, sheight) ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [tabItem setSelectedImage:selectedPic];
        [tabItem setTitle:itemsTitle[i]];
        [tabItem setTitlePositionAdjustment:UIOffsetMake(0, - 3)];
        controller.tabBarItem = tabItem;
    }
    [self setTabTitleAtti];
    [self setTabBarBackGroudColor];
    [self setViewControllers:naviArr animated:NO];

}
- (void)setTabBarBackGroudColor
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 49)];
    backView.backgroundColor = kAppColor;
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
}
- (void)setTabTitleAtti
{
    NSDictionary* titleAttributes = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:10],NSForegroundColorAttributeName : [UIColor whiteColor]};
    NSDictionary* titleAttributesPress = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:10],NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [[UITabBarItem appearance] setTitleTextAttributes:titleAttributes forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:titleAttributesPress forState:UIControlStateSelected];

}
#pragma mark -http请求，以及数据处理

#pragma mark - 懒加载
//第一个navi
- (JCDKBaseNaviVC *)firstNaviVC
{
    if (!_firstNaviVC)
    {
        FHomeVC *vc = [[FHomeVC alloc] initWithNibName:@"FHomeVC" bundle:nil];
        _firstNaviVC = [[JCDKBaseNaviVC alloc] initWithRootViewController:vc];
    }
    return _firstNaviVC;
}
//第二个navi
- (JCDKBaseNaviVC *)secondNaviVC
{
    if (!_secondNaviVC)
    {
        SHomeVC *vc = [[SHomeVC alloc] initWithNibName:@"SHomeVC" bundle:nil];
        _secondNaviVC = [[JCDKBaseNaviVC alloc] initWithRootViewController:vc];
    }
    return _secondNaviVC;

}
//第三个navi

- (JCDKBaseNaviVC *)thirdNaviVC
{
    if (!_thirdNaviVC)
    {
        THomeVC *vc = [[THomeVC alloc] initWithNibName:@"THomeVC" bundle:nil];
        _thirdNaviVC = [[JCDKBaseNaviVC alloc] initWithRootViewController:vc];
    }
    return _thirdNaviVC;

}
//第四个navi
- (UINavigationController *)fourthNaviVC
{
    if (!_fourthNaviVC)
    {
        FourthVC *vc = [[FourthVC alloc] initWithNibName:@"FourthVC" bundle:nil];
        _fourthNaviVC = [[JCDKBaseNaviVC alloc] initWithRootViewController:vc];
    }
    return _fourthNaviVC;
    
}
//第五个navi
- (UINavigationController *)fivthNaviVC
{
    if (!_fivthNaviVC)
    {
        FiveHomeVC *vc = [[FiveHomeVC alloc] initWithNibName:@"FiveHomeVC" bundle:nil];
        _fivthNaviVC = [[JCDKBaseNaviVC alloc] initWithRootViewController:vc];
    }
    return _fivthNaviVC;
    
}














@end
