//
//  MysuggestionVC.m
//  JCDK
//
//  Created by 魏秀红 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MysuggestionVC.h"
#import "NavigationView.h"

@interface MysuggestionVC ()
@property (weak, nonatomic) IBOutlet UITextView *sugtext;


@end

@implementation MysuggestionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navset];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}
//设置导航栏
-(void)navset{
    WeakSelf(wc);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"意见反馈";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

}
- (IBAction)submit:(id)sender {
    
    
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
