//
//  MycollectionCell.m
//  JCDK
//
//  Created by 魏秀红 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MycollectionCell.h"

@implementation MycollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCollect:(CollectionModel *)collect
{
    _titleLabel.text = collect.Title;
    _timeLabel.text = collect.Createtime;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
