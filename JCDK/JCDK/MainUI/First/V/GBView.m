//
//  GBView.m
//  JCDK
//
//  Created by 张科 on 16/8/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "GBView.h"
@interface GBView()
{
    NSInteger GBIndex;
    BOOL direction;//YES为正向 NO为反向

}
@end
@implementation GBView
- (void)settingGBViewWithArray:(NSArray *)array
{
    _gbArr = [NSArray arrayWithArray:array];
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = CGSizeMake(self.width, self.height *array.count);
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    for (int i = 0 ; i < array.count ; i ++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, i * self.height, self.width - 2, self.height)];
        NSString *String = [NSString stringWithFormat:@"中奖消息:  %@",array[i]];
        NSRange range = [String rangeOfString:@"中奖消息:"];
        NSMutableAttributedString *attiString = [[NSMutableAttributedString alloc] initWithString:String attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:kWhiteColor2}];
        [attiString addAttribute:NSForegroundColorAttributeName value:kYellowColor range:range];
        label.attributedText = attiString;
        [_scrollView addSubview:label];
    }
    GBIndex = 0;
    direction = YES;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    [timer fire];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
- (void)timer
{
    [_scrollView setContentOffset:CGPointMake(0, GBIndex * self.height) animated:YES];
    if (direction)
    {
        if (GBIndex == _gbArr.count - 1)
        {
            direction = NO;
            GBIndex --;
        }
        else
        {
            GBIndex ++;
        }
    }
    else
    {
        if (GBIndex == 0)
        {
            direction = YES;
            GBIndex ++;
        }
        else
        {
            GBIndex --;
        }

    }
  
}
@end
