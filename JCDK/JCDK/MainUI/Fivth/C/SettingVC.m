//
//  SettingVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/21.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "SettingVC.h"
#import "NavigationView.h"
#import "LoginVC.h"
#import "AppDelegate.h"
#import "RegistVC.h"
@interface SettingVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,retain)NSArray *dataArr;
@end

@implementation SettingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor blackColor];
    _tableView.backgroundColor = [UIColor blackColor];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"设置";
    navigationView.saveBtn.hidden = YES;
    WeakSelf(wc);
    [navigationView.saveBtn addTarget:self action:@selector(saveBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];

        
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

//    _tableView.backgroundColor = kAppColor;
    _dataArr = @[@[@"修改密码"],@[@"清空缓存"],@[@"给我们评分",@"分享给好友",@"用户协议",@"关于竞彩大咖"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count + 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == self.dataArr.count)
    {
        return 1;
    }
    else
    {
        return [self.dataArr[section] count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.backgroundColor = kHexColor(0x2a2e32);
    cell.textLabel.textColor = [ UIColor whiteColor];
    cell.detailTextLabel.textColor = [ UIColor whiteColor];
    cell.textLabel.font =[ UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section != self.dataArr.count)
    {
        cell.textLabel.text = self.dataArr[indexPath.section][indexPath.row];

    }
    else
    {
        cell.textLabel.text = @"";
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 70)];
        label.text = @"退出登录";
        label.textColor = [UIColor whiteColor];
        label.textAlignment  = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell addSubview:label];

//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
        if(indexPath.section == 1)
    {
        if(indexPath.row == 1)
        {
            cell.detailTextLabel.text = @"1.94M";
        }
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == self.dataArr.count)
    {
        return 30;
    }
    else
    {
        return 12;

    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat viewHeight;
    if (section == self.dataArr.count)
    {
        viewHeight = 30;
    }
    else
    {
        viewHeight = 12;
        
    }

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,JCDK_Screen_WIDTH,viewHeight)];
    view.backgroundColor = [UIColor blackColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.dataArr.count)
    {
        return 60;
    }
    else
    {
        return 50;
 
    }
}
#pragma mark - tableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        RegistVC *vc = [[RegistVC alloc] initWithNibName:@"RegistVC" bundle:nil];
        vc.fromWhere = 2;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == self.dataArr.count)
     {
         LoginVC *vc =  [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
         [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"isLogin"];
         [self.navigationController pushViewController:vc animated:YES];
              }
}


@end
