//
//  ShareCollectionCell.m
//  IKE
//
//  Created by 张科 on 2016/10/16.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ShareCollectionCell.h"

@implementation ShareCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.pic];
    }
    return self;
}
- (void)layoutSubviews
{
    _pic.frame = CGRectMake(0, 0, 120 * k_Unit, 120 * k_Unit);
    _pic.image = [UIImage imageNamed:self.dic[@"pic"]];
    _pic.centerX = self.contentView.width / 2.0;
    _titleLabel.frame = CGRectMake(0, self.pic.bottom + 16 * k_Unit, self.width, 25 * k_Unit);
    _titleLabel.text = self.dic[@"title"];
}
- (void )setDic:(NSDictionary *)dic
{
    _dic = dic;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = kBlackColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = kFont(24 * k_Unit);
    }
    return _titleLabel;
}

- (UIImageView *)pic
{
    if (!_pic)
    {
        _pic = [UIImageView new];
    }
    return _pic;
}
@end
