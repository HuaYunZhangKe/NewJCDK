//
//  BaseModel.m
//  IntimateGift
//
//  Created by 蔡宏业 on 14/12/17.
//  Copyright (c) 2014年 蔡宏业. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
// KVC赋值方法
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dictionary];
        
    }
    return self;
}
// KVC纠错方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
