//
//  ChangeNickNameVC.m
//  
//
//  Created by 张科 on 2016/10/21.
//
//

#import "ChangeNickNameVC.h"
#import "NavigationView.h"

@interface ChangeNickNameVC ()

@end

@implementation ChangeNickNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"修改昵称";
    navigationView.saveBtn.hidden = NO;
    WeakSelf(wc);
    [navigationView.saveBtn addTarget:self action:@selector(saveBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
        wc.block(self.textfield.text);
        
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

}
- (void)saveBtnCLick:(UIButton *)button
{
    if (_block)
    {
        _block(self.textfield.text);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
