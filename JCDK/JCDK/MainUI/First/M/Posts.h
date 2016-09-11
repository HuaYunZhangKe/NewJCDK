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
@property (nonatomic, retain)NSString *post_title;
@property (nonatomic, retain)NSString *post_excerpt;
@property (nonatomic, retain)NSString *user_nicename;
@property (nonatomic, retain)NSString *post_source;
@property (nonatomic, retain)NSString *post_modified;
@property (nonatomic, retain)NSString *smeta;
@property (nonatomic, retain)NSString *comment_count;
@property (nonatomic, retain)NSString *post_like;


@end
