//
//  TZmodel.m
//  JCDK
//
//  Created by 张科 on 2016/10/27.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "TZmodel.h"

@implementation TZmodel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.tid = value;
    }
    if ([key isEqualToString:@"match"])
    {
        _match = [NSArray arrayWithArray:value];
    }
}

@end
