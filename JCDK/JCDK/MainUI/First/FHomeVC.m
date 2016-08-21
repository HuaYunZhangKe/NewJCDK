//
//  FHomeVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FHomeVC.h"
#import "NavigationView.h"
@interface FHomeVC ()

@end

@implementation FHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self setnavigationBar];
}
- (void)setnavigationBar
{
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:0];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    navigationView.buttonBlock0 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边按钮点击
        }
        if (button == 2)
        {
            //右边按钮点击
        }
    };
    [self.view addSubview:navigationView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
