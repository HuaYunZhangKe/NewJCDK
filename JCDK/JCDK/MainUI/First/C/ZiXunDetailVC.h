//
//  ZiXunDetailVC.h
//  JCDK
//
//  Created by 张科 on 2016/11/29.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"

@interface ZiXunDetailVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, retain)NSString *nid;
@end
