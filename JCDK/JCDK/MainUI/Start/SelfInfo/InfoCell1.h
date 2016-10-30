//
//  InfoCell1.h
//  JCDK
//
//  Created by 张科 on 2016/10/18.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface InfoCell1 : UITableViewCell
//0
@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (nonatomic ,retain)NSString *sex;

//1
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UILabel *phone;
//2
@property (weak, nonatomic) IBOutlet UILabel *titleLabel3;
@property (weak, nonatomic) IBOutlet UIButton *man;
@property (weak, nonatomic) IBOutlet UIButton *woman;
@property(nonatomic ,retain)UIButton *currentBtn;
@property (nonatomic, copy)YSBlockWithInteger buttonBlock;
@end
