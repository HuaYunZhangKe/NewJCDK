//
//  SHCollectionCell.h
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseTableView.h"
#import "ZKBlocks.h"
#import "BiFenListModel.h"
@interface SHCollectionCell : UICollectionViewCell
@property (nonatomic, retain)JCDKBaseTableView *tableView;
@property (nonatomic, retain)NSMutableDictionary *postDic;
@property (nonatomic, retain)NSString *type;

@property (nonatomic, copy)YSBlockWithInteger jishiBlock;
@property (nonatomic, copy)YSBlockWithInteger saiguoBlock;
@property (nonatomic, copy)YSBlockWithInteger saichengBlock;
@property (nonatomic, copy)YSBlockWithInteger guanzhuBlock;
@property (nonatomic, copy) YSBlockWithBiFenListModel gameBlock;

- (void)showViewWithPostDic:(NSMutableDictionary *)dic Type:(NSString *)type AndCallBack:(YSBlockWithInteger)callBack;


@end
