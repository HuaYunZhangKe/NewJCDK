//
//  JinqiTableViewCell.m
//  JCDK
//
//  Created by 李锐 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JinqiTableViewCell.h"

@implementation JinqiTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor = kHexColor(0x2A2E32);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.name = [[JCDKBaseLabel alloc] init];
        [self.contentView addSubview:_name];
        self.vsLabel = [JCDKBaseLabel new];
        [self.contentView addSubview:_vsLabel];
        self.arrow = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_arrow];
        [_arrow setImage:[UIImage imageNamed:@"tubiao_top"] forState:UIControlStateNormal];
        [_arrow setImage:[UIImage imageNamed:@"jiantou_bottom"] forState:UIControlStateSelected];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.font = [UIFont systemFontOfSize:15];
        _vsLabel.font = [UIFont systemFontOfSize:15];

        
    }
    return self;
}
- (void)setDic:(NSDictionary *)dic
{
    _dic = dic;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _name.frame = CGRectMake(0, 0, self.contentView.size.width /3, self.contentView.size.height);
    _name.text = self.dic[@"date"];
    NSDictionary *sDic = [NSDictionary dictionaryWithDictionary:self.dic[@"oddslist"][0]];
    TZmodel *zt = [[TZmodel alloc] initWithDictionary:sDic];
    
    _vsLabel.frame = CGRectMake(_name.right, 0, _name.width, _name.height);
    _vsLabel.text = [NSString stringWithFormat:@"%@  VS  %@",[zt.match[0] objectForKey:@"h_name"],[zt.match[0] objectForKey:@"a_name"] ];

    _arrow.frame = CGRectMake(self.contentView.right - 23 , self.contentView.center.y, 23, 12);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
