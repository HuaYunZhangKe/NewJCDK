//
//  THomeVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "THomeVC.h"
#import "NavigationView.h"

@interface THomeVC ()

@end

@implementation THomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self setnavigationBar];
}
- (void)setnavigationBar
{
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:1];
    [navigationView setNib1];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    navigationView.buttonBlock1 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边按钮点击
        }
        if (button == 2)
        {
            //右边第一个按钮点击
        }
        if (button == 3)
        {
            //右边第二个按钮点击
        }
        
    };
    [self.view addSubview:navigationView];
}
- (void)didReceiveMemoryWarning
{
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
