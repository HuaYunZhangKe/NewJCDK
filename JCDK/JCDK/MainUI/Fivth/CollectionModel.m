//
//  CollectionModel.m
//  JCDK
//
//  Created by 张科 on 2016/11/14.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.cid = value;
    }
}

@end
