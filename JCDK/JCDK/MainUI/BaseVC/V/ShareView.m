//
//  ShareView.m
//  IKE
//
//  Created by 张科 on 2016/10/16.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ShareView.h"
#import "UUtils.h"
#import "ShareCollectionCell.h"
@interface ShareView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, retain)NSArray *shareArr;
@end
@implementation ShareView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.shareArr = @[@{@"pic":@"FriendsCircle",@"title":@"朋友圈",@"platformType":@"1"},
                          @{@"pic":@"wechat",@"title":@"微信好友",@"platformType":@"2"},
                          @{@"pic":@"QQ",@"title":@"QQ",@"platformType":@"3"},
                          @{@"pic":@"sina",@"title":@"新浪微博",@"platformType":@"4"}];
        [self addSubview:self.backView];
        [self addSubview:self.sView];
        [self.sView addSubview:self.titleLabel];
        [self.sView addSubview:self.collectionView];
        [self.sView addSubview:self.cancelBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backView.frame = self.bounds;
    self.sView.frame = CGRectMake(0, self.height, self.width, 566 * k_Unit);
    self.titleLabel.frame = CGRectMake(0, 54 * k_Unit, self.width, 39 * k_Unit);
    self.collectionView.frame = CGRectMake(0, self.titleLabel.bottom + 80 * k_Unit, self.width, 180 * k_Unit);
    self.cancelBtn.frame = CGRectMake(0, self.sView.height - 100 * k_Unit, self.width, 100 * k_Unit);
    self.buttonLine.frame = CGRectMake(0, 0, self.cancelBtn.width, 1);
    [self show];
    
}
- (void)show
{
    self.backView.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 0.6;
        self.sView.frame = CGRectMake(0, self.height - 566 * k_Unit, self.width, 566 * k_Unit);

    }];
}
- (void)dismiss
{
    self.backView.alpha = 0.6;
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 0.0;
        self.sView.frame = CGRectMake(0, self.height , self.width, 566 * k_Unit);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (UIView *)backView
{
    if (!_backView)
    {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_backView addGestureRecognizer:tap];
    }
    return _backView;
}
- (UIView *)sView
{
    if (!_sView)
    {
        _sView = [UIView new];
        _sView.backgroundColor = kHexColor(0xf4f5f6);
    }
    return _sView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = kBlackColor;
        _titleLabel.font = kFont(38 * k_Unit);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"分享";
    }
    return _titleLabel;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = kHexColor(0xf4f5f6);
        [_collectionView registerClass:[ShareCollectionCell class] forCellWithReuseIdentifier:@"share"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(JCDK_Screen_WIDTH / 4.0, 180 * k_Unit);
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _flowLayout;
}
- (UIButton *)cancelBtn
{
    if (!_cancelBtn)
    {
        _cancelBtn = [UUtils quickButtonSuper:nil Frame:CGRectZero Target:self Sel:@selector(cancelBtnCLick:)];
        _cancelBtn.titleLabel.font = kFont(32 * k_Unit);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
        _buttonLine = [UIView new];
        _buttonLine.backgroundColor = kHexColor(0xc5c5c5);
        [_cancelBtn addSubview:_buttonLine];
    }
    return _cancelBtn;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shareArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShareCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"share" forIndexPath:indexPath];
    cell.dic = self.shareArr[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_shareTypeBlock)
    {
        
        NSString *str = self.shareArr[indexPath.item][@"platformType"];
        _shareTypeBlock(str);
    }
}
- (void)cancelBtnCLick:(UIButton *)button
{
    [self dismiss];
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [self dismiss];

}
@end
