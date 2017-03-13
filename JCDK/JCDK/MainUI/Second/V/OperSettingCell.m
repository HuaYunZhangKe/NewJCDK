//
//  OperSettingCell.m
//  JCDK
//
//  Created by 张科 on 2017/3/6.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "OperSettingCell.h"

@implementation OperSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
