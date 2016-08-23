//
//  FirstHHeaderView.h
//  JCDK
//
//  Created by 张科 on 16/8/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHInfiniteScrollView.h"
#import "ZKBlocks.h"
#import "GBView.h"
@interface FirstHHeaderView : UIView<BHInfiniteScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *adView;

@property (weak, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIView *baseketBallView;
@property (weak, nonatomic) IBOutlet UIView *introduView;
@property (weak, nonatomic) IBOutlet UIView *helpView;

@property (weak, nonatomic) IBOutlet GBView *bgView;

@property (nonatomic, copy)YSBlockWithInteger topTapBlock;
@property (nonatomic, copy)YSBlockWithInteger middleTapBlock;
- (void)setHeaderView;

@end
