//
//  FHIntroduceColletionCell.m
//  JCDK
//
//  Created by 张科 on 16/8/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FHIntroduceColletionCell.h"

@implementation FHIntroduceColletionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _pic.layer.cornerRadius = 5.0;
    _pic.layer.masksToBounds = YES;
    _bridge.layer.cornerRadius = 3.5;
    _bridge.layer.masksToBounds = YES;
    _bridge.backgroundColor = kYellowColor;
}

@end
