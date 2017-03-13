//
//  NewsListTabCell.h
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsListTabCell : UITableViewCell
@property (nonatomic ,retain)NewsModel *news;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
