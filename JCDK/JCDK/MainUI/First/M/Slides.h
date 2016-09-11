//
//  Slides.h
//  JCDK
//
//  Created by 张科 on 16/9/10.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"
//幻灯片
@interface Slides : BaseModel
//slide_name,名称
//slide_pic,图片
//slide_url,跳转链接
@property (nonatomic, retain)NSString *slide_name;
@property (nonatomic, retain)NSString *slide_pic;
@property (nonatomic, retain)NSString *slide_url;

@end
