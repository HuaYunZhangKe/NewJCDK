//
//  JCDKBaseTableView.m
//  JCDK
//
//  Created by 张科 on 16/8/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseTableView.h"

@implementation JCDKBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self)
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
- (void)awakeFromNib
{
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}
@end
