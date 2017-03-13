//
//  BiFenTabCell.m
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BiFenTabCell.h"
#import "UIColor+YYAdd.h"
@implementation BiFenTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setB:(BiFenListModel *)b
{
    _b = b;
    
    if ([b.is_follow integerValue] == 0)
    {
        [self.likeBtn setBackgroundImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.likeBtn setBackgroundImage:[UIImage imageNamed:@"collect_on.png"] forState:UIControlStateNormal];
    }
    self.dateLabel0.text = [NSString stringWithFormat:@"%@",b.jingcai];
    NSString *name0 = [NSString stringWithFormat:@"%@ %@",b.league,b.time];
    NSRange range = [name0 rangeOfString:b.league];
    NSMutableAttributedString *attiString = [[NSMutableAttributedString alloc] initWithString:name0 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:kWhiteColor2}];
    
    [attiString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:b.color] range:range];
    self.name0.attributedText = attiString;
    NSString *h_des = [NSString stringWithFormat:@"%@ %@ [%@]",b.h_yellow, b.h_red,b.h_rank];
    NSMutableAttributedString *attiString1 = [[NSMutableAttributedString alloc] initWithString:h_des attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:kWhiteColor2}];
    NSRange range1 = [h_des rangeOfString:b.h_yellow];
    NSRange range11 = [h_des rangeOfString:b.h_red];

    [attiString1 addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range1];
    [attiString1 addAttribute:NSForegroundColorAttributeName value:kRedColor range:range11];
    self.line2Label.attributedText = attiString1;
    self.h_name.text = b.h_name;
    if ([self.type isEqualToString:@"instant"] || [self.type isEqualToString:@"next"])
    {
        self.VS.text = @"vs";
    }
    else
    {
        NSString *bifen = [NSString stringWithFormat:@"(%@)\n%@",b.h_half,b.h_score];
        NSMutableAttributedString *attiString2 = [[NSMutableAttributedString alloc] initWithString:bifen attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:kWhiteColor2}];
        NSRange range2 = [bifen rangeOfString:b.h_score];
        [attiString2 addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:kGreenColor} range:range2];
        self.VS.attributedText = attiString2;

    }
    self.a_name.text = [NSString stringWithFormat:@"%@",b.a_name];
    NSString *a_des = [NSString stringWithFormat:@"[%@] %@ %@ ",b.h_rank, b.h_red,b.h_yellow];
    NSMutableAttributedString *attiString3 = [[NSMutableAttributedString alloc] initWithString:a_des attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:kWhiteColor2}];
    NSRange range3 = [a_des rangeOfString:b.h_yellow];
    NSRange range31 = [a_des rangeOfString:b.h_red];
    
    [attiString3 addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range3];
    [attiString3 addAttribute:NSForegroundColorAttributeName value:kRedColor range:range31];
    self.a_des.attributedText = attiString3;
    self.line3.text = [NSString stringWithFormat:@"%@ %@ %@",b.d1, b.d2, b.d3];
    self.line31.text = [NSString stringWithFormat:@"%@ %@ %@",b.d4, b.d5, b.d6];
    self.com.text = [NSString stringWithFormat:@"%@ 评",b.comments];

  
}
- (IBAction)index1Btn:(UIButton *)sender
{
    if (sender.tag == 201)
    {
        
    }
    if (sender.tag == 202)
    {
        
    }
    if (sender.tag == 203)
    {
        
    }
    if (_button1Block)
    {
        _button1Block(sender.tag - 200);
    }

}
@end
