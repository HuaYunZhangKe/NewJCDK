//
//  ThirdCollectionCell.h
//  JCDK
//
//  Created by 张科 on 16/8/27.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseTableView.h"
@interface ThirdCollectionCell : UICollectionViewCell
//index0
@property (weak, nonatomic) IBOutlet UIButton *first0Btn;
@property (weak, nonatomic) IBOutlet UIButton *second0Btn;
@property (weak, nonatomic) IBOutlet UIButton *third0Btn;
@property (weak, nonatomic) IBOutlet UIView *backView0;
@property (weak, nonatomic) IBOutlet JCDKBaseTableView *rightTableView;
@property (weak, nonatomic) IBOutlet JCDKBaseTableView *leftTableView;
@property (nonatomic, retain)UIView *line0;

- (void)settingIndex0Nib;

@end
