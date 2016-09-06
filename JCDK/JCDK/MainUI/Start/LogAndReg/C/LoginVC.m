//
//  LoginVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "LoginVC.h"
#import "NavigationView.h"
#import "RegistVC.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingNavigation];
    [self.userName creatSubView];
    [self.password creatSubView];
    self.userName.imageStr = @"login_phone.png";
    self.userName.placeStr = @"请输入您的手机号码／会员号";
    self.password.imageStr = @"login_possword.png";
    self.password.placeStr = @"请输入您的密码";
    self.password.imageView.frame = CGRectMake(self.password.height / 2.0, 8, 26 / 1.7, 35 / 1.7 );
    self.password.imageView.centerY = self.password.backView.centerY;
    self.loginBtn.layer.cornerRadius = 20.0;

}
- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidAppear:(BOOL)animated
{
 
}
- (void)viewWillLayoutSubviews{
    
    NSLog(@"the view height is %f", self.view.frame.size.width);
    
}
- (void)settingNavigation
{
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
        NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"登录";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnAction:(id)sender {
    if (self.userName.textField.text.length == 0 )
    {
        [self showTotast:@"请输入手机号"];
        return;
    }
    if (self.password.textField.text.length == 0 )
    {
        [self showTotast:@"请输入验证码"];
        return;
    }
    [self sendLoginRequestToWeb];
}
- (IBAction)signupBtn:(id)sender {
    RegistVC *vc = [[RegistVC alloc] initWithNibName:@"RegistVC" bundle:nil];
    vc.fromWhere = 1;
    [self.navigationController pushViewController:vc animated:YES];

}
- (IBAction)forgetBtn:(id)sender {
    RegistVC *vc = [[RegistVC alloc] initWithNibName:@"RegistVC" bundle:nil];
    vc.fromWhere = 2;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)sendLoginRequestToWeb
{
    //    /index.php?g=app&m=user&a=login
    NSDictionary *paraDic = @{
                              @"g":@"app",
                              @"m":@"user",
                              @"a":@"login",
                              @"username": self.userName.textField.text,
                              @"password":self.password.textField.text
                              };
    [BMHttpHander GetRequest:K_Server_Main_URL WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //        NSLog(@"%@", )
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", result[@"status"]);
        NSString *status = result[@"status"];
        if ([status integerValue] == 1)
        {
            
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
                        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"登录成功" waitUntilDone:NO];
        }
        else
        {
            [self performSelectorOnMainThread:@selector(showTotast:) withObject:result[@"error"] waitUntilDone:NO];
        }
        
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];
    
}
- (void)webRequestSuccess:(NSDictionary *)result
{
    
}

- (void)showTotast:(NSString *)title
{
    [MBUtil showTotastView:self.view WithTitle:title];
    
}

@end
