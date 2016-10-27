//
//  ZhuaJiaDVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/17.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ZhuaJiaDVC.h"
#import "ZhuaJiaTabCellTableViewCell.h"
#import "LHAFNetworkTool.h"
#import "Expert.h"
#import "NavigationView.h"
#import "OrderWebViewVC.h"
@interface ZhuaJiaDVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain)NSMutableArray *exArr;
@end

@implementation ZhuaJiaDVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.exArr = [NSMutableArray new];
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"专家列表";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

    [self.tableView registerNib:[UINib nibWithNibName:@"ZhuaJiaTabCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"zj"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [LHAFNetworkTool GET:self.urlStr params:nil success:^(NSURLSessionDataTask *task, id responseObject, NSInteger codetype, NSInteger codeMessage)
     {
         NSArray *tempArr = [NSArray arrayWithArray:responseObject[@"userlist"]];
         for (NSDictionary *dic in tempArr)
         {
             Expert *ex = [[Expert alloc] initWithDictionary:dic];
             [self.exArr addObject:ex];
         }
         [self.tableView reloadData];
     } fail:^(NSURLSessionDataTask *task, NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.exArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZhuaJiaTabCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zj"];
    if (self.exArr.count != 0)
    {
        cell.ex = self.exArr[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
    Expert *ex = self.exArr[indexPath.row];
    NSString *urlStr = [NSString stringWithFormat:@"%@?g=app&m=rec&a=expert&userid=%@&uid=1",K_Server_Main_URL,ex.eid];
    vc.urlStr = urlStr;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
