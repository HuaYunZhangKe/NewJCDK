//
//  AccountModel.h
//  JCDK
//
//  Created by 张科 on 2016/10/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "BaseModel.h"

@interface AccountModel : BaseModel
@property (nonatomic, retain)NSString *aid;
@property (nonatomic, retain)NSString *userid;
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *price;
@property (nonatomic, retain)NSString *inputtime;
@property (nonatomic, retain)NSString *type;

@end
