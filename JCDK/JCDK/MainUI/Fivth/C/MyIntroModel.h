//
//  MyIntroModel.h
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"

@interface MyIntroModel : BaseModel
@property (nonatomic, retain)NSString *League_name;//联赛名称

@property (nonatomic, retain)NSString *Mdate;// 开始日期
@property (nonatomic, retain)NSString *Mtime;//主队
@property (nonatomic, retain)NSString *H_name;//客队
@property (nonatomic, retain)NSString *A_name;//推荐类型 5 竞彩，6 亚盘 7 进球数
@property (nonatomic, retain)NSString *Bet;//
@property (nonatomic, retain)NSString *post_modified;//文章发布时间
@property (nonatomic, retain)NSString *Betnum;//参与人数

@end
