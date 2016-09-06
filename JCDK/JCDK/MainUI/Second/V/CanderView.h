//
//  CanderView.h
//  JCDK
//
//  Created by 张科 on 16/9/6.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface CanderView : UIView
@property (nonatomic, retain)UIView *backView;
@property (nonatomic, retain)UIView *canderV;
@property (nonatomic, retain)NSArray *dateArr;
@property (nonatomic, assign)NSInteger index;
@property (nonatomic, copy)YSBlockWithInteger dateButtonBlock;

- (void)show;
- (void)dismiss;
@end
