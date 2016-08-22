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
@interface FiveHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)MyView *myView;
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@end

@implementation FiveHomeVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:3];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
       [self.view addSubview:navigationView];
        [self.view addSubview:_myView];
    _myView.tableView.dataSource = self;
    _myView.tableView.delegate = self;
    _myView.tableView.separatorColor = kHexColor(0x1f2425);
    [self.view addSubview:self.myView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = [ UIColor whiteColor];
    cell.detailTextLabel.textColor = [ UIColor whiteColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    cell.imageView.image = [UIImage imageNamed:_imgArr[indexPath.section][indexPath.row]];

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
}

#pragma mark - 懒加载
-(NSArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = @[@[@"已购推荐",@"我的推荐",@"我的关注",@"投注记录"],@[@"账户明细",@"免费领取金币",@"赠送好友",@"我的邀请",@"排行设置"],@[@"我的消息",@"我的帖子",@"我的收藏",@"意见反馈"],@[@"更多设置"]];
    }
    return _dataArr;
    
}
-(NSArray *)imgArr
{
    if(!_imgArr)
    {
        _imgArr = @[@[@"my1",@"my2",@"my3",@"my4"],@[@"my5",@"my6",@"my7",@"my8",@"my9"],@[@"my10",@"my11",@"my12",@"my13"],@[@"my14"]];
        
    }
    return _imgArr;
}
- (MyView *)myView
{
    if (!_myView)
    {
        self.myView = [[MyView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT  )];
        _myView.tableView.dataSource = self;
        _myView.tableView.delegate = self;
        _myView.tableView.separatorColor = [UIColor blackColor];
        
    }
    return _myView;
}

@end
