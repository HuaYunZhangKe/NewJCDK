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
-(NSArray *)dataArr
{
    if(!_dataArr)
    {
        self.dataArr = [NSArray array];
           }
    return _dataArr;

}
-(NSArray *)imgArr
{
    if(!_imgArr)
    {
        self.imgArr = [NSArray array];
       
    }
     return _imgArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:3];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
       [self.view addSubview:navigationView];
    self.myView = [[MyView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT  )];
    [self.view addSubview:_myView];
    _myView.tableView.dataSource = self;
    _myView.tableView.delegate = self;
    _myView.tableView.separatorColor = [UIColor blackColor];

      self.dataArr = @[@[@"已购推荐",@"我的推荐",@"我的关注",@"投注记录"],@[@"账户明细",@"免费领取金币",@"赠送好友",@"我的邀请",@"排行设置"],@[@"我的消息",@"我的帖子",@"我的收藏",@"意见反馈"],@[@"更多设置"]];
    self.imgArr = @[@[@"my1@2x",@"my2@2x",@"my3@2x",@"my4@2x"],@[@"my5@2x",@"my6@2x",@"my7@2x",@"my8@2x",@"my9@2x"],@[@"my10@2x",@"my11@2x",@"my12@2x",@"my13@2x"],@[@"my14@2x"]];
}
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
    cell.backgroundColor = kHexColor(0x22272c);
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击 %ld-%ld",indexPath.section,indexPath.row);
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
