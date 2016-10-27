//
//  OrderWebViewVC.m
//  IKE
//
//  Created by 张科 on 16/10/11.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "OrderWebViewVC.h"
#import "NavigationView.h"
@interface OrderWebViewVC ()<UIWebViewDelegate>

@end

@implementation OrderWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    WeakSelf(wc);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"专家详情";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlStr]];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 }
- (UIWebView *)webView
{
    if (!_webView)
    {
        
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 20)];
        _webView.delegate = self;
    }
    return _webView;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *backUrl = request.URL.absoluteString;
    NSString *tt = [self URLDecodedString:backUrl];
    
    
    return YES;
}
-(NSString *)URLDecodedString:(NSString *)str
{
    //微信url处理
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}


@end
