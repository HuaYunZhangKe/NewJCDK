//
//  FHIntroduceTabCell.m
//  JCDK
//
//  Created by 张科 on 16/8/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FHIntroduceTabCell.h"
#import "FHIntroduceColletionCell.h"

@interface FHIntroduceTabCell ()<UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, retain)UIView *lineView;
@property (nonatomic, retain)UIButton *hotBtn;//热门
@property (nonatomic, retain)UIButton *redManBtn;//红人
@property (nonatomic, retain)UIButton *attiBtn;//关注
@property (nonatomic, retain)UIButton *currentBtn;
@property (nonatomic, assign)CGFloat cheight;//collection height
@property (nonatomic, retain)NSArray *currentArr;
@end
static NSString *indef =@"cIntroduce";

@implementation FHIntroduceTabCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView addSubview:self.topView];
        UIView *lView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, JCDK_Screen_WIDTH, 1)];
        lView.backgroundColor = [UIColor colorWithRGB:0x171a1a];
        [self addSubview:lView];
        
        [self.contentView addSubview:self.bottonView];
           }
    return self;
}
- (UIView *)topView
{
    if (!_topView)
    {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 40)];
        _topView.backgroundColor = [UIColor colorWithRGB:0x202828];
        _headTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 60, 40)];
        _headTitleLabel.text = @"专家推荐";
        _headTitleLabel.font = [UIFont systemFontOfSize:13.0];
        _headTitleLabel.textColor = kWhiteColor1;
        [_topView addSubview:_headTitleLabel];
        
        UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(JCDK_Screen_WIDTH - 180 - 16, 0, 180, 40)];
        [_topView addSubview:selectView];
        _hotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _hotBtn.frame = CGRectMake(0, 0, 60, 40);
        [_hotBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        _hotBtn.tag = 11;
        [_hotBtn setTitle:@"热门推荐" forState:UIControlStateNormal];
        _hotBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_hotBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        _currentBtn = _hotBtn;
        [selectView addSubview:_hotBtn];
        
        _redManBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _redManBtn.frame = CGRectMake(60, 0, 60, 40);
        [_redManBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        _redManBtn.tag = 12;
        [_redManBtn setTitle:@"红人达人" forState:UIControlStateNormal];
        _redManBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_redManBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [selectView addSubview:_redManBtn];
        
        _attiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _attiBtn.frame = CGRectMake(120, 0, 60, 40);
        _attiBtn.tag = 13;
        [_attiBtn setTitle:@"我的关注" forState:UIControlStateNormal];
        _attiBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_attiBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_attiBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [selectView addSubview:_attiBtn];
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 30, 20, 2)];
        _lineView.backgroundColor = kYellowColor;
        [selectView addSubview:_lineView];
    }
    return _topView;
}

- (UIView *)bottonView
{
    if (!_bottonView)
    {
        _bottonView = [UIView new];
        _bottonView.backgroundColor = [UIColor colorWithRGB:0x202828];
    }
    return _bottonView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
//        flowlayout.itemSize = CGSizeMake(JCDK_Screen_WIDTH / 4.0, 65);
//        flowlayout.minimumLineSpacing = 1;
//        flowlayout.minimumInteritemSpacing = 1;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 12,JCDK_Screen_WIDTH , self.cheight) collectionViewLayout:flowlayout];
        _collectionView.backgroundColor = [UIColor colorWithRGB:0x202828];
        [self.collectionView registerNib:[UINib nibWithNibName:@"FHIntroduceColletionCell" bundle:nil] forCellWithReuseIdentifier:indef];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}
