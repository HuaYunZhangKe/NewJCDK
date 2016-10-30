//
//  MyIntrduceVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MyIntrduceVC.h"
#import "NavigationView.h"
#import "IKEBaseTableView.h"
#import "MyIntroModel.h"
#import "MyIntrTabCell.h"
@interface MyIntrduceVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UIButton *currentBtn;
@property (nonatomic, retain)UIView *lineView;
@property (nonatomic ,assign)NSInteger index;
@property (nonatomic ,retain)IKEBaseTableView *tableView;
@property (nonatomic ,retain)NSMutableArray *jcArr;
@property (nonatomic ,retain)NSMutableArray *ypArr;
@property (nonatomic ,retain)NSMutableArray *jqsArr;


@end

@implementation MyIntrduceVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.currentBtn = self.jcBtn;
    self.index = 1;
    self.jcArr = [NSMutableArray new];
    self.ypArr = [NSMutableArray new];
    self.jqsArr = [NSMutableArray new];
    [self accountInfoFromWEb:0];
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"我的推荐";
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    [self.view addSubview:navigationView];
    [self.view addSubview:self.tableView];
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.switchView.height - 2, JCDK_Screen_WIDTH / 3.0, 2)];
    self.lineView.backgroundColor = kYellowColor;
    [self.switchView addSubview:self.lineView];
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonClick:(UIButton *)sender
{
    [UIView animateWithDuration:0.2 animations:^{
         self.lineView.frame  = CGRectMake((sender.tag - 1) * (JCDK_Screen_WIDTH / 3.0), self.switchView.height - 2, JCDK_Screen_WIDTH / 3.0, 2);
    }];
    self.index = sender.tag;
    [self.currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sender setTitleColor:kYellowColor forState:UIControlStateNormal];
    self.currentBtn  = sender;
    [self.tableView reloadData];
}

- (IKEBaseTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[IKEBaseTableView alloc] initWithFrame:CGRectMake(0, 64 + 90, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 64 - 90) style:UITableViewStylePlain];
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
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=mylist",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
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
        MyIntroModel *intr = [[MyIntroModel alloc] initWithDictionary:dic];
        if ([intr.Bet integerValue] == 5)
        {
            [self.jcArr addObject:intr];
        }
        if ([intr.Bet integerValue] == 6)
        {
            [self.ypArr addObject:intr];
        }
        if ([intr.Bet integerValue] == 7)
        {
            [self.jqsArr addObject:intr];
        }
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
    if (_index == 1)
    {
        return  self.jcArr.count;

    }
    else if (_index == 2)
    {
        return  self.ypArr.count;

    }
    else
    {
        return  self.jqsArr.count;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyIntrTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyIntrTabCell" owner:self options:nil] objectAtIndex:0];
    MyIntroModel *intr;

    if (_index == 1)
    {
        intr = self.jcArr[indexPath.row];
    }
    else if (_index == 2)
    {
        intr = self.ypArr[indexPath.row];
        
    }
    else
    {
        intr = self.jqsArr[indexPath.row];
    }

    cell.intr = intr;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
