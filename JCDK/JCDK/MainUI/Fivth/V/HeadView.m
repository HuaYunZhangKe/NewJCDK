//
//  HeadView.m
//  JCDK
//
//  Created by 李锐 on 16/8/26.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.name = [[JCDKBaseLabel alloc] init];
        [self addSubview:_name];
        self.vsLabel = [JCDKBaseLabel new];
        [self addSubview:_vsLabel];
        self.arrow = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_arrow];
        [_arrow setImage:[UIImage imageNamed:@"tubiao_top"] forState:UIControlStateNormal];
        [_arrow setImage:[UIImage imageNamed:@"jiantou_bottom"] forState:UIControlStateSelected];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.font = [UIFont systemFontOfSize:15];
        _vsLabel.font = [UIFont systemFontOfSize:15];

        _name.frame = CGRectMake(0, 0, self.size.width /3, self.size.height);
        _vsLabel.frame = CGRectMake(_name.right, 0, _name.width, _name.height);
        _arrow.frame = CGRectMake(self.right - 23 , self.center.y, 23, 12);
    }
    return self;
}
@end