- (void)btnAction:(UIButton *)button
{
     if (button.tag == 11)
    {
        [_hotBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_redManBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_attiBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_collectionView setContentOffset:CGPointMake(0, 0) animated:YES];

    }
    if (button.tag == 12)
    {
        [_redManBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_hotBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_attiBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_collectionView setContentOffset:CGPointMake(JCDK_Screen_WIDTH, 0) animated:YES];


    }
    if (button.tag == 13)
    {
        [_attiBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_hotBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_redManBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_collectionView setContentOffset:CGPointMake(JCDK_Screen_WIDTH * 2, 0) animated:YES];

    }

}
- (void)setShowDic:(NSMutableDictionary *)showDic
{
    _showDic = showDic;
    self.bottonView.frame = CGRectMake(0, 41, JCDK_Screen_WIDTH, 154);
    _cheight = 130;
    [self.contentView addSubview:self.bottonView];
    [self.bottonView addSubview:self.collectionView];
    [self.collectionView reloadData];
}
- (void)setContentWithArray:(NSArray *)array
{
    self.currentArr = [NSArray arrayWithArray:array];
    if (array.count <= 3 )
    {
        self.bottonView.frame = CGRectMake(0, 41, JCDK_Screen_WIDTH, 89);
        _cheight = 65;
    }
    else
    {
        self.bottonView.frame = CGRectMake(0, 41, JCDK_Screen_WIDTH, 154);
        _cheight = 130;
    }
    [self.contentView addSubview:self.bottonView];
    [self.bottonView addSubview:self.collectionView];
}

#pragma mark - collection datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

        return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FHIntroduceColletionCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:indef forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        NSMutableArray *tjArr = [self.showDic objectForKey:@"tj"];

        if (indexPath.row == 7)
        {
            item.name.text = @"更多";
            item.pic.image = [UIImage imageNamed:@"index_more.png"];
        }
        else
        {
            item.user = tjArr[indexPath.row];
        }
    }
    else if (indexPath.section == 1)
    {
        NSMutableArray *tjArr = [self.showDic objectForKey:@"hr"];
        
        if (indexPath.row == 7)
        {
            item.name.text = @"更多";
            item.pic.image = [UIImage imageNamed:@"index_more.png"];

        }
        else
        {
            item.user = tjArr[indexPath.row];
        }

    }
    else
    {
        NSMutableArray *tjArr = [self.showDic objectForKey:@"gz"];
        
        if (indexPath.row == 7)
        {
            item.name.text = @"更多";
            item.pic.image = [UIImage imageNamed:@"index_more.png"];
        }
        else
        {
            item.user = tjArr[indexPath.row];
        }

    }
    return item;
//    if (self.currentArr.count >= 7)
//    {
//        if (indexPath.row < 7)
//        {
//            item.name.text = self.currentArr[indexPath.row];
//        }
//        else
//        {
//            item.name.text = @"更多";
// 
//        }
//        return item;
//
//    }
//    else
//    {
//        if (indexPath.row == self.currentArr.count)
//        {
//            item.name.text = @"更多";
//        }
//        else if(indexPath.row < self.currentArr.count)
//        {
//            item.name.text = self.currentArr[indexPath.row];
//
//        }
//        else
//        {
//            item.name.text  =@"";
//        }
//        return item;
//
//    }
  
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return  CGSizeMake(JCDK_Screen_WIDTH / 4.0 , 65);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_stringBlock)
    {
        Users *use;
        if (indexPath.section == 0)
        {
            NSMutableArray *tjArr1 = [self.showDic objectForKey:@"tj"];
            use = tjArr1[indexPath.row];

        }
        else if (indexPath.section == 1)
        {
            NSMutableArray *tjArr2 = [self.showDic objectForKey:@"hr"];
            use = tjArr2[indexPath.row];


        }
        else
        {
            NSMutableArray *tjArr3 = [self.showDic objectForKey:@"gz"];
            use = tjArr3[indexPath.row];


        }
        _stringBlock(use.uid);



    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offx = scrollView.contentOffset.x;
    NSLog(@"%f",offx);
    self.lineView.frame = CGRectMake(20 + 120 * offx / (2 *JCDK_Screen_WIDTH), 30, 20, 2);
    if (offx<JCDK_Screen_WIDTH * 0.5)
    {
        [_hotBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_redManBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_attiBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        
    }

    if (JCDK_Screen_WIDTH * 1.5 > offx && offx>JCDK_Screen_WIDTH * 0.5)
    {
        [_redManBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_hotBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_attiBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];

    }
     if (JCDK_Screen_WIDTH * 1.5 < offx)
    {
        [_attiBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [_hotBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [_redManBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    }
}
@end
