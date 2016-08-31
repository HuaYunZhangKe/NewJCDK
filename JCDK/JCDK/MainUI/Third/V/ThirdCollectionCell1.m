//
//  ThirdCollectionCell1.m
//  JCDK
//
//  Created by 张科 on 16/8/29.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ThirdCollectionCell1.h"
#import "ChuanGuanTabCell.h"
@interface ThirdCollectionCell1 ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain)NSMutableArray *isExpanArr;//是否展开
@end
@implementation ThirdCollectionCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)settingIndex1Nib
{
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    self.isExpanArr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *expan = self.isExpanArr[section];
    if ([expan integerValue] == 0)
    {
        return 1;

    }
    else
    {
        return 2;
 
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *expan = self.isExpanArr[indexPath.section];
    if ([expan integerValue] == 0)
    {
        return 40;
        
    }
    else
    {
        if (indexPath.row == 0)
        {
            return 40;

        }
        else
        {
            return 264;

        }
        
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *expan = self.isExpanArr[indexPath.section];
    if ([expan integerValue] == 0)
    {
        
        ChuanGuanTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chuanG1"];
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ChuanGuanTabCell" owner:self options:nil] objectAtIndex:0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        if (indexPath.row == 0)
        {
            ChuanGuanTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chuanG1"];
            if (!cell)
            {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ChuanGuanTabCell" owner:self options:nil] objectAtIndex:0];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
        else
        {
            ChuanGuanTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chuanG1"];
            if (!cell)
            {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ChuanGuanTabCell" owner:self options:nil] objectAtIndex:1];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
        
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        NSString *expan = self.isExpanArr[indexPath.section];
        if ([expan integerValue] == 0)
        {
            [self.isExpanArr replaceObjectAtIndex:indexPath.section
                                       withObject:@"1"];
        }
        if ([expan integerValue] == 1)
        {
            [self.isExpanArr replaceObjectAtIndex:indexPath.section
                                       withObject:@"0"];
        }
        [tableView reloadData];
 
    }
 
}
@end
