//
//  DateView.m
//  JCDK
//
//  Created by 张科 on 16/9/6.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "DateView.h"

@implementation DateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setDateString:(NSString *)dateString
{
    self.label.text = dateString;
    [self.label sizeToFit];
    self.label.center = CGPointMake(self.width / 2.0, self.height / 2.0 );
    [self addSubview:self.label];
    [self addSubview:self.imageView];
    [self addSubview:self.button];
}
- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] init];
        _label.textColor = kWhiteColor1;
        _label.font = [UIFont systemFontOfSize:11];
    }
    return _label;
}
- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.label.right + 3, 0, 8, 12)];
        _imageView.image = [UIImage imageNamed:@"ture.png"];
        _imageView.centerY = self.label.centerY;
        _imageView.hidden = YES;
    }
    return _imageView;
}
- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = self.bounds;
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
     }
    return _button;
}

- (void)buttonClick:(UIButton *)button
{
    if (_buttonBlock)
    {
        _buttonBlock(button.tag);
    }
}
@end
