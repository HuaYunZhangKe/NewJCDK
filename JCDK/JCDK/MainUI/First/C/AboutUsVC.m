//
//  AboutUsVC.m
//  JCDK
//
//  Created by 张科 on 2017/3/4.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "AboutUsVC.h"
#import "NavigationView.h"
@interface AboutUsVC ()

@end

@implementation AboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"关于我们";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [self.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    _contentLabel.text = @"\t圣德彩科技是一款专业提供足球，篮彩赛事预测的APP产品。\n\n\t这里汇集了目前各平台众多知名专家老师、足球评论员、体育栏目解说员及网络足彩界“大咖”，通过长期对行该业的研究，以独特的视角提供更专业更准确的赛事分析及赛果预测。\n\n\t专家根据及时的临场信息，球队实力、赛事排名、指数变化、冷门预防等综合要素分析，为彩民朋友总结提供更及时专业的足球及篮球投注参考。\n\n\t免费注册圣德彩科技，关注专家栏目、大咖栏目，即可在第一时间内收到推荐信息提醒,让你不会错过每一场精彩比赛推荐。";
    
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
