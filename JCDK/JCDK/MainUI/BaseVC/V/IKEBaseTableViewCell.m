//
//  IKETableViewCell.m
//  IKE
//
//  Created by 张科 on 16/9/8.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "IKEBaseTableViewCell.h"

@implementation IKEBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
