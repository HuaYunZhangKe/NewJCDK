//
//  ToolBarView.m
//  youzhitou
//
//  Created by 张科 on 16/8/15.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ToolBarView.h"

@implementation ToolBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib
{
    
}
- (IBAction)finishBtnCLick:(id)sender {
    if (_finishBlock)
    {
        _finishBlock();
    }
}

@end
