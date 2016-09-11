//
//  Matchs.h
//  JCDK
//
//  Created by 张科 on 16/9/10.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"
//热门赛事
@interface Matchs : BaseModel
//hometeam 主队名称
//visitingteam 客队名称
//home_pic 主队图标
//visiting_pic 客队图标
//betnum 参与人数
//starttime 开始时间
@property (nonatomic, retain)NSString *hometeam;
@property (nonatomic, retain)NSString *visitingteam;
@property (nonatomic, retain)NSString *home_pic;
@property (nonatomic, retain)NSString *visiting_pic;
@property (nonatomic, retain)NSString *betnum;
@property (nonatomic, retain)NSString *starttime;
@property (nonatomic, retain)NSString *endtime;

@end
