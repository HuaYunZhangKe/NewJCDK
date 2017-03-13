//
//  ShareView.h
//  IKE
//
//  Created by 张科 on 2016/10/16.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMBlocks.h"
@interface ShareView : UIView

@property (nonatomic, retain)UIView *backView;
@property (nonatomic, retain)UIView *sView;
@property (nonatomic, retain)UILabel *titleLabel;
@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic, retain)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, retain)UIButton *cancelBtn;
@property (nonatomic, retain)UIView *buttonLine;
@property (nonatomic, copy)BMBlockWithString shareTypeBlock;
@end
