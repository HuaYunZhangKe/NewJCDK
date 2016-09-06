//
//  RegistVC1.m
//  JCDK
//
//  Created by 张科 on 16/9/2.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "RegistVC1.h"
#import "NavigationView.h"
#import "BMHttpHander.h"
@interface RegistVC1 ()
@property (nonatomic, retain)UIButton *resetCodeBtn;
@property (nonatomic, retain)NSMutableDictionary *currentDic;
@end

@implementation RegistVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentDic = [NSMutableDictionary dictionaryWithDictionary:self.postDic];
    [self settingNavigation];
    [self.obtainCode creatSubView];
    [self.password creatSubView];
    self.obtainCode.imageStr = @"login_phone.png";
    self.obtainCode.placeStr = @"请输入验证码";
    self.password.imageStr = @"login_possword.png";
    self.password.placeStr = @"请输入您的密码";
    self.password.imageView.frame = CGRectMake(self.password.height / 2.0, 8, 26 / 1.7, 35 / 1.7 );
    self.password.imageView.centerY = self.password.backView.centerY;
    self.signUpBtn.layer.cornerRadius = 20.0;
    [self.obtainCode.backView addSubview:self.resetCodeBtn];


}
- (void)settingNavigation
{
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
        navigationView.titleLabel4.text = @"注册";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
}

- (IBAction)signUpAction:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)resetCodeBtnAction:(UIButton *)button
{
    [self getObtainCodeFromWeb];
}
- (UIButton *)resetCodeBtn
{
    if (!_resetCodeBtn)
    {
        _resetCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetCodeBtn.frame = CGRectMake(self.obtainCode.textField.right - 13 * 4 - 15, 0, 13 * 4, 44);
        [_resetCodeBtn addTarget:self action:@selector(resetCodeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _resetCodeBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [_resetCodeBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_resetCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        
    }
    return _resetCodeBtn;
}

- (IBAction)registBtnAction:(id)sender {
    if (self.obtainCode.textField.text.length == 0)
    {
        [self showTotast:@"请输入验证码"];
        return;
    }
    if (![self.obtainCode.textField.text isEqualToString: self.currentDic[@"code"]])
    {
        NSLog(@"%@",self.obtainCode.textField.text);
        [self showTotast:@"验证码错误请重新输入"];
        return;
    }
    if (self.password.textField.text.length == 0)
    {
        [self showTotast:@"请输入密码"];
        return;
    }
    [self sendRegistRequestToWeb];
}

#pragma  -mark webService
- (void)getObtainCodeFromWeb
{
    //    /index.php?g=app&m=user&a=sendmsg
    //    http://football.sh.hfcn.cc/index.php?g=app&m=user&a=sendmsg&type=0&mobile=15010870201
    NSDictionary *paraDic = @{
                              @"g":@"app",
                              @"m":@"user",
                              @"a":@"sendmsg",
                              @"type":@(0),
                              @"mobile": self.currentDic[@"phone"]
                              };
    [BMHttpHander PostRequest1:K_Server_Main_URL WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //        NSLog(@"%@", )
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        NSLog(@"%@", result[@"status"]);
        if ([status integerValue] == 1)
        {
            [result setObject:@"code" forKey:@"type"];
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
        }
        else
        {
            [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"返回status为0发送验证码失败" waitUntilDone:NO];
        }
        
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];
    
}
- (void)sendRegistRequestToWeb
{
//    index.php?g=app&m=user&a=register
    NSDictionary *paraDic = @{
                              @"g":@"app",
                              @"m":@"user",
                              @"a":@"register",
                              @"mobile": self.currentDic[@"phone"],
                              @"password":self.password.textField.text
                              };
    [BMHttpHander GetRequest:K_Server_Main_URL WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //        NSLog(@"%@", )
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", result[@"status"]);
        NSString *status = result[@"status"];
        if ([status integerValue] == 1)
        {
            [result setObject:@"regist" forKey:@"type"];
            [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"注册成功" waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
        }
        else
        {
            [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"返回status为0发送验证码失败" waitUntilDone:NO];
        }
        
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];

}
- (void)webRequestSuccess:(NSDictionary *)result
{
    NSString *type = result[@"type"];
    if ([type isEqualToString:@"code"])
    {
        [ self.currentDic setValue:result[@"num"] forKeyPath:@"code"];
        return;
    }
    if ([type isEqualToString:@"regist"])
    {
        
    }
}

- (void)showTotast:(NSString *)title
{
    [MBUtil showTotastView:self.view WithTitle:title];
    
}


@end
