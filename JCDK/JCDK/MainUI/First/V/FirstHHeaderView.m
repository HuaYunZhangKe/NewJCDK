//
//  FirstHHeaderView.m
//  JCDK
//
//  Created by 张科 on 16/8/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FirstHHeaderView.h"

@implementation FirstHHeaderView

- (void)awakeFromNib
{
    
}

- (void)setHeaderView
{
    [self setBHView];
    [self settingbgView];
    NSArray *array = @[self.footView,self.baseketBallView,self.introduView,self.helpView];
    for (int i = 0; i < array.count; i ++)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [array[i] addGestureRecognizer:tap];
    }
    
}

- (void)setBHView
{
    //开源轮播
    NSArray* urlsArray = @[
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646722_1456498424671_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646649_1456498410838_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646706_1456498430419_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646723_1456498427059_800x600.jpg",
                           @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646705_1456498422529_800x600.jpg"
                           ];
    // Do any additional setup after loading the view.
    BHInfiniteScrollView* infinitePageView1 = [BHInfiniteScrollView
                                               infiniteScrollViewWithFrame:self.adView.frame Delegate:self ImagesArray:urlsArray];
    infinitePageView1.dotSize = 10;
    infinitePageView1.pageControlAlignmentOffset = CGSizeMake(0, 20);
    infinitePageView1.titleView.textColor = [UIColor whiteColor];
    infinitePageView1.titleView.margin = 30;
    infinitePageView1.titleView.hidden = YES;
    infinitePageView1.scrollTimeInterval = 10;
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
