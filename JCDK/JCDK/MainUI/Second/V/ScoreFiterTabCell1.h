//
//  ScoreFiterTabCell1.h
//  JCDK
//
//  Created by 张科 on 16/9/4.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreFiterTabCell1 : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic, retain)UICollectionViewFlowLayout *cflowLayout;
@property (nonatomic, assign)CGFloat collHeight;
@property (nonatomic, retain)NSMutableArray *showArr;
+ (CGFloat)cellHeightForArray:(NSArray *)array;
@end
