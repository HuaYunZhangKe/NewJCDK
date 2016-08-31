//
//  EnterView.m
//  JCDK
//
//  Created by 张科 on 16/8/31.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "EnterView.h"
@interface EnterView()<UITextFieldDelegate>

@end
@implementation EnterView

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backView];
    [self.backView addSubview:self.imageView];
    [self.backView addSubview:self.textField];
    [self.backView addSubview:self.placeHoder];
}
- (instancetype)init
{
    self = [super init];
    if (self)
    {

    }
    return self;
}
- (UIView *)backView
{
    if (!_backView)
    {
        NSLog(@"%f, %f", self.width,self.height);
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0
                                                             , 0, JCDK_Screen_WIDTH - 16 * 2, 44)];
        _backView.layer.cornerRadius = self.height / 2.0;
        _backView.backgroundColor =kHexColor(0x171a1a);
    }
    return _backView;
}
- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.height / 2.0, 8, 24 / 1.7, 45 / 1.7 )];
        _imageView.centerY = self.backView.centerY;
    }
    return _imageView;
}
- (ZKTextField *)textField
{
    if (!_textField)
    {
        _textField = [[ZKTextField alloc] initWithFrame:CGRectMake(self.imageView.right + 10, 0, self.width - self.height - 5, self.height)];
        _textField.font = [UIFont systemFontOfSize:13.0];
//        _textField.backgroundColor = [UIColor redColor];
        _textField.textColor = kWhiteColor1;
        _textField.delegate = self;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector (textFieldChange:) name:UITextFieldTextDidChangeNotification object:_textField];
    }
    return _textField;
}
- (void)textFieldChange:(NSNotification *)noti
{
    UITextField *textf = noti.object;
    if (textf.text.length == 0)
    {
        self.placeHoder.hidden = NO;
    }
    else
    {
        self.placeHoder.hidden = YES;

    }
}

- (UILabel *)placeHoder
{
    if (!_placeHoder)
    {
        _placeHoder = [[UILabel alloc] initWithFrame:CGRectMake(self.imageView.right + 10, 0, self.width - self.height - 5, self.height)];
        _placeHoder.enabled = NO;
        _placeHoder.font = [UIFont systemFontOfSize:13.0];
        _placeHoder.textColor = kWhiteColor1;
    }
    return _placeHoder;
}

- (void)setImageStr:(NSString *)imageStr
{
    self.imageView.image = [UIImage imageNamed:imageStr];
}
- (void)setPlaceStr:(NSString *)placeStr
{
    self.placeHoder.text = placeStr;
}
@end
