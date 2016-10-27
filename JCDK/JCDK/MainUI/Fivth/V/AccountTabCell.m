//
//  AccountTabCell.m
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "AccountTabCell.h"

@implementation AccountTabCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    _button.layer.cornerRadius = 3.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
