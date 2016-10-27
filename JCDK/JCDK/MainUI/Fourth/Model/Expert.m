//
//  Expert.m
//  JCDK
//
//  Created by 张科 on 2016/10/17.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "Expert.h"

@implementation Expert
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.eid = value;
    }
    
}

@end
