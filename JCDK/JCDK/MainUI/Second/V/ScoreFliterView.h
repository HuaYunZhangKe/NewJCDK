//
//  ScoreFliterView.h
//  JCDK
//
//  Created by 张科 on 16/9/3.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseTableView.h"
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

@property (nonatomic, retain)UIView *line;
- (void)show;
- (void)dismiss;

@end
