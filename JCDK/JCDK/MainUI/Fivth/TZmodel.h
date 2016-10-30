//
//  TZmodel.h
//  JCDK
//
//  Created by 张科 on 2016/10/27.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"

@interface TZmodel : BaseModel
@property (nonatomic ,retain)NSString *tid;
@property (nonatomic ,retain)NSString *m_oid;
@property (nonatomic ,retain)NSString *type;
@property (nonatomic ,retain)NSString *totalprice;
@property (nonatomic ,retain)NSString *inputtime;
@property (nonatomic ,retain)NSString *userid;
@property (nonatomic ,retain)NSString *orderid;
@property (nonatomic ,retain)NSString *expect;
@property (nonatomic ,retain)NSString *win;
@property (nonatomic ,retain)NSString *mid;
@property (nonatomic ,retain)NSString *count;
@property (nonatomic ,retain)NSArray *match;

@end
