//
//  RegistVC.m
//  JCDK
//
//  Created by 张科 on 16/8/31.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "RegistVC.h"
#import "RegistVC1.h"
#import "BMHttpHander.h"
@interface RegistVC ()

@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _obtainBtn.layer.cornerRadius = 20.0;
    _loginBtn.layer.cornerRadius = 20.0;
    _phoneView.layer.cornerRadius = 22.0;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector (textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField];

    [self settingNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldChange:(NSNotification *)noti
{
    UITextField *textf = noti.object;
    if (textf.text.length == 0)
    {
        self.placeHoder.hidden = NO;
    }
    else
    {
        self.placeHoder.hidden = YES;
        
    }
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
    
    if (self.textField.text.length == 0)
    {
        [self showTotast:@"请输入手机号"];
        return;
    }
    [self getObtainCodeFromWeb];
  
}

- (IBAction)loginBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma  -mark webService
- (void)getObtainCodeFromWeb
{
//    /index.php?g=app&m=user&a=sendmsg
//    http://football.sh.hfcn.cc/index.php?g=app&m=user&a=sendmsg&type=0&mobile=15010870201
    NSDictionary *paraDic = @{
                              @"type":@(0),
                              @"mobile":self.textField.text
                              };
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@??g=app&m=user&a=sendmsg",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //        NSLog(@"%@", )
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        NSLog(@"%@", result[@"status"]);
        if ([status integerValue] == 1)
        {
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
    RegistVC1 *vc = [[RegistVC1 alloc] initWithNibName:@"RegistVC1" bundle:nil];
    vc.postDic = @{@"phone":self.textField.text,@"code":[NSString stringWithFormat:@"%@",result[@"num"]]};
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showTotast:(NSString *)title
{
    [MBUtil showTotastView:self.view WithTitle:title];
    
}



@end
