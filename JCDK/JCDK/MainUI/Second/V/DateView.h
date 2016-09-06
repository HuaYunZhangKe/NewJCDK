//
//  DateView.h
//  JCDK
//
//  Created by 张科 on 16/9/6.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface DateView : UIView
@property (nonatomic, retain)UILabel *label;
@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, retain)UIButton *button;
@property (nonatomic, retain)NSString *dateString;
@property (nonatomic, copy)YSBlockWithInteger buttonBlock;

@end
