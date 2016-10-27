//
//  MyIntrTabCell.m
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MyIntrTabCell.h"

@implementation MyIntrTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setIntr:(MyIntroModel *)intr
{
    _bSaiLabel.text = intr.League_name;
    _vs.text = [NSString stringWithFormat:@"%@  vs  %@",intr.H_name,intr.A_name];
    _allTIme.text = intr.post_modified;
    _time1.text = intr.Mdate;
    _time2.text = intr.Mtime;
    if ([intr.Bet integerValue] == 5)
    {
        _type.text = [NSString stringWithFormat:@"推荐类型:竞彩"];

    } else if ([intr.Bet integerValue] ==6)
    {
        _type.text = [NSString stringWithFormat:@"推荐类型:亚盘"];

    }
    else
    {
        _type.text = [NSString stringWithFormat:@"推荐类型:进球数"];

    }
    _buyCount.text = [NSString stringWithFormat:@"购买人数:%@",intr.Betnum];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
