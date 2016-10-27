//
//  BuyIntrTabCell.m
//  JCDK
//
//  Created by 张科 on 2016/10/21.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BuyIntrTabCell.h"

@implementation BuyIntrTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setIntr:(IntroduceModel *)intr
{
    _intr = intr;
    _zjName.text = intr.user_nicename;
    if ([intr.Level integerValue] == 0)
    {
        _type.text = @"初级专家";
    }
    if ([intr.Level integerValue] == 1)
    {
        _type.text = @"中级专家";
    }
    if ([intr.Level integerValue] == 2)
    {
        _type.text = @"高级专家";
    }
    _vs.text = [NSString stringWithFormat:@"%@   VS   %@", intr.H_name,intr.A_name];
    _content.text = [NSString stringWithFormat:@"推荐:%@ %@", intr.O_name,intr.Odds];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
