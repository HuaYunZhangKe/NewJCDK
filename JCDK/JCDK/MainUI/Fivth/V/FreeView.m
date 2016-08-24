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
    JCDKBaseLabel *label1 =[[ JCDKBaseLabel alloc] initWithFrame:CGRectMake(0, headView.center.y, self.size.width /2, 11)];
    [headView addSubview:label1];
    JCDKBaseLabel *label2 =[[JCDKBaseLabel alloc] initWithFrame:CGRectMake(label1.right, label1.top, label1.width, label1.height)];
    [headView addSubview:label2];
    label1.text = @"完成任务";
    label2.text = @"获得金币";
    label1.font = [UIFont systemFontOfSize:13];
    label2.font = [UIFont systemFontOfSize:13];
    label1.textAlignment = NSTextAlignmentCenter;
    label2.textAlignment = NSTextAlignmentCenter;
    self.renwu = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(label1.left, label1.top - 20, label1.width, 13)];
    [headView addSubview:_renwu];
    _renwu.text = @"2/7";
    self.jinbiCount = [[JCDKBaseLabel alloc ] initWithFrame:CGRectMake(label2.left, label2.top - 20, label2.width, 13)];
    [headView  addSubview:_jinbiCount];
    _jinbiCount.text = @"80";
    _renwu.font = [UIFont systemFontOfSize:13];
    _jinbiCount.font = [UIFont systemFontOfSize:13];
    _renwu.textAlignment = NSTextAlignmentCenter;
    _jinbiCount.textAlignment = NSTextAlignmentCenter;
    _jinbiCount.textColor = kHexColor(0xe69c26);
}
@end
