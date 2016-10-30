//
//  TouZhuTabCell.m
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "TouZhuTabCell.h"

@implementation TouZhuTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}
- (void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    NSDictionary *sDic = [NSDictionary dictionaryWithDictionary:_dic[@"oddslist"][0]];
    TZmodel *zt = [[TZmodel alloc] initWithDictionary:sDic];
    _label1_1.text = [NSString stringWithFormat:@"%@@%@",[zt.match[0] objectForKey:@"title"],[zt.match[0] objectForKey:@"odds"]];
    _label2_1.text = [NSString stringWithFormat:@"%@  VS  %@ %@",[zt.match[0] objectForKey:@"h_name"],[zt.match[0] objectForKey:@"a_name"],self.dic[@"date"]];
    _label3_1.text = [NSString stringWithFormat:@"投注 :%@", zt.totalprice];
    _label3_2.text = [NSString stringWithFormat:@"预计返还:%@",zt.expect];
    _label4_1.text = [NSString stringWithFormat:@"订单号:%@",zt.orderid];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
