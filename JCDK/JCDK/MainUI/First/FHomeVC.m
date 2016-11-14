//
//  FHomeVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FHomeVC.h"
#import "NavigationView.h"
#import "FHIntroduceTabCell.h"
#import "FHTableCell.h"
#import "Posts.h"
#import "Slides.h"
#import "Users.h"
#import "Matchs.h"
#import "MBUtil.h"
#import "MyNewsVC.h"

@interface FHomeVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)NSMutableArray *topicArr;
@property (nonatomic, retain)NSMutableArray *slidesArr;
@property (nonatomic, retain)NSMutableDictionary *usersDic;//专家推荐字典
@property (nonatomic, retain)NSMutableArray *matchArr;

@end
static NSString *itabInde = @"tintroduce";
static NSString *imatch = @"tmatch";
static NSString *itopic = @"ttopic";


@implementation FHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self FHomeListRequestFromWeb];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)viewWillLayoutSubviews
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setnavigationBar
{
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:0];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    navigationView.buttonBlock0 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边按钮点击
        }
        if (button == 2)
        {
            //右边按钮点击
            MyNewsVC *news = [[MyNewsVC alloc] initWithNibName:@"MyNewsVC" bundle:nil];
            [self.navigationController pushViewController:news animated:YES];
        }
    };
    [self.view addSubview:navigationView];

}
- (void)settingTableView
{
    self.tableView.tableHeaderView = self.headerView;
    [self.tableView registerClass:[FHIntroduceTabCell class] forCellReuseIdentifier:itabInde];
    self.tableView.backgroundColor =kHexColor(0x171a1a);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

#pragma mark - 懒加载
- (FirstHHeaderView *)headerView
{
    WeakSelf(wc);
    if (!_headerView)
    {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"FirstHHeaderView" owner:self options:nil] objectAtIndex:0];
        _headerView.frame = CGRectMake(0, 64, self.view.width, 263);
        _headerView.layer.masksToBounds = YES;
        _headerView.middleTapBlock = ^(NSInteger index)
        {
            if (index == 1)
            {
                //足球
                [wc.tabBarController setSelectedIndex:2];

            }
            if (index == 2)
            {
                //篮球
                [wc showTotast:@"新功能开发中尽请期待"];

            }
            if (index == 3)
            {
                //推荐
                [wc.tabBarController setSelectedIndex:3];
            }
            if (index == 4)
            {
                //新手
                [wc showTotast:@"新功能开发中尽请期待"];

            }
        };
        [_headerView setHeaderViewWithArray:self.slidesArr];
    }
    return _headerView;
}
- (NSMutableArray *)topicArr
{
    if (!_topicArr)
    {
        _topicArr = [NSMutableArray new];
    }
    return _topicArr;
}

- (NSMutableArray *)slidesArr
{
    if (!_slidesArr)
    {
        _slidesArr = [NSMutableArray new];
    }
    return _slidesArr;
}
- (NSMutableDictionary *)usersDic
{
    if (!_usersDic)
    {
        _usersDic = [NSMutableDictionary new];
    }
    return _usersDic;
}
- (NSMutableArray *)matchArr
{
    if (!_matchArr)
    {
        _matchArr = [NSMutableArray new];
    }
    return _matchArr;
}
#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 4;
    }
    else
    {
        return 4;

    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 194;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            return 40;
        }
        else
        {
            return 98;
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            return 40;
        }
        else
        {
            return 150;
        }

    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,JCDK_Screen_WIDTH,12)];
    view.backgroundColor = [UIColor blackColor];
    return view;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        FHIntroduceTabCell *cell = [[FHIntroduceTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:itabInde];
        cell.backgroundColor = [UIColor redColor];
//        [cell setContentWithArray:@[@"a", @"b",@"c",@"d",@"e",@"f",@"g",@"h"]];
        cell.showDic = self.usersDic;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
        else
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.macth = self.matchArr[indexPath.row - 1];
            return cell;
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
            
        }
        else
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:3];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.post = self.topicArr[indexPath.row - 1];
            return cell;
            
        }

    }

}
#pragma mark - web service
- (void)FHomeListRequestFromWeb
{
    [self showHud:@"读取中"];
    //    /index.php?g=app&m=user&a=login
    NSDictionary *paraDic = @{
                              @"g":@"app",
                              @"m":@"index",
                              @"a":@"index",
                                 };
    [BMHttpHander PostRequest1:K_Server_Main_URL WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
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
- (void)NewsInfoFromWEb:(NSInteger )type
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看
    
    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSString *userid = userDic[@"id"];
    
    NSDictionary *paraDic = @{
                              @"page"     :@"1",
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=index&a=ul_newslist",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:[NSString stringWithFormat:@"news"] forKey:@"type"];
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
    if ([type isEqualToString:@"first"])
    {
        NSArray *postTempArr = result[@"posts"];
        NSArray *slidesTempArr = result[@"slides"];
        NSArray *tjTempArr = result[@"users"][@"tuijian"];
        NSArray *hrTempArr = result[@"users"][@"daren"];
        NSArray *gzTempArr = result[@"users"][@"guanzhu"];
        NSMutableArray *tjArr = [NSMutableArray new];
        NSMutableArray *hrArr = [NSMutableArray new];
        NSMutableArray *gzArr = [NSMutableArray new];
        NSArray *matchsTempArr = result[@"matchs"];
        for (NSDictionary *dic in postTempArr)
        {
            Posts *post = [[Posts alloc] initWithDictionary:dic];
            [self.topicArr addObject:post];
        }
        for (NSDictionary *dic in slidesTempArr)
        {
            Slides *post = [[Slides alloc] initWithDictionary:dic];
            [self.slidesArr addObject:post];
        }
        for (NSDictionary *dic in matchsTempArr)
        {
            Matchs *post = [[Matchs alloc] initWithDictionary:dic];
            [self.matchArr addObject:post];
        }
        for (NSDictionary *dic in tjTempArr)
        {
            Users *post = [[Users alloc] initWithDictionary:dic];
            [tjArr addObject:post];
        }
        for (NSDictionary *dic in hrTempArr)
        {
            Users *post = [[Users alloc] initWithDictionary:dic];
            [hrArr addObject:post];
        }
        //    for (NSDictionary *dic in gzTempArr)
        //    {
        //        Users *post = [[Users alloc] initWithDictionary:dic];
        //        [gzArr addObject:post];
        //    }
        
        [self.usersDic setObject:tjArr forKey:@"tj"];
        [self.usersDic setObject:hrArr forKey:@"hr"];
        //    [self.usersDic setObject:gzArr forKey:@"gz"];
        [self settingTableView];
        [self setnavigationBar];


    }
    if ([type isEqualToString:@"news"]) {
        
    }

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


@end
