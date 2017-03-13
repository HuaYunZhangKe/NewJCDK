//
//  MyNewsVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/28.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MyNewsVC.h"
#import "NavigationView.h"
#import "FocusTabCell.h"
#import "NewsModel.h"
#import "NewsListTabCell.h"
#import "NewsDetailVC.h"
@interface MyNewsVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,retain)NSMutableArray *newsArr;
@end

@implementation MyNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = kHexColor(0x2A2E32);
    self.newsArr = [NSMutableArray new];
    [self myNewsInfoFromWEb:0];
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"我的消息";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = kHexColor(0x2A2E32);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myNewsInfoFromWEb:(NSInteger )type
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看
    
    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSString *userid = userDic[@"id"];

    NSDictionary *paraDic = @{
                              @"userid"   :userid,
                              @"page"     :@"1",
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=push&a=push_record",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:[NSString stringWithFormat:@"%ld",(long)type] forKey:@"type"];
        if ([status integerValue] == 1)
        {
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
        }
        else
        {
            [self showTotast:result[@"error"]];
        }
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];
    
}


- (void)webRequestSuccess:(NSDictionary *)result
{
    NSString *type = result[@"type"];
    NSArray *tArr = [NSArray arrayWithArray:result [@"list"]];
    for (NSDictionary *dic in tArr)
    {
        NewsModel *news = [[NewsModel alloc] initWithDictionary:dic];
        [self.newsArr addObject:news];
    }
    [self.tableView reloadData];

}
- (void)showTotast:(NSString *)title
{
    
    [MBUtil showTotastView:kAppdelegate.window WithTitle:title];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.newsArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150
    ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 10)];
    View.backgroundColor = [UIColor blackColor];
    return View;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsListTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsListTabCell" owner:self options:nil] objectAtIndex:0];
    cell.news = self.newsArr [indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailVC *vc = [[NewsDetailVC alloc] initWithNibName:@"NewsDetailVC" bundle:nil];
    NewsModel *news = self.newsArr[indexPath.row];
    vc.news = news;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
