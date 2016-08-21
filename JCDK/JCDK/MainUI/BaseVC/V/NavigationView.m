//
//  NavigationView.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView


- (void)awakeFromNib
{
    
}
- (void)setNib0
{
    
}
- (void)setNib1
{
    _headImgView.layer.cornerRadius = 12.5;
}
- (void)setNib2
{
    _headImgView2.layer.cornerRadius = 12.5;
    _introBtn.layer.cornerRadius = 14.0;
    _introBtn.backgroundColor = [UIColor blackColor];
    _zixunBtn.layer.cornerRadius = 14.0;
    _zixunBtn.backgroundColor = kAppColor;
}
- (void)setNib3
{
    
}
#pragma mark - IBAction
//index0
- (IBAction)left0BtnClick:(id)sender
{
    if (_buttonBlock0)
    {
        _buttonBlock0(1);
    }
}
- (IBAction)right0BtnClick:(id)sender
{
    if (_buttonBlock0)
    {
        _buttonBlock0(2);
    }

}

//index1
- (IBAction)left1BtnClick:(id)sender
{
    if (_buttonBlock1)
    {
        _buttonBlock1(1);
    }

}
- (IBAction)right1_1BtnClick:(id)sender
{
    if (_buttonBlock1)
    {
        _buttonBlock1(2);
    }

}
- (IBAction)lright1_2BtnClick:(id)sender
{
    if (_buttonBlock1)
    {
        _buttonBlock1(3);
    }

}
//index2
- (IBAction)introBtnAction:(UIButton *)sender
{
    //比赛推荐按钮
    _introBtn.backgroundColor = [UIColor blackColor];
    _zixunBtn.backgroundColor = kAppColor;
    if (_buttonBlock2)
    {
        _buttonBlock2(2);
    }
}
- (IBAction)ziXunAction:(UIButton *)sender
{
    //资讯按钮
    _introBtn.backgroundColor = kAppColor;
    _zixunBtn.backgroundColor = [UIColor blackColor] ;
    if (_buttonBlock2)
    {
        _buttonBlock2(3);
 
    }
    
}
- (IBAction)rightBtn2_1Click:(UIButton *)sender
{
    //右1按钮
    if (_buttonBlock2)
    {
        _buttonBlock2(5);
        
    }

}
- (IBAction)rightBtn2_2Click:(UIButton *)sender
{
    //右2按钮
    if (_buttonBlock2)
    {
        _buttonBlock2(4);
        
    }

}
- (IBAction)left2Click:(UIButton *)sender
{
    //左按钮
    if (_buttonBlock2)
    {
        _buttonBlock2(1);
        
    }
}
@end
