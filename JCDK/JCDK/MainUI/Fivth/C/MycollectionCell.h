//
//  MycollectionCell.h
//  JCDK
//
//  Created by 魏秀红 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"
@interface MycollectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic, retain)CollectionModel *collect;
@end
