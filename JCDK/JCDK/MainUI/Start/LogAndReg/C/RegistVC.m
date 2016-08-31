//
//  RegistVC.m
//  JCDK
//
//  Created by 张科 on 16/8/31.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "RegistVC.h"

@interface RegistVC ()

@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _obtainBtn.layer.cornerRadius = 20.0;
    _loginBtn.layer.cornerRadius = 20.0;
    _phoneView.layer.cornerRadius = 22.0;
    [self settingNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)settingNavigation
{
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    if (_fromWhere == 1)
    {
        navigationView.titleLabel4.text = @"注册";
 
    }
    if (_fromWhere == 2)
    {
        navigationView.titleLabel4.text = @"找回密码";

    }
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
}

- (IBAction)obtainCode:(id)sender {
}

- (IBAction)loginBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
