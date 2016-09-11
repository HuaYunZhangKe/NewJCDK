//
//  FHIntroduceTabCell.h
//  JCDK
//
//  Created by 张科 on 16/8/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface FHIntroduceTabCell : UITableViewCell
@property (nonatomic, retain)UIView *topView;
@property (nonatomic, retain)UIView *bottonView;
@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic, retain)UILabel *headTitleLabel;
@property (nonatomic, retain)NSMutableDictionary *showDic;

- (void)setContentWithArray:(NSArray *)array;
@end
