//
//  InfoCell1.m
//  JCDK
//
//  Created by 张科 on 2016/10/18.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "InfoCell1.h"

@implementation InfoCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    self.currentBtn = self.woman;
    [self.man setBackgroundImage:[UIImage imageNamed:@"checkbox_no.png"] forState:UIControlStateNormal];
    [self.woman setBackgroundImage:[UIImage imageNamed:@"checkbox_seleted.png"] forState:UIControlStateNormal];
    _pic1.layer.cornerRadius = 50 / 2.0;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)setSex:(NSString *)sex
{
    if ([sex integerValue] == 1)
    {
        [self.man setBackgroundImage:[UIImage imageNamed:@"checkbox_no.png"] forState:UIControlStateNormal];
        [self.woman setBackgroundImage:[UIImage imageNamed:@"checkbox_seleted.png"] forState:UIControlStateNormal];

    }
    else
    {
        [self.man setBackgroundImage:[UIImage imageNamed:@"checkbox_seleted.png"] forState:UIControlStateNormal];
        [self.woman setBackgroundImage:[UIImage imageNamed:@"checkbox_no.png"] forState:UIControlStateNormal];

    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)buttonCLick:(UIButton *)sender {
    NSInteger check = self.tag - 10;
     [self.currentBtn setBackgroundImage:[UIImage imageNamed:@"checkbox_no.png"] forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"checkbox_seleted.png"] forState:UIControlStateNormal];
    self.currentBtn = sender;
    if (_buttonBlock)
    {
        _buttonBlock(check);
    }
}

@end
