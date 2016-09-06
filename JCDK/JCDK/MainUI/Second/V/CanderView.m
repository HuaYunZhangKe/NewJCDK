//
//  CanderView.m
//  JCDK
//
//  Created by 张科 on 16/9/6.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "CanderView.h"
#import "DateView.h"
@interface CanderView()
@property (nonatomic, retain)CASpringAnimation *showSpring;
@property (nonatomic, retain)CASpringAnimation *dismissSpring;
@property (nonatomic, retain)DateView *currentDView;
@end
@implementation CanderView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.backView];
        [self addSubview:self.canderV];
    }
    return self;
}
- (void)show
{
    if (_dismissSpring)
    {
        [self.canderV.layer removeAnimationForKey:self.dismissSpring.keyPath];
    }
    [self.canderV.layer addAnimation:self.showSpring forKey:self.showSpring.keyPath];
    self.backView.alpha = 0.2;
    [UIView animateWithDuration:self.showSpring.duration animations:^{
        self.backView.alpha = 0.7;
    }];
}
- (void)dismiss
{
    if (_showSpring)
    {
        [self.canderV.layer removeAnimationForKey:self.showSpring.keyPath];
    }
    [self.canderV.layer addAnimation:self.dismissSpring forKey:self.dismissSpring.keyPath];
    self.backView.alpha = 0.7;
    [UIView animateWithDuration:self.dismissSpring.duration animations:^{
        self.backView.alpha = 0.0;
    }];
}
- (UIView *)backView
{
    if (!_backView)
    {
        _backView = [[UIView alloc] initWithFrame:self.bounds];
        _backView.backgroundColor = [UIColor blackColor];
    }
    return _backView;
}
- (UIView *)canderV
{
    if (!_canderV)
    {
        _canderV = [[UIView alloc] initWithFrame:self.bounds];
        _canderV.backgroundColor = [UIColor clearColor];
    }
    return _canderV;
}
- (CASpringAnimation *)showSpring
{

    if (!_showSpring)
    {
        _showSpring = [CASpringAnimation animationWithKeyPath:@"position.y"];
        _showSpring.damping = 5.5;
        _showSpring.stiffness = 100;
        _showSpring.mass = 0.18;
        _showSpring.initialVelocity = 0;
        _showSpring.fromValue = [NSNumber numberWithFloat:self.canderV.layer.position.y + self.canderV.height] ;
        _showSpring.toValue = [NSNumber numberWithFloat:self.canderV.layer.position.y] ;
        _showSpring.duration = _showSpring.settlingDuration;
        _showSpring.fillMode = kCAFillModeForwards;
        _showSpring.removedOnCompletion = NO;
    }
    return _showSpring;
}
- (CASpringAnimation *)dismissSpring
{
    if (!_dismissSpring)
    {
        _dismissSpring = [CASpringAnimation animationWithKeyPath:@"position.y"];
        _dismissSpring.damping = 6;
        _dismissSpring.stiffness = 100;
        _dismissSpring.mass = 0.18;
        _dismissSpring.initialVelocity = 0;
        _dismissSpring.fromValue = [NSNumber numberWithFloat:self.canderV.layer.position.y ] ;
        _dismissSpring.toValue = [NSNumber numberWithFloat:self.canderV.layer.position.y  + self.canderV.height] ;
        _dismissSpring.duration = _dismissSpring.settlingDuration;
        _dismissSpring.fillMode = kCAFillModeForwards;
        _dismissSpring.removedOnCompletion = NO;
        _dismissSpring.delegate = self;

    }
    return _dismissSpring;
}
- (void)setDateArr:(NSArray *)dateArr
{

    CGFloat bottom = 0;
    CGFloat labelX = 0;
    for (int i = 0; i < dateArr.count; i ++)
    {
       DateView   *dView = [[DateView alloc] initWithFrame:CGRectMake(0, 100 + 43 * i, self.width, 43)];
        if (i == 0)
        {
            self.currentDView = dView;
        }
        if (i == dateArr.count - 1)
        {
            bottom = dView.bottom;
            labelX = dView.centerX;
        }
        dView.button.tag = i;
        dView.tag = i + 300;
        dView.buttonBlock = ^(NSInteger index)
        {
            self.currentDView.label.textColor = kWhiteColor1;
            self.currentDView.imageView.hidden = YES;
            dView.label.textColor = kYellowColor;
            dView.imageView.hidden = NO;
            self.currentDView = dView;
            if (_dateButtonBlock)
            {
                [self dismiss];
                _dateButtonBlock(index);
            }
        };
        dView.dateString = dateArr[i];
        [self.canderV addSubview:dView];
    }
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBtn.frame = CGRectMake(0, bottom + 57, 30, 30);
    [cancleBtn addTarget:self action:@selector(cancleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancleBtn setImage:[UIImage imageNamed:@"wrongf_out.png"] forState:UIControlStateNormal];
    cancleBtn.centerX = labelX;
    [self.canderV addSubview:cancleBtn];
}
- (void)setIndex:(NSInteger)index
{
    self.currentDView.label.textColor = kWhiteColor1;
    self.currentDView.imageView.hidden = YES;
    DateView *dView = (DateView  *)[self.canderV viewWithTag:(index+300)];
    dView.label.textColor = kYellowColor;
    dView.imageView.hidden = NO;
    self.currentDView = dView;

    
}
- (void)cancleBtnClick:(UIButton *)button
{
    [self dismiss];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperview];
}

@end
