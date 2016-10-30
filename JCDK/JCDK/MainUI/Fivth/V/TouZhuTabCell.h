//
//  TouZhuTabCell.h
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZmodel.h"
@interface TouZhuTabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label1_1;
@property (weak, nonatomic) IBOutlet UILabel *label1_2;
@property (weak, nonatomic) IBOutlet UILabel *label2_1;
@property (weak, nonatomic) IBOutlet UILabel *label2_2;
@property (weak, nonatomic) IBOutlet UILabel *label3_1;
@property (weak, nonatomic) IBOutlet UILabel *label3_2;

@property (weak, nonatomic) IBOutlet UILabel *label4_1;

@property (weak, nonatomic) IBOutlet UILabel *label4_2;
@property (weak, nonatomic) IBOutlet UILabel *label5_1;
@property (nonatomic ,retain)NSDictionary *dic;


@end
