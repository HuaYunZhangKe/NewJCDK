//
//  ChangeSignVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/18.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ChangeSignVC.h"
#import "NavigationView.h"
@interface ChangeSignVC ()<UITextViewDelegate>

@end

@implementation ChangeSignVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textVIew.delegate = self;
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"修改签名";
    navigationView.saveBtn.hidden = NO;
    WeakSelf(wc);
    [navigationView.saveBtn addTarget:self action:@selector(saveBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
       [wc.navigationController popViewControllerAnimated:NO];
        wc.block(self.textVIew.text);

    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

  
}
- (void)saveBtnCLick:(UIButton *)button
{
    if (_block)
    {
        _block(self.textVIew.text);
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.placeHoder.hidden = YES;
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
