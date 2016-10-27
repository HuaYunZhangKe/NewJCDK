//
//  AccountVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "AccountVC.h"
#import "UUtils.h"
#import "IKEBaseTableView.h"
#import "AccountTabCell.h"
#import "NavigationView.h"
#import "AccountModel.h"
@interface AccountVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UIView *topView;
@property (nonatomic, retain) UIView *lineView;
@property (nonatomic, retain)UIButton *currentBtn;
@property (nonatomic ,assign)NSInteger index;
@property (nonatomic, retain)IKEBaseTableView *tableView;
@property (nonatomic, retain)AccountModel *account;
@property (nonatomic, retain)NSMutableArray *kaBiArr;
@property (nonatomic, retain)NSMutableArray *yinBIArr;
@end

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kaBiArr = [NSMutableArray new];
    self.yinBIArr = [NSMutableArray new];
    [self accountInfoFromWEb:0];

    [self accountInfoFromWEb:1];
    self.view.backgroundColor = kAppColor;
    self.index = 1;
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"账号明细";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (UIView *)topView
{
    if (!_topView)
    {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, JCDK_Screen_WIDTH, 50)];
        UIButton *button1 = [UUtils quickButtonSuper:_topView Frame:CGRectMake(0, 0, _topView.width / 2.0, _topView.height) Target:self Sel:@selector(buttonClcik:)];
        button1.tag = 1;
        button1.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button1 setTitle:@"咖币明细" forState:UIControlStateNormal];
        self.currentBtn = button1;
        [button1 setTitleColor:kYellowColor forState:UIControlStateNormal];
        UIButton *button2 = [UUtils quickButtonSuper:_topView Frame:CGRectMake(_topView.width / 2.0,0 , _topView.width / 2.0, _topView.height) Target:self Sel:@selector(buttonClcik:)];
        button2.tag = 2;
        button2.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button2 setTitle:@"银币明细" forState:UIControlStateNormal];

        [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _topView.height - 2, _topView.width / 2.0, 2)];
        _lineView.backgroundColor = kYellowColor;
        [_topView addSubview:_lineView];
    }
    return _topView;
}
- (void)buttonClcik:(UIButton *)button
{
    self.index = button.tag;
    [self.currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:kYellowColor forState:UIControlStateNormal];
    self.currentBtn = button;
    if (button.tag == 1)
    {
        [UIView animateWithDuration:0.2 animations:^{
            _lineView.frame = CGRectMake(0, _topView.height - 2, _topView.width / 2.0, 2);
        }];
    }
    if (button.tag == 2)
    {
        [UIView animateWithDuration:0.2 animations:^{
            _lineView.frame = CGRectMake(_topView.width / 2.0, _topView.height - 2, _topView.width / 2.0, 2);
        }];
    }
    [self.tableView reloadData];

}

- (IKEBaseTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[IKEBaseTableView alloc] initWithFrame:CGRectMake(0, self.topView.bottom, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - (64 + 50)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = kAppColor;
   
        
    }
    return _tableView;
}
- (void)accountInfoFromWEb:(NSInteger )type
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看
    
    
    
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    if (token.length == 0)
    {
        token = @"";
    }
    NSDictionary *paraDic = @{
                              @"userid"   :@"1",
                              @"type"     :@(type),
                             };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=coinlist",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
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
    if ([type integerValue] == 0)
    {
        NSArray *tempArr = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in tempArr)
        {
            AccountModel *account = [[AccountModel alloc] initWithDictionary:dic];
            [self.kaBiArr addObject:account];
        }
    }
    if ([type integerValue] == 1)
    {
        NSArray *tempArr = [NSArray arrayWithArray:result[@"list"]];
        {
            for (NSDictionary *dic in tempArr)
            {
                AccountModel *account = [[AccountModel alloc] initWithDictionary:dic];
                [self.yinBIArr addObject:account];
            }
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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1)
    {
        return 1;
    }
    else
    {
        if (self.index == 1)
        {
            return self.kaBiArr.count;
        }
        else
        {
            return self.yinBIArr.count;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 10;
    }
    else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 10)];
    v.backgroundColor = [UIColor blackColor];
    return v;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        AccountTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountTabCell" owner:self options:nil] objectAtIndex:0];
        if (self.index == 1)
        {
            cell.titleLabel1.text = @"咖币";
            cell.titleLabel2.text = @"银币";

        }
        if (self.index == 2)
        {
            cell.titleLabel2.text = @"咖币";
            cell.titleLabel1.text = @"银币";

        }
        return cell;
    }
    if (indexPath.section == 1)
    {
        AccountTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountTabCell" owner:self options:nil] objectAtIndex:1];
        if (self.index == 1)
        {
            cell.chagngelaebl.text = @"咖币变动";
            
        }
        if (self.index == 2)
        {
            cell.titleLabel2.text = @"银币变动";
            
        }
        return cell;

    }
    else
    {
        AccountTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountTabCell" owner:self options:nil] objectAtIndex:2];
        if (self.index == 1)
        {
            AccountModel *account = self.kaBiArr[indexPath.row];
            cell.timeLaebl.text =account.inputtime;
            cell.chagngelaebl.text = account.title;
        }
        if (self.index == 2)
        {
            AccountModel *account = self.yinBIArr[indexPath.row];

            cell.timeLaebl.text =account.inputtime;
            cell.chagngelaebl.text = account.title;
        }
        return cell;
        

    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


@end
