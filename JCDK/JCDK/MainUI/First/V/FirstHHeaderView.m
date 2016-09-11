//
//  FirstHHeaderView.m
//  JCDK
//
//  Created by 张科 on 16/8/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FirstHHeaderView.h"
#import "Slides.h"
@implementation FirstHHeaderView

- (void)awakeFromNib
{
//    _adHeight.constant = JCDK_Screen_HEIGHT / 4.0;
    [self layoutIfNeeded];
}

- (void)setHeaderViewWithArray:(NSMutableArray *)array
{
    [self setBHViewWithArray:array];
    [self settingbgView];
    NSArray *vArray = @[self.footView,self.baseketBallView,self.introduView,self.helpView];
    for (int i = 0; i < vArray.count; i ++)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [vArray[i] addGestureRecognizer:tap];
    }
    
}

- (void)setBHViewWithArray:(NSMutableArray *)array
{
    //开源轮播
    NSMutableArray *tempArr = [NSMutableArray new];
    for (int i = 0; i < array.count ; i ++ )
    {
        Slides *slide = array[i];
        [tempArr addObject:slide.slide_pic];
    }
    NSArray* urlsArray = [NSArray arrayWithArray:tempArr];
    // Do any additional setup after loading the view.
    BHInfiniteScrollView* infinitePageView1 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, self.adView.height) Delegate:self ImagesArray:urlsArray];
    infinitePageView1.dotSize = 5;
    infinitePageView1.pageControlAlignmentOffset = CGSizeMake(0, 10);
//    infinitePageView1.titleView.textColor = [UIColor whiteColor];
//    infinitePageView1.titleView.margin = 30;
    infinitePageView1.scrollDirection  = BHInfiniteScrollViewScrollDirectionHorizontal;
    infinitePageView1.titleView.hidden = YES;
    infinitePageView1.scrollTimeInterval = 5;
    infinitePageView1.autoScrollToNextPage = YES;
    infinitePageView1.delegate = self;
    [self.adView addSubview:infinitePageView1];

}
- (void)settingbgView
{
    [self.bgView settingGBViewWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
}
- (void)tap:(UITapGestureRecognizer *)tap
{
    UIView *view = tap.view;
    //tag为1足球 2蓝球  3推荐 4帮助
    if (_middleTapBlock)
    {
        _middleTapBlock(view.tag);
    }
}
- (void)infiniteScrollView:(BHInfiniteScrollView *)infiniteScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (_topTapBlock)
    {
        _topTapBlock(index);
    }
    
}

@end
