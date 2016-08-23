//
//  FreeReciveViewController.m
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FreeReciveViewController.h"
#import "FreeView.h"
#import "FreeTableViewCell.h"
#import "NavigationView.h"
@interface FreeReciveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)FreeView *freeView;
@property(nonatomic,retain)NSArray *arr;

@end

@implementation FreeReciveViewController
-(NSArray *)arr
{
    if(!_arr)
    {
        _arr = @[@"新手体验",@"7天签到",@"发表帖子",@"关注圈子",@"购买服务",@"邀请码领金币"];
    }
    return _arr;
}
-(FreeView *)freeView
{
    if (!_freeView) {
        self.freeView = [[FreeView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT  )];
        self.freeView.tableView .dataSource = self;
        self.freeView.tableView.delegate = self;
        self.freeView.tableView.separatorColor =  kHexColor(0x1f2425);
    }
    return _freeView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf(wc);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"免费领金币";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    [self.freeView.tableView registerClass:[FreeTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.freeView];
}
#pragma mark - tableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr .count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLb.text = self.arr[indexPath.row];
    cell.backgroundColor = kHexColor(0x2a2e32);

    cell.countLb.text = @"10";
    cell.detailLb.text = @"未完成";
    cell.dayLb.text= @"每日";
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,JCDK_Screen_WIDTH,12)];
    view.backgroundColor = [UIColor blackColor];
    return view;
}
#pragma mark - tableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击 %ld-%ld",indexPath.section,indexPath.row);
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
