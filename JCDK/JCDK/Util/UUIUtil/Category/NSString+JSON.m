//
//  NSString+JSON.m
//  jingchengyou
//
//  Created by Binea on 15/8/30.
//  Copyright (c) 2015年 XHCX. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)
-(id)JSONValue
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return jsonObject;
}
+(id)JSONValueWithData:(NSData*)data
{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return jsonObject;
}
+(NSString*)stringWithJsonObject:(id)jsonObject
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end
