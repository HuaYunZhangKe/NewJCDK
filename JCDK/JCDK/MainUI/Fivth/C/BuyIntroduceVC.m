//
//  BuyIntroduceVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/21.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BuyIntroduceVC.h"
#import "IKEBaseTableView.h"
#import "BuyIntrTabCell.h"
#import "NavigationView.h"
#import "IntroduceModel.h"
@interface BuyIntroduceVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)IKEBaseTableView *tableView;
@property (nonatomic, retain)NSMutableArray *intrArr;
@end

@implementation BuyIntroduceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.intrArr = [NSMutableArray new];
    [self accountInfoFromWEb:0];
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"已购推荐";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IKEBaseTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[IKEBaseTableView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = kAppColor;
    }
    return _tableView;
}
- (void)accountInfoFromWEb:(NSInteger )type
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看

    NSDictionary *paraDic = @{
                              @"userid"   :@"1",
                              @"type"     :@(type),
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=paylist",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
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
    NSArray *tempArr = [NSArray arrayWithArray:result[@"list"]];
    for (NSDictionary *dic in tempArr)
    {
        IntroduceModel *intr = [[IntroduceModel alloc] initWithDictionary:dic];
        [self.intrArr addObject:intr];
    }
    [self.tableView reloadData];
    
    
}
- (void)showTotast:(NSString *)title
{
    
    [MBUtil showTotastView:kAppdelegate.window WithTitle:title];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.intrArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     BuyIntrTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BuyIntrTabCell" owner:self options:nil] objectAtIndex:0];
    IntroduceModel *intr = self.intrArr[indexPath.row];
    cell.intr = intr;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
