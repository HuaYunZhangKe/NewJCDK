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

//"mid":"1251541",
//"hometeam":"珀斯光荣",
//"visitingteam":"墨尔本胜利",
//"starttime":"01-21 17:00",
//"league_name":"澳洲甲",
//"home_pic":"http://info.310win.com/Image/team/images/20130923112409.png",
//"visiting_pic":"http://info.310win.com/Image/team/images/20130923112350.png",
//"betnum":"0",
//"num":"周六002"
@property (nonatomic, retain)NSString *mid;
@property (nonatomic, retain)NSString *hometeam;
@property (nonatomic, retain)NSString *visitingteam;
@property (nonatomic, retain)NSString *starttime;
@property (nonatomic, retain)NSString *league_name;
@property (nonatomic, retain)NSString *home_pic;
@property (nonatomic, retain)NSString *visiting_pic;
@property (nonatomic, retain)NSString *betnum;
@property (nonatomic, retain)NSString *num;



@end
