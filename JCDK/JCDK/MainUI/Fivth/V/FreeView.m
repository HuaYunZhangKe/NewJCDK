//
//  FreeView.m
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FreeView.h"

@implementation FreeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}
-(void)creatView
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor =kHexColor(0x171a1a);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 80)];
    headView.backgroundColor = kHexColor(0x2a2e32);
    self.tableView.tableHeaderView = headView;
}
@end
