//
//  SHCollectionCell.m
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "SHCollectionCell.h"
#import "BiFenTabCell.h"
@interface SHCollectionCell()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SHCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.tableView];
    }
    return self;
}


- (void)setType:(NSInteger)type
{
    _type = type;
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.type == 1)
    {
        return  7;
    }
    else if(self.type == 2)
    {
        return  8;

    }
    else if (self.type == 3)
    {
        return  8;

    }
    else
    {
        return  3;

    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == 1)
    {
        return 64;
    }
    else if(self.type == 2)
    {
        if (indexPath.row == 0)
        {
            return 35;
        }
        else
        {
            return 65;
        }
    }
    else if (self.type == 3)
    {
        if (indexPath.row == 0)
        {
            return 35;
        }
        else
        {
            return 65;
        }

    }
    else
    {
        return 99;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == 1)
    {
        BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else if(self.type == 2)
    {
        if (indexPath.row == 0)
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:1];
            cell.button1Block = ^(NSInteger index)
            {
                if (index == 1)
                {
                    self.saiguoBlock(1);
                }
                if (index == 2)
                {
                    self.saiguoBlock(2);
                }
                if (index == 3)
                {
                    self.saiguoBlock(3);
                }

            };
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
        else
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
     }
    else if (self.type == 3)
    {
        if (indexPath.row == 0)
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
            
        }
        else
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
            
        }

    }
    else
    {
        BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;

    }
}
- (JCDKBaseTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[JCDKBaseTableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor =kHexColor(0x171a1a);

    }
    return _tableView;
}
@end
