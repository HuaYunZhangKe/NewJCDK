//
//  NavigationView.h
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface NavigationView : UIView
#pragma mark - instance
//index0
@property (weak, nonatomic) IBOutlet UIButton *leftBtn0;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn0;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel0;
//参数为1 左按钮  2右按钮
@property (nonatomic, copy)YSBlockWithInteger buttonBlock0;
//index1
@property (weak, nonatomic) IBOutlet UIButton *leftBtn1;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn1_1;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn1_2;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel1;
//参数为1 左按钮  2 为右1按钮   3为右2按钮
@property (nonatomic, copy)YSBlockWithInteger buttonBlock1;
//index2
@property (weak, nonatomic) IBOutlet UIButton *leftBtn2;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn2_1;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn2_2;

@property (weak, nonatomic) IBOutlet UIImageView *headImgView2;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel2;
@property (weak, nonatomic) IBOutlet UIButton *introBtn;
@property (weak, nonatomic) IBOutlet UIButton *zixunBtn;
//参数为1 比赛推荐  2 为赛事资讯 3为左2按钮 4为右1按钮  5为右2按钮

@property (nonatomic, copy)YSBlockWithInteger buttonBlock2;
//index3
@property (weak, nonatomic) IBOutlet UILabel *titleLabel3;
//index4
@property (weak, nonatomic) IBOutlet UILabel *titleLabel4;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn4;
@property (nonatomic, copy)YSBlockWithInteger buttonBlock4;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

#pragma mark -function
- (void)setNib0;
- (void)setNib1;
- (void)setNib2;
- (void)setNib3;
- (void)setNib4;



@end
