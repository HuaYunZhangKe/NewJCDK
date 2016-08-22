//
//  FreeTableViewCell.h
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreeTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *img;
@property(nonatomic,retain)JCDKBaseLabel *titleLb;
@property(nonatomic,retain)UIImageView *point;
@property(nonatomic,retain)JCDKBaseLabel *countLb;
@property(nonatomic,retain)JCDKBaseLabel *dayLb;
@property(nonatomic,retain)JCDKBaseLabel *detailLb;
@end
