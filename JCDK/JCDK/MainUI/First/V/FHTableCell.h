//
//  FHTableCell.h
//  JCDK
//
//  Created by 张科 on 16/8/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Matchs.h"
#import "Users.h"
#import "Posts.h"
@interface FHTableCell : UITableViewCell
//index0

@property (weak, nonatomic) IBOutlet UILabel *leftTitle0;
//index1
@property (weak, nonatomic) IBOutlet UILabel *leftTitle1;
//index2
@property (weak, nonatomic) IBOutlet UILabel *name2;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *zPic;
@property (weak, nonatomic) IBOutlet UIImageView *fPic;
@property (weak, nonatomic) IBOutlet UILabel *zLabel;
@property (weak, nonatomic) IBOutlet UILabel *fLabel;
@property (weak, nonatomic) IBOutlet UIButton *collect;
@property (weak, nonatomic) IBOutlet UIButton *zhibBtno;
@property (weak, nonatomic) IBOutlet UIButton *jiepanBtn;
@property (weak, nonatomic) IBOutlet UILabel *joinLabel;
@property (nonatomic, retain)Matchs *macth;

//index3
@property (weak, nonatomic) IBOutlet UIImageView *headPic;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *zan;
@property (weak, nonatomic) IBOutlet UILabel *commit;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (nonatomic, retain)Posts *post;
@end
