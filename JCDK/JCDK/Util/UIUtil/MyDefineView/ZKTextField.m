//
//  ZKTextField.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ZKTextField.h"

@implementation ZKTextField


- (void)awakeFromNib
{
    self.inputAccessoryView = self.toolBar;
}
- (ToolBarView *)toolBar
{
    WeakSelf(weak_self);
    if (!_toolBar)
    {
        _toolBar = [[[NSBundle mainBundle] loadNibNamed:@"ToolBarView" owner:self options:nil] objectAtIndex:0];
        _toolBar.frame = CGRectMake(0, 0,JCDK_Screen_WIDTH ,45);
        _toolBar.finishBlock = ^
        {
            [weak_self endEditing:YES];
        };
    }
    return _toolBar;
}

@end
