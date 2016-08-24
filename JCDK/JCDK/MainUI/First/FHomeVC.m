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

@interface FHomeVC ()<UITableViewDelegate, UITableViewDataSource>

@end
static NSString *itabInde = @"tintroduce";
static NSString *imatch = @"tmatch";
static NSString *itopic = @"ttopic";


@implementation FHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self setnavigationBar];
    [self settingTableView];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
        }
    };
    [self.view addSubview:navigationView];

}
- (void)settingTableView
{
    self.tableView.tableHeaderView = self.headerView;
    
    [self.tableView registerClass:[FHIntroduceTabCell class] forCellReuseIdentifier:itabInde];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

#pragma mark - 懒加载
- (FirstHHeaderView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"FirstHHeaderView" owner:self options:nil] objectAtIndex:0];
        _headerView.frame = CGRectMake(0, 0, self.view.width, 263);
        _headerView.layer.masksToBounds = YES;
        [_headerView setHeaderView];
    }
    return _headerView;
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
        [cell setContentWithArray:@[@"a", @"b",@"c",@"d",@"e",@"f",@"g",@"h"]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:0];
            return cell;

        }
        else
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:2];
            return cell;

        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:1];
            return cell;
            
        }
        else
        {
            FHTableCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FHTableCell" owner:self options:nil] objectAtIndex:3];
            return cell;
            
        }

    }

}
@end
