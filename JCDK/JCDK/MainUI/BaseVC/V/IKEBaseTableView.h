//
//  IKEBaseTableView.h
//  IKE
//
//  Created by 张科 on 16/9/8.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface IKEBaseTableView : UITableView
@property (nonatomic, copy)YSBlock headerRefreshBlock;
@property (nonatomic, copy)YSBlock footerRefreshBlock;
@property (nonatomic, assign)BOOL isFooterEnble;
@property (nonatomic, assign)BOOL isHeaderEnble;
- (void)stopHeaderRefresh;
- (void)stopFooterRefresh;

@end
