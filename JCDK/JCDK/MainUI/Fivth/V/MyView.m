//
//  MyView.m
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MyView.h"
#import <UIImageView+WebCache.h>
@interface MyView ()

@end
@implementation MyView


- (instancetype)initWithFrame:(CGRect)frame AndDIc:(NSDictionary *)dic
{
    self = [super initWithFrame:frame];
    if (self) {
        self.infodic = [NSDictionary dictionaryWithDictionary:dic];
        [self creatView];
    }
    return self;
}
//- (void)setInfodic:(NSDictionary *)infodic
//{
//    _nameLabel.text = self.infodic[@"user_nicename"];
//    _kabiCount.text = self.infodic[@"coin"];
//    _yinbiCount.text = self.infodic[@"balance"];
//  //
//
//
//
//}

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
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:self.infodic[@"avator"]] placeholderImage:kPlaceHoderImage];

    self.nameLabel = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(_headImg.right + 10, _headImg.top, self.frame.size.width, 15)];
    [headView addSubview:_nameLabel];
    _nameLabel.text = self.infodic[@"user_nicename"];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    UILabel *label = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(_nameLabel.left, _nameLabel.bottom +20,40, 13)];
    [headView addSubview:label];
    label.text = @"咖币";
    UIImageView *kImg =[[ UIImageView alloc] initWithFrame:CGRectMake(label.right, label.top, 13, 13)];
    [headView addSubview:kImg];
    kImg.image = [UIImage imageNamed:@"kabi"];
    label.font = [UIFont systemFontOfSize:15];

    
    self.kabiCount= [[ JCDKBaseLabel alloc] initWithFrame:CGRectMake(kImg.right +10, kImg.top, 100, kImg.height)];
    [headView addSubview:_kabiCount];
    _kabiCount.text = self.infodic[@"coin"];
    _kabiCount.font = [UIFont systemFontOfSize:15];

   UILabel *yin = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(_kabiCount.right + 10, _kabiCount.top, label.width, label.height)];
   
    [headView addSubview:yin];
    yin.text = @"银币";
    yin.font = [UIFont systemFontOfSize:15];

    UIImageView *yImg =[[ UIImageView alloc] initWithFrame:CGRectMake(yin.right, yin.top, 13, 13)];
    [headView addSubview:yImg];
    
    yImg.image = [UIImage imageNamed:@"yin"];
    self.yinbiCount = [[JCDKBaseLabel alloc] initWithFrame:CGRectMake(yImg.right + 10, yImg.top, 100, yImg.height)];
    [headView addSubview:_yinbiCount];
    _yinbiCount.text = self.infodic[@"balance"];
    _yinbiCount.font = [UIFont systemFontOfSize:15];

    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(label.left, label.bottom+ 10, 60, 20);
    [headView addSubview:_leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(yin.left, yin.bottom + 10, _leftBtn.width, _leftBtn.height);
    [headView addSubview:_rightBtn];

    [_rightBtn setTitle:@"充值+" forState:0];
    [_leftBtn setTitle:@"充值+" forState:0];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _leftBtn.backgroundColor = kHexColor(0xf2a327);
    _rightBtn.backgroundColor = kHexColor(0xf2a327);
    _rightBtn.layer.cornerRadius = 12;
    _leftBtn.layer.cornerRadius = 12;
    self.headViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.headViewBtn.frame = CGRectMake(0, 0, headView.width, headView.height - 30);
    self.headViewBtn.backgroundColor = [UIColor clearColor];
    [headView addSubview:self.headViewBtn];

}

@end
