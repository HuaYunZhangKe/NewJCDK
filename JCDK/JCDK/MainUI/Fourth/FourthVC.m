//
//  FourthVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FourthVC.h"
#import "NavigationView.h"
#import <WebKit/WebKit.h>
#import "OrderWebViewVC.h"
#import "ZhuaJiaDVC.h"
#import "LoginVC.h"
@interface FourthVC ()<UIWebViewDelegate>
@property (nonatomic, retain)UIWebView *webView;
@end

@implementation FourthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NSDictionary *dictionnary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      @"Mozilla/5.0 (iPhone; U; CPU OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/4.0 Mobile/8C148 Safari/528.16" ,
                                     @"UserAgent" , nil];
         [[NSUserDefaults standardUserDefaults] registerDefaults:dictionnary];
    [self setNavigationBar];
    [self.view addSubview:self.webView];
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
            NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
            NSString *userid = userDic[@"id"];
            if (userid.length == 0)
            {
                LoginVC *vc = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
                [self.navigationController pushViewController:vc
                                                     animated:YES];
                return ;
            }
            OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
            vc.naviTitle = @"专家认证";
            NSString *urlStr = [NSString stringWithFormat:@"%@?g=app&m=rec&a=apply&userid=%@",K_Server_Main_URL,userid];
            vc.urlStr = urlStr;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    };
    UILabel *label = [UILabel new];
    label.text = @"推荐";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20.0];
    [label sizeToFit];
    label.center = CGPointMake(navigationView.centerX, navigationView.headImgView2.centerY);
    label.top = 35;
    [navigationView addSubview:label];
    [self.view addSubview:navigationView];
}
- (UIWebView *)webView
{
    if (!_webView)
    {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64,JCDK_Screen_WIDTH ,JCDK_Screen_HEIGHT - 64 )];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://114.55.227.5//index.php?g=app&m=rec&a=index"]];
        _webView.delegate = self;
        [_webView loadRequest:request];
    }
    return _webView;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *backUrl = request.URL.absoluteString;
    
    NSString *tt = [self URLDecodedString:backUrl];
    if ([tt hasPrefix:@"shouxiner://function/recIndexRecommand?cmdSeq=2&type="])
    {
        NSString *type = [tt stringByReplacingOccurrencesOfString:@"shouxiner://function/recIndexRecommand?cmdSeq=2&type=" withString:@""];
        NSArray *titleArr = @[@"竞彩单关",@"亚盘",@"大小球",@"串关推荐",@"胜负彩",@"蓝彩",@"滚球",@"免费专区"];

        if ([type integerValue]>0 && [type integerValue]<= 6 )
        {
            OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
            vc.naviTitle = titleArr[[type integerValue] - 1];
            vc.urlStr = [NSString stringWithFormat:@"%@/?g=app&m=rec&a=cate&bet=%@",K_Server_Main_URL,type];
            [self.navigationController pushViewController:vc animated:YES];
        }
         if ([type integerValue] == 8)
         {
             OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
             vc.naviTitle = @"免费专区";
             vc.urlStr = [NSString stringWithFormat:@"%@?g=app&m=rec&a=index&type=8",K_Server_Main_URL];
             [self.navigationController pushViewController:vc animated:YES];
         }
    }
       return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    NSLog(@"UserAgent = %@", [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"]);
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
-(NSString *)URLDecodedString:(NSString *)str
{
    //微信url处理
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
