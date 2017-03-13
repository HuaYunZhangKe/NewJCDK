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
    [super awakeFromNib];
    [self layoutIfNeeded];
    self.winArr = [NSMutableArray new];
    [self WinListRequestFromWeb];
}
#pragma mark - web service
- (void)WinListRequestFromWeb
{
    //    /index.php?g=app&m=user&a=login
    NSDictionary *paraDic = @{
                              };
    [BMHttpHander GetRequest:[NSString stringWithFormat:@"%@?g=app&m=index&a=massage",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //        NSLog(@"%@", )
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", result[@"status"]);
        NSString *status = result[@"status"];
        [result setObject:@"first" forKey:@"type"];
        if ([status integerValue] == 1)
        {
            
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
            //            [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"登录成功" waitUntilDone:NO];
        }
        else
        {
           
        }
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
              
    }];
    
}


- (void)webRequestSuccess:(NSDictionary *)result
{
    NSString *type = result[@"type"];
    self.winArr = [NSMutableArray arrayWithArray:result[@"list"]];
    [self settingbgView];


}

- (void)setHeaderViewWithArray:(NSMutableArray *)array
{
    [self setBHViewWithArray:array];
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
    NSMutableArray *winArray = [NSMutableArray new];
    for (NSDictionary *dic in self.winArr)
    {
        [winArray addObject:dic[@"title"]];
    }
    [self.bgView settingGBViewWithArray:winArray];
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
