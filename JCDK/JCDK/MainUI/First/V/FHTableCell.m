//
//  FHTableCell.m
//  JCDK
//
//  Created by 张科 on 16/8/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FHTableCell.h"

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

@end
