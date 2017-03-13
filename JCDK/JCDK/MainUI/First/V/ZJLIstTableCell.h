//
//  ZJLIstTableCell.h
//  JCDK
//
//  Created by 张科 on 2017/3/1.
//  Copyright © 2017年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJLIstTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
