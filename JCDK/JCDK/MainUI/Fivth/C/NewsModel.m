//
//  NewsModel.m
//  JCDK
//
//  Created by 张科 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.nid = value;
    }
}
@end
