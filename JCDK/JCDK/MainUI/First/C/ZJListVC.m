//
//  ZJListVC.m
//  JCDK
//
//  Created by 张科 on 2017/3/1.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "ZJListVC.h"
#import "ZJLIstTableCell.h"
#import "NavigationView.h"
@interface ZJListVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ZJListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf(wc);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text =@"专家列表";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZJLIstTableCell" bundle:nil] forCellReuseIdentifier:@"zj"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZJLIstTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zj" forIndexPath:indexPath];
    return cell;
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
