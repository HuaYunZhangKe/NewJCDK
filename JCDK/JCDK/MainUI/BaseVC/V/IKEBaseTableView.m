//
//  IKEBaseTableView.m
//  IKE
//
//  Created by 张科 on 16/9/8.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "IKEBaseTableView.h"
#import "MJRefresh.h"

@implementation IKEBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    }
    return self;
}
- (void)setIsFooterEnble:(BOOL)isFooterEnble
{
    if (isFooterEnble)
    {
        self.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^
                          {
                              if (_footerRefreshBlock)
                              {
                                  _footerRefreshBlock();
                              }
                          }];  
    }
}

- (void)setIsHeaderEnble:(BOOL)isHeaderEnble
{
    if (isHeaderEnble)
    {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^
                          {
                              if (_headerRefreshBlock)
                              {
                                  _headerRefreshBlock();
                              }
                          }];

    }
}
- (void)stopHeaderRefresh
{
    [self.mj_header endRefreshing];
    
}
- (void)stopFooterRefresh
{
    [self.mj_footer endRefreshing];
    
}
@end
