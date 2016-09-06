//
//  ThirdCollectionCell.m
//  JCDK
//
//  Created by 张科 on 16/8/27.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ThirdCollectionCell.h"
#import "SaiQianLeftTabCell.h"
#import "SaiQianRighttabCell.h"
@interface ThirdCollectionCell ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ThirdCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)settingIndex0Nib
{
    self.line0 = [[UIView alloc] initWithFrame:CGRectMake(0, 33, 60, 2)];
    self.line0.backgroundColor = kYellowColor;
    [self.backView0 addSubview:self.line0];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.backgroundColor =kHexColor(0x171a1a);

    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    self.rightTableView.backgroundColor =kHexColor(0x171a1a);

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView)
    {
        return 50;
    }
    else
    {
        return 90;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView)
    {
        [tableView registerNib:[UINib nibWithNibName:@"SaiQianLeftTabCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"left"];
        SaiQianLeftTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"left"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    else
    {
        [tableView registerNib:[UINib nibWithNibName:@"SaiQianRighttabCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"right"];
        SaiQianRighttabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"right"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
}




@end
