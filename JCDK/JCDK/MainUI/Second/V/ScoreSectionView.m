//
//  ScoreSectionView.m
//  JCDK
//
//  Created by 张科 on 16/9/4.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ScoreSectionView.h"

@implementation ScoreSectionView

- (void)awakeFromNib
{
    self.letterlabel.layer.cornerRadius = 13 / 2.0;
    self.letterlabel.layer.masksToBounds = YES;
}

@end
