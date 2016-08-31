//
//  ThirdCollectionCell2.h
//  JCDK
//
//  Created by 张科 on 16/8/29.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseTableView.h"
@interface ThirdCollectionCell2 : UICollectionViewCell
//index2
@property (weak, nonatomic) IBOutlet UIView *backView2;

@property (weak, nonatomic) IBOutlet UIButton *first2Btn;
@property (weak, nonatomic) IBOutlet UIButton *second2Btn;

@property (weak, nonatomic) IBOutlet UIButton *third2Btn;
@property (weak, nonatomic) IBOutlet UIButton *four2Btn;

@property (weak, nonatomic) IBOutlet UIButton *fifth2Btn;


@property (weak, nonatomic) IBOutlet JCDKBaseTableView *tableView2;
@property (nonatomic, retain)UIView *line2;
- (void)settingIndex2Nib;

@end
