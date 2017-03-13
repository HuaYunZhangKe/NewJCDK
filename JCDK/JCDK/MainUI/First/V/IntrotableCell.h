//
//  IntrotableCell.h
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntroModel.h"
@interface IntrotableCell : UITableViewCell
@property (nonatomic, retain)IntroModel *intr;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *bisaiN;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *userL;
@property (weak, nonatomic) IBOutlet UILabel *BIL;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *des;

@property (weak, nonatomic) IBOutlet UILabel *ago;
@end
