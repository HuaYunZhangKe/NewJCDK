//
//  BiFenTabCell.m
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BiFenTabCell.h"

@implementation BiFenTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
