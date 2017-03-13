//
//  BiFenClassModel.h
//  JCDK
//
//  Created by 张科 on 2017/2/8.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "BaseModel.h"

@interface BiFenClassModel : BaseModel
@property (nonatomic ,retain)NSString *c_name;
@property (nonatomic ,retain)NSString *c_id;
@property (nonatomic ,retain)NSString *num;
@property (nonatomic ,assign)BOOL isSelected;

@end
