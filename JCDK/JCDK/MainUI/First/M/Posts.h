//
//  Posts.h
//  JCDK
//
//  Created by 张科 on 16/9/10.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

//最新话题对象
@interface Posts : BaseModel

@property (nonatomic, retain)NSString *pid;
@property (nonatomic, retain)NSString *updtime;
@property (nonatomic, retain)NSString *img;
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *link;
@property (nonatomic, retain)NSString *summary;
@property (nonatomic, retain)NSString *content;
@property (nonatomic, retain)NSString *pubtime;
@property (nonatomic, retain)NSString *smeta;


@end
