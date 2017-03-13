//
//  NewsModel.m
//  JCDK
//
//  Created by 张科 on 2016/11/24.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FNewsModel.h"

@implementation FNewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.nid = value;
    }
}

@end
