//
//  MyView.m
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@end
@implementation MyView


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
    
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 100)];
    headView.backgroundColor = kHexColor(0x2a2e32);
    self.tableView.tableHeaderView = headView;
    
    self.headImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.left + 10, headView.top+ 10, 48, 48)];
    [headView addSubview:_headImg];
    _headImg.backgroundColor = [UIColor redColor];
    _headImg.layer.cornerRadius = 24;
    self.nameLabel = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(_headImg.right + 10, _headImg.top, self.frame.size.width, 15)];
    [headView addSubview:_nameLabel];
    _nameLabel.text = @"宝宝熊";
    
    UILabel *label = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(_nameLabel.left, _nameLabel.bottom +20,40, 13)];
    [headView addSubview:label];
    label.text = @"咖币";
    UIImageView *kImg =[[ UIImageView alloc] initWithFrame:CGRectMake(label.right, label.top, 13, 13)];
    [headView addSubview:kImg];
    kImg.image = [UIImage imageNamed:@"kabi"];

    
    self.kabiCount= [[ JCDKBaseLabel alloc] initWithFrame:CGRectMake(kImg.right +10, kImg.top, 100, kImg.height)];
    [headView addSubview:_kabiCount];
    _kabiCount.text = @"10000";
    
   UILabel *yin = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(_kabiCount.right + 10, _kabiCount.top, label.width, label.height)];
   
    [headView addSubview:yin];
    yin.text = @"银币";
    UIImageView *yImg =[[ UIImageView alloc] initWithFrame:CGRectMake(yin.right, yin.top, 13, 13)];
    [headView addSubview:yImg];
    
    yImg.image = [UIImage imageNamed:@"yin"];
    self.yinbiCount = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(yImg.right + 10, yImg.top, 100, yImg.height)];
    [headView addSubview:_yinbiCount];
    _yinbiCount.text = @"111";
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(label.left, label.bottom+ 10, 60, 20);
    [headView addSubview:_leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(yin.left, yin.bottom + 10, _leftBtn.width, _leftBtn.height);
    [headView addSubview:_rightBtn];

    [_rightBtn setTitle:@"充值+" forState:0];
    [_leftBtn setTitle:@"充值+" forState:0];

}

@end
