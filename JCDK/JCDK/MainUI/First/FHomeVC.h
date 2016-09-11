//
//  FHomeVC.h
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"
#import "JCDKBaseTableView.h"
#import "FirstHHeaderView.h"
@interface FHomeVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet JCDKBaseTableView *tableView;
@property (retain, nonatomic) FirstHHeaderView *headerView;
@end
