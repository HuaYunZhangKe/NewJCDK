//
//  ScoreFitlerCollectionCell.h
//  JCDK
//
//  Created by 张科 on 16/9/4.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreFitlerCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (nonatomic, assign)BOOL isSelected;
@end
