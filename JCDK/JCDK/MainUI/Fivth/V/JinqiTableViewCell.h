//
//  JinqiTableViewCell.h
//  JCDK
//
//  Created by 李锐 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZmodel.h"

@interface JinqiTableViewCell : UITableViewCell
@property(nonatomic,retain)JCDKBaseLabel *name;
@property(nonatomic,retain)JCDKBaseLabel *vsLabel;
@property(nonatomic,retain)UIButton *arrow;
@property (nonatomic ,retain)NSDictionary *dic;
@end
