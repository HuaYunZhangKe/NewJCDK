//
//  NewsModel.h
//  JCDK
//
//  Created by 张科 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel
@property (nonatomic, retain)NSString *nid;
@property (nonatomic, retain)NSString *content;
@property (nonatomic, retain)NSString *push_time;
@property (nonatomic, retain)NSString *type;
@property (nonatomic, retain)NSString *title;


@end
