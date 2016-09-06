//
//  ScoreFitlerCollectionCell.m
//  JCDK
//
//  Created by 张科 on 16/9/4.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ScoreFitlerCollectionCell.h"

@implementation ScoreFitlerCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.isSelected = YES;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = kWhiteColor1.CGColor;

}

@end
