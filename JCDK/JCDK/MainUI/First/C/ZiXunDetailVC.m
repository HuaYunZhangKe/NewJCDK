//
//  ZiXunDetailVC.m
//  JCDK
//
//  Created by 张科 on 2016/11/29.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ZiXunDetailVC.h"
#import "NewsDetailModel.h"
#import "UIImageView+WebCache.h"
#import "NavigationView.h"
@interface ZiXunDetailVC ()

@end

@implementation ZiXunDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setnavigationBar];
    [self NewsDetailFromWeb:self.nid];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setnavigationBar
{
    WeakSelf(wc);
    
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:0];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    
    navigationView.titleLabel0.text = @"咨询详情";
    navigationView.titleLabel0.font = [UIFont systemFontOfSize:20.0];
    [navigationView.leftBtn0 setImage:[UIImage imageNamed:@"rerturn"] forState:UIControlStateNormal];
    [navigationView.rightBtn0 setImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
    navigationView.buttonBlock0 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边按钮点击
            [wc.navigationController popViewControllerAnimated:NO];
        }
        if (button == 2)
        {
            //右边按钮点击分享的按钮
        }
    };
    [self.view addSubview:navigationView];
    
}
#pragma mark - web service
- (void)NewsDetailFromWeb:(NSString *)nid
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看
    
    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSString *userid = userDic[@"id"];
    
    NSDictionary *paraDic = @{
                              @"id"   :@([nid integerValue]),
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=index&a=ul_news_content",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:[NSString stringWithFormat:@"news"] forKey:@"type"];
        if ([status integerValue] == 1)
        {
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
        }
        else
        {
            [self showTotast:result[@"error"]];
        }
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];
    
}

- (void)webRequestSuccess:(NSDictionary *)result
{
    NSString *type = result[@"type"];
    NSDictionary *newsDic = [NSDictionary dictionaryWithDictionary:result[@"news"] ];
                             NewsDetailModel *news = [[NewsDetailModel alloc] initWithDictionary:newsDic];
    self.titleLabel.text = [NSString stringWithFormat:@"%@",news.title];
    self.timeLabel.text = [NSString stringWithFormat:@"%@" ,news.pubtime];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:news.img]];
    self.contentLabel.text = [NSString stringWithFormat:@"%@",news.content];
    
}
- (void)showHud:(NSString *)title
{
    [MBUtil showHudView:self.view WithTitle:title];
}
- (void)hiddeHud
{
    [MBUtil hideHud:self.view];
}
- (void)showTotast:(NSString *)title
{
    [MBUtil showTotastView:self.view WithTitle:title];
    
}

@end
