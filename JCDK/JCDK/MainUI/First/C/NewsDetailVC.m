//
//  NewsDetailVC.m
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "NewsDetailVC.h"
#import "NavigationView.h"
@interface NewsDetailVC ()

@end

@implementation NewsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"消息详情";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [self.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

    self.label1.text = self.news.title;
    self.label2.text = self.news.push_time;
    self.label3.text  = self.news.content;
    // Do any additional setup after loading the view from its nib.
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
