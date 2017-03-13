//
//  IntroListVC.m
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "IntroListVC.h"
#import "IntrotableCell.h"
#import "NavigationView.h"
#import "IntroModel.h"
#import "OrderWebViewVC.h"
#import "LoginVC.h"
@interface IntroListVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,retain)NSMutableArray *listArr;
@end

@implementation IntroListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf(wc);
    self.listArr = [NSMutableArray new];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text =@"推荐列表";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    [self BaseketBallListRequestFromWeb];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"IntrotableCell" bundle:nil] forCellReuseIdentifier:@"tj"];

    // Do any additional setup after loading the view from its nib.
}
- (void)BaseketBallListRequestFromWeb
{
    [self showHud:@"读取中"];
    //    /index.php?g=app&m=user&a=login
    NSDictionary *paraDic = @{
                              @"uid":@"1",
                              
                              };
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=rec&a=basketball_list",K_Server_Main_URL ] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
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
    NSArray *tempArr = [NSArray arrayWithArray:result[@"list"]];
    for (NSDictionary *dic in tempArr)
    {
        IntroModel *intr = [[IntroModel alloc] initWithDictionary:dic];
        [self.listArr addObject:intr];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.listArr.count == 0) {
        return 0;
    }
    else
    {
        return self.listArr.count;

    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IntrotableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tj" forIndexPath:indexPath];
    cell.intr = self.listArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IntroModel * intr = self.listArr[indexPath.row];
    OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
    vc.naviTitle = @"专家详情";
    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSString *userid = userDic[@"id"];
    if (userid.length == 0)
    {
        LoginVC *vc = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        return ;
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@?g=app&m=rec&a=posts&id=%@&uid=%@",K_Server_Main_URL,intr.iid,userid];
    vc.urlStr = urlStr;
    [self.navigationController pushViewController:vc animated:YES];

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
