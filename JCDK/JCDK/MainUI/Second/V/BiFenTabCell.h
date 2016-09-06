//
//  BiFenTabCell.h
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface BiFenTabCell : UITableViewCell
//index1
@property (weak, nonatomic) IBOutlet UIButton *canderBtn;
@property (weak, nonatomic) IBOutlet UIButton *frontStep;
@property (weak, nonatomic) IBOutlet UIButton *nextStep;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, copy) YSBlockWithInteger button1Block;
@end
