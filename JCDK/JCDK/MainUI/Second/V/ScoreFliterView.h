//
//  ScoreFliterView.h
//  JCDK
//
//  Created by 张科 on 16/9/3.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseTableView.h"
#import "ZKBlocks.h"
@interface ScoreFliterView : UIView
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;

@property (weak, nonatomic) IBOutlet UIButton *fourthBtn;
@property (weak, nonatomic) IBOutlet UIButton *chooseAllBtn;

@property (weak, nonatomic) IBOutlet UIButton *fanxuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet JCDKBaseTableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderViewHeight;
@property (nonatomic, retain)UIView *line;
@property (nonatomic ,copy)YSBlockWithInteger bottomBlock;
/*//instant_cate 为即时  over_cate 为赛果  next_cate为赛程  ""为关注
 PostDic初即时意外都需要时间键值对
*/
- (void)showViewWithScoreType:(NSString *)scoreType PostDic:(NSMutableDictionary *)dic;
- (void)dismiss;

@end
