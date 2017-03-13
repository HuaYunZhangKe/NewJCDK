//
//  NewsListTabCell.m
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "NewsListTabCell.h"

@implementation NewsListTabCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    [super awakeFromNib];
    // Initialization code
}
- (void)setNews:(NewsModel *)news
{
    _titleLabel.text = news.title;
    _contentLabel.text = news.content;
    _timeLabel.text = news.push_time ;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
