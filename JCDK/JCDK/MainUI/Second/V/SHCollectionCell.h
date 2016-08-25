//
//  SHCollectionCell.h
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseTableView.h"
@interface SHCollectionCell : UICollectionViewCell
@property (nonatomic, retain)JCDKBaseTableView *tableView;
@property (nonatomic, assign)NSInteger type;
@end
