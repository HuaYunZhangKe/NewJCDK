//
//  FocusTabCell.h
//  JCDK
//
//  Created by 张科 on 2016/10/28.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface FocusTabCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name2;
@property (weak, nonatomic) IBOutlet UILabel *content2;
@property (weak, nonatomic) IBOutlet UIButton *time2;
@property (nonatomic ,retain)NewsModel *news;

@end
