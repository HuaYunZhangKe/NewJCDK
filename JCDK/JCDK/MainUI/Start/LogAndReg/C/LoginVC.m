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
#import "JCYNetCenter.h"
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
                              @"username": self.userName.textField.text,
                              @"password":self.password.textField.text
                              };
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=login",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
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
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:result[@"user"]];
    NSMutableDictionary *infoDic = [NSMutableDictionary new];
    [infoDic setObject:dic[@"user_nicename"] forKey:@"user_nicename"];
    [infoDic setObject:dic[@"user_login"] forKey:@"user_login"];
    [infoDic setObject:dic[@"id"] forKey:@"id"];
    NSString *intro;
    NSLog(@"%@",dic[@"introduction"]);
    if ([dic[@"introduction"] isEqual:[NSNull null]])
    {
        intro = @"";
    }
    else
    {
        intro = dic[@"introduction"];

    }
    NSString *avator;
    if ([dic[@"avatar"] isEqual:[NSNull null]])
    {
        avator = @"";
    }
    else
    {
        avator = dic[@"avatar"];
        
    }
    [infoDic setObject:avator forKey:@"avator"];
    [infoDic setObject:intro forKey:@"introduction"];
    [infoDic setObject:dic[@"coin"] forKey:@"coin"];
    [infoDic setObject:dic[@"balance"] forKey:@"balance"];
    [infoDic setObject:dic[@"sex"] forKey:@"sex"];



    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] setObject:infoDic forKey:@"userInfo"];

    [self showTotast:@"登录成功"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)showTotast:(NSString *)title
{
    
    [MBUtil showTotastView:kAppdelegate.window WithTitle:title];
    
}




@end
