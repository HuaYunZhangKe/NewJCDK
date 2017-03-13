//
//  NewsDetailVC.h
//  JCDK
//
//  Created by 张科 on 2017/3/2.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"
#import "NewsModel.h"
@interface NewsDetailVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (nonatomic ,retain)NewsModel *news;
@end
