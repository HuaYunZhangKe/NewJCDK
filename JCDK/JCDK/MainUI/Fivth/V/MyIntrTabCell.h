//
//  MyIntrTabCell.h
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyIntroModel.h"
@interface MyIntrTabCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bSaiLabel;

@property (weak, nonatomic) IBOutlet UILabel *vs;
@property (weak, nonatomic) IBOutlet UILabel *allTIme;

@property (weak, nonatomic) IBOutlet UILabel *time1;

@property (weak, nonatomic) IBOutlet UILabel *time2;

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;

@property (nonatomic ,retain)MyIntroModel *intr;
@end
