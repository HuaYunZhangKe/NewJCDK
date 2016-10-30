//
//  FiveHomeVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FiveHomeVC.h"
#import "NavigationView.h"
#import "MyView.h"
#import "FreeReciveViewController.h"
#import "TouZhuViewController.h"
#import "LoginVC.h"
#import "SelfInfoVC.h"
#import "SettingVC.h"
#import "AccountVC.h"
#import "BuyIntroduceVC.h"
#import "MyIntrduceVC.h"
#import "MyNewsVC.h"
#import "MysuggestionVC.h"
#import "ErcodeVC.h"
#import "MycollectionVC.h"
@interface FiveHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)MyView *myView;
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@property (nonatomic, retain)NSDictionary *infoDic;
@end

@implementation FiveHomeVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoDic = [NSDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"]];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:3];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
       [self.view addSubview:navigationView];
    [self.view addSubview:self.myView];
    [_myView.leftBtn addTarget:self action:@selector(kabiChongZhi:) forControlEvents:UIControlEventTouchUpInside];
    [_myView.rightBtn addTarget:self action:@selector(yinbiChongZhi:) forControlEvents:UIControlEventTouchUpInside];
    [_myView.headViewBtn addTarget:self action:@selector(headViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - button 点击事件
-(void)kabiChongZhi:(UIButton *)sender
{
  /*** 咖币充值 */
    NSLog(@"1111");
}
-(void)yinbiChongZhi:(UIButton *)sender
{
    /*** 银币充值 */
    NSLog(@"222");

}
- (void)headViewBtnClick:(UIButton *)sender
{
    NSString *islogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
    if ([islogin integerValue] == 1)
    {
        SelfInfoVC *vc = [[SelfInfoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
            LoginVC *loginVC = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
            [self.navigationController pushViewController:loginVC animated:YES];

    }
  

}
#pragma mark - tableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArr[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.backgroundColor = kHexColor(0x2a2e32);
    cell.textLabel.text = self.dataArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = [ UIColor whiteColor];
    cell.detailTextLabel.textColor = [ UIColor whiteColor];
    cell.textLabel.font =[ UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    cell.imageView.image = [UIImage imageNamed:self.imgArr[indexPath.section][indexPath.row]];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section == 0)
    {
        if(indexPath.row == 1)
        {
            cell.detailTextLabel.text = @"收入0.00";
        }
    }
    if(indexPath.section == 1)
    {
        if(indexPath.row == 1)
        {
            cell.detailTextLabel.text = @"0/7";
        }
    }
       return cell;
    
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
    if(indexPath.section == 1 && indexPath.row == 1)
    {
        FreeReciveViewController *free = [FreeReciveViewController new];
        [self.navigationController pushViewController:free animated:YES];
        
    }if(indexPath.section == 0 &&indexPath.row == 3)
    {
        TouZhuViewController *touzhu =[[TouZhuViewController alloc] initWithNibName:@"TouZhuViewController" bundle:nil];
        [self.navigationController pushViewController:touzhu animated:YES];
    }if(indexPath.section == 3 &&indexPath.row == 0)
    {
        SettingVC *vc =[[SettingVC alloc] initWithNibName:@"SettingVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 0)
    {
        AccountVC *vc = [[AccountVC alloc] initWithNibName:@"AccountVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 0)
    {
        BuyIntroduceVC *vc = [[BuyIntroduceVC alloc] initWithNibName:@"BuyIntroduceVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1)
    {
        MyIntrduceVC *vc = [[MyIntrduceVC alloc] initWithNibName:@"MyIntrduceVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 0)
    {
        MyNewsVC *vc = [[MyNewsVC alloc] initWithNibName:@"MyNewsVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 2)
    {
        MysuggestionVC *vc = [[MysuggestionVC alloc] initWithNibName:@"MysuggestionVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 2)
    {
        ErcodeVC *invite = [[ErcodeVC alloc] initWithNibName:@"ErcodeVC" bundle:nil];
        [self.navigationController pushViewController:invite animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 1)
    {
        MycollectionVC *invite = [[MycollectionVC alloc] initWithNibName:@"MycollectionVC" bundle:nil];
        [self.navigationController pushViewController:invite animated:YES];
    }
}

#pragma mark - 懒加载
-(NSArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = @[@[@"已购推荐",@"我的推荐",@"我的关注",@"投注记录"],@[@"账户明细",@"免费领取金币",@"我的邀请"],@[@"我的消息",@"我的收藏",@"意见反馈"],@[@"更多设置"]];
    }
    return _dataArr;
    
}
-(NSArray *)imgArr
{
    if(!_imgArr)
    {
        _imgArr = @[@[@"my1",@"my2",@"my3",@"my4"],@[@"my5",@"my6",@"my8"],@[@"my10",@"my12",@"my13"],@[@"my14"]];
        
    }
    return _imgArr;
}
- (MyView *)myView
{
    if (!_myView)
    {
        _myView = [[MyView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT  ) AndDIc:self.infoDic];
        _myView.tableView.dataSource = self;
        _myView.tableView.delegate = self;
        _myView.tableView.separatorColor = kHexColor(0x1f2425);
        
    }
    return _myView;
}

@end
