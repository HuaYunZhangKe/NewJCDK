//
//  ScoreFiterTabCell1.m
//  JCDK
//
//  Created by 张科 on 16/9/4.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ScoreFiterTabCell1.h"
#import "ScoreFitlerCollectionCell.h"
@implementation ScoreFiterTabCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = kHexColor(0x202828);
    }
    return self;
}
- (void)layoutSubviews
{
    
}
+ (CGFloat)cellHeightForArray:(NSArray *)array
{
    //计算cell高度，只有collectionView因此为collection高度
    NSInteger rowNumber = (((array.count -1)/ 3) +1);
    return rowNumber * 35 + (rowNumber - 1) * 10;
}
- (void)setShowArr:(NSArray *)showArr
{
    _showArr = showArr;
    //计算collectionVIew高度
    NSInteger rowNumber = (((showArr.count -1)/ 3) +1);
    self.collHeight = rowNumber * 35 + (rowNumber - 1) * 10;
    [self addSubview:self.collectionView];
}
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(16, 0, JCDK_Screen_WIDTH - 16 - 30, self.collHeight) collectionViewLayout:self.cflowLayout];
        [_collectionView registerNib:[UINib nibWithNibName:@"ScoreFitlerCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"fliterColl"];
        _collectionView.backgroundColor = kHexColor(0x202828);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)cflowLayout
{
    if (!_cflowLayout)
    {
        _cflowLayout = [[UICollectionViewFlowLayout alloc] init];
        _cflowLayout.itemSize = CGSizeMake((JCDK_Screen_WIDTH - 16 - 30 - 12 * 2) / 3.0, 35);
        _cflowLayout.minimumLineSpacing = 10;
        _cflowLayout.minimumInteritemSpacing = 12;
    }
    return _cflowLayout;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.showArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreFitlerCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fliterColl" forIndexPath:indexPath];
    return cell;
}
@end
