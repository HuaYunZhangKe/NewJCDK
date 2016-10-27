//
//  ZhuaJiaTabCellTableViewCell.h
//  JCDK
//
//  Created by 张科 on 2016/10/16.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expert.h"

@interface ZhuaJiaTabCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UIButton *collect;
@property (weak, nonatomic) IBOutlet UILabel *tag1;

@property (weak, nonatomic) IBOutlet UILabel *tag2;
@property (nonatomic ,retain)Expert *ex;
@end
