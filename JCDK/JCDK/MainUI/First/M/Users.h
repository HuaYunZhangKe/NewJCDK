//
//  Users.h
//  JCDK
//
//  Created by 张科 on 16/9/10.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"
//专家推荐
@interface Users : BaseModel
//user_nicename 用户美名
//avatar,用户头像(默认存储路径是/data/upload/avatar)
//betting,投注次数
//Winning 中奖次数
@property (nonatomic, retain)NSString *user_nicename;
@property (nonatomic, retain)NSString *avatar;
@property (nonatomic, retain)NSString *betting;
@property (nonatomic, retain)NSString *Winning;
@property (nonatomic, retain)NSString *uid;


@end
