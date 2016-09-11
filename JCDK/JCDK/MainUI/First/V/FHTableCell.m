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

    self.zLabel.text = macth.hometeam;
    self.fLabel.text = macth.visitingteam;
    [self.fPic sd_setImageWithURL:[NSURL URLWithString:macth.visiting_pic] placeholderImage:kPlaceHoderImage];
    [self.zPic sd_setImageWithURL:[NSURL URLWithString:macth.home_pic] placeholderImage:kPlaceHoderImage];
    self.time.text =[NSString stringWithFormat:@"%@",macth.starttime] ;
    self.joinLabel.text = [NSString stringWithFormat:@"%@参与",macth.betnum];
}
- (void)setPost:(Posts *)post
{
    [self.headPic sd_setImageWithURL:[NSURL URLWithString:post.smeta] placeholderImage:kPlaceHoderImage];
    self.zan.text = post.post_like;
    self.commit.text = post.comment_count;
    self.titleLabel.text = post.post_title;
    self.subTitle.text = post.post_excerpt;
    NSString *String = [NSString stringWithFormat:@"%@来自%@",post.user_nicename,post.post_source];
    NSRange range1 = [String rangeOfString:post.user_nicename];
    NSRange range2 = [String rangeOfString:post.post_source];

    NSMutableAttributedString *attiString = [[NSMutableAttributedString alloc] initWithString:String attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:kWhiteColor2}];
    [attiString addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range1];
    [attiString addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range2];
    self.fromLabel.attributedText = attiString;
//    post_excerpt,文章摘要
//    user_nicename,作者
//    post_source,来源
//    b.post_modified,发布时间
//    smeta,文章图片
//    comment_count,评论数
//    post_like 点赞数

}
@end
