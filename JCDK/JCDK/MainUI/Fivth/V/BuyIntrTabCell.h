//
//  BuyIntrTabCell.h
//  JCDK
//
//  Created by 张科 on 2016/10/21.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntroduceModel.h"

@interface BuyIntrTabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bSaiLabel;


@property (weak, nonatomic) IBOutlet UILabel *type;
@property (nonatomic, retain)IntroduceModel *intr;
@property (weak, nonatomic) IBOutlet UILabel *zjName;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *vs;

@end
