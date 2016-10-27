//
//  ThirdCWebCell.m
//  JCDK
//
//  Created by 张科 on 16/9/20.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ThirdCWebCell.h"
@interface ThirdCWebCell()<UIWebViewDelegate>
@end
@implementation ThirdCWebCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = kAppColor;
    self.webView.delegate = self;

}
- (void)setUrlStr:(NSString *)urlStr
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]];
    [self.webView loadRequest:request];
    [self showHud:@"读取中..."];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"UserAgent = %@", [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"]);
    [self hiddeHud];

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hiddeHud];
}
- (void)showHud:(NSString *)title
{
    [MBUtil showHudView:self WithTitle:title];
}
- (void)hiddeHud
{
    [MBUtil hideHud:self];
}
@end
