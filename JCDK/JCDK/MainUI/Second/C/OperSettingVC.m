//
//  OperSettingVC.m
//  JCDK
//
//  Created by 张科 on 2017/3/6.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "OperSettingVC.h"
#import "NavigationView.h"
#import "OperSettingCell.h"
@interface OperSettingVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation OperSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"设置";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [self.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OperSettingCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OperSettingCell" owner:self options:nil] objectAtIndex:0];
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"进球提示";
    }
    else
    {
        cell.titleLabel.text = @"红白提示";

    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
