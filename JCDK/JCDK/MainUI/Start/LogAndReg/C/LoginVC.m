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
    self.userName.imageStr = @"login_phone.png";
    self.userName.placeStr = @"请输入您的手机号码／会员号";
    self.password.imageStr = @"login_possword.png";
    self.password.placeStr = @"请输入您的密码";
    self.password.imageView.frame = CGRectMake(self.password.height / 2.0, 8, 26 / 1.7, 35 / 1.7 );
    self.password.imageView.centerY = self.password.backView.centerY;
    self.loginBtn.layer.cornerRadius = 20.0;
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

@end
