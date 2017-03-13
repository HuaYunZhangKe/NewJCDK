//
//  IntrotableCell.m
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "IntrotableCell.h"
#import <UIImageView+WebCache.h>
@implementation IntrotableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setIntr:(IntroModel *)intr
{
    _intr = intr;
    [_pic sd_setImageWithURL:[NSURL URLWithString:intr.avatar]];
    _bisaiN.text = [NSString stringWithFormat:@"%@",intr.league];
    _timeLabel.text = [NSString stringWithFormat:@"%@ %@",intr.mdate ,intr.mtime];
    _titleLabel.text  = [NSString stringWithFormat:@"%@",intr.user_nickname];
    _userL.text = [NSString stringWithFormat:@"%@",intr.expert_level];
    _BIL.text = [NSString stringWithFormat:@"%@ vs %@",intr.hteam,intr.ateam];
    _money.text = [NSString stringWithFormat:@"%@ 咖币",intr.price];
    _des.text = [NSString stringWithFormat:@"%@",intr.title];
    _ago.text = [NSString stringWithFormat:@"%@",intr.publish_time];


    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
