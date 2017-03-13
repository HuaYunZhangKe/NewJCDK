//
//  Users.m
//  JCDK
//
//  Created by 张科 on 16/9/10.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "Users.h"

@implementation Users
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.uid = value;
    }
}

@end
