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
    [self ZJListRequestFromWeb];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZhuaJiaTabCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"zj"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
}
- (void)ZJListRequestFromWeb
{
    [self showHud:@"读取中"];
    //    /index.php?g=app&m=user&a=login
    NSDictionary *paraDic = @{
                              @"type":@(1),
                             
                              };
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=index&a=userlist",K_Server_Main_URL ] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //        NSLog(@"%@", )
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", result[@"status"]);
        NSString *status = result[@"status"];
        [result setObject:@"first" forKey:@"type"];
        if ([status integerValue] == 1)
        {
            
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
            //            [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"登录成功" waitUntilDone:NO];
        }
        else
        {
            [self performSelectorOnMainThread:@selector(showTotast:) withObject:nil waitUntilDone:NO];
        }
        [self performSelectorOnMainThread:@selector(hiddeHud) withObject:result[@"error"] waitUntilDone:NO];
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(hiddeHud) withObject:nil waitUntilDone:NO];
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];
    
}

- (void)webRequestSuccess:(NSDictionary *)result
{
    NSArray *tempArr = [NSArray arrayWithArray:result[@"userlist"]];
    for (NSDictionary *dic in tempArr)
    {
        Expert *ex = [[Expert alloc] initWithDictionary:dic];
        [self.exArr addObject:ex];
    }
    [self.tableView reloadData];

}
- (void)showHud:(NSString *)title
{
    [MBUtil showHudView:self.view WithTitle:title];
}
- (void)hiddeHud
{
    [MBUtil hideHud:self.view];
}
- (void)showTotast:(NSString *)title
{
    [MBUtil showTotastView:self.view WithTitle:title];
    
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
    vc.naviTitle = @"专家详情";
    NSString *urlStr = [NSString stringWithFormat:@"%@?g=app&m=rec&a=expert&userid=%@&uid=1",K_Server_Main_URL,ex.eid];
    vc.urlStr = urlStr;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
