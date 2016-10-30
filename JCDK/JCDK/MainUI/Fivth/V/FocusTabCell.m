//
//  FocusTabCell.m
//  JCDK
//
//  Created by 张科 on 2016/10/28.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FocusTabCell.h"

@implementation FocusTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setNews:(NewsModel *)news
{
    _name2.text = news.title;
    _content2.text = news.content;
    [_time2 setTitle:news.push_time forState:UIControlStateNormal];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
