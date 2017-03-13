//
//  FHTableCell.m
//  JCDK
//
//  Created by 张科 on 16/8/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FHTableCell.h"
#import "UIImageView+WebCache.h"
@implementation FHTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _headPic.contentMode = UIViewContentModeScaleAspectFill;
    _headPic.clipsToBounds = YES;
    self.zhibBtno.layer.cornerRadius = 3;
    self.jiepanBtn.layer.cornerRadius = 3;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMacth:(Matchs *)macth
{

    self.label4_1.text = [NSString stringWithFormat:@"%@   %@",macth.league_name,macth.num];
    self.label4_2.text = [NSString stringWithFormat:@"%@vs%@",macth.hometeam,macth.visitingteam ];
    self.label4_3.text = [NSString stringWithFormat:@"%@ 推荐",macth.betnum];
    
}
- (void)setPost:(Posts *)post
{
    [self.headPic sd_setImageWithURL:[NSURL URLWithString:post.img] placeholderImage:kPlaceHoderImage];
//    self.zan.text = post.post_like;
//    self.commit.text = post.comment_count;
    self.titleLabel.text = post.title;
    self.subTitle.text = post.content;
    NSString *String = [NSString stringWithFormat:@"%@%@",@"发布日期",post.pubtime];
    NSRange range1 = [String rangeOfString:@"发布日期"];
    NSRange range2 = [String rangeOfString:post.pubtime];

    NSMutableAttributedString *attiString = [[NSMutableAttributedString alloc] initWithString:String attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:kWhiteColor2}];
    [attiString addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range1];
    [attiString addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range2];
    self.fromLabel.attributedText = attiString;
}
@end
