//
//  NewsDetailModel.h
//  JCDK
//
//  Created by 张科 on 2017/1/21.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "BaseModel.h"

@interface NewsDetailModel : BaseModel
@property (nonatomic ,retain)NSString *updtime;
@property (nonatomic ,retain)NSString *nid;
@property (nonatomic ,retain)NSString *img;
@property (nonatomic ,retain)NSString *title;
@property (nonatomic ,retain)NSString *link;
@property (nonatomic ,retain)NSString *summary;
@property (nonatomic ,retain)NSString *content;
@property (nonatomic ,retain)NSString *pubtime;

@end
