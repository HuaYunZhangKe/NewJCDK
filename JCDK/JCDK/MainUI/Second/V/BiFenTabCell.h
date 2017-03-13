//
//  BiFenTabCell.h
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
#import "BiFenListModel.h"
@interface BiFenTabCell : UITableViewCell


//index0
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel0;
@property (weak, nonatomic) IBOutlet UILabel *name0;
@property (weak, nonatomic) IBOutlet UILabel *nameright;
@property (weak, nonatomic) IBOutlet UILabel *mark1;
@property (weak, nonatomic) IBOutlet UILabel *mark2;
@property (weak, nonatomic) IBOutlet UILabel *mark3;
@property (weak, nonatomic) IBOutlet UILabel *line2Label;
@property (weak, nonatomic) IBOutlet UILabel *h_name;
@property (weak, nonatomic) IBOutlet UILabel *VS;

@property (weak, nonatomic) IBOutlet UILabel *a_name;
@property (weak, nonatomic) IBOutlet UILabel *a_des;
@property (weak, nonatomic) IBOutlet UILabel *line3;
@property (weak, nonatomic) IBOutlet UILabel *line31;
@property (weak, nonatomic) IBOutlet UILabel *com;

//index1
@property (weak, nonatomic) IBOutlet UIButton *canderBtn;
@property (weak, nonatomic) IBOutlet UIButton *frontStep;
@property (weak, nonatomic) IBOutlet UIButton *nextStep;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain)BiFenListModel *b;
@property (nonatomic, copy) YSBlockWithInteger button1Block;
@property (nonatomic, retain)NSString *type;
@end
