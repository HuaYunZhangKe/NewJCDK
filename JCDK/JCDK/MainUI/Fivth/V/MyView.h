//
//  MyView.h
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)UIImageView *headImg;
@property(nonatomic,retain)JCDKBaseLabel *nameLabel;
@property(nonatomic,retain)JCDKBaseLabel *kabiCount;
@property(nonatomic,retain)JCDKBaseLabel *yinbiCount;
@property(nonatomic,retain)UIButton *leftBtn;
@property(nonatomic,retain)UIButton *rightBtn;
@end
