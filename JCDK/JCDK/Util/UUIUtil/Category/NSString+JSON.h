//
//  NSString+JSON.h
//  jingchengyou
//
//  Created by Binea on 15/8/30.
//  Copyright (c) 2015年 XHCX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)
-(id)JSONValue;
+(id)JSONValueWithData:(NSData*)data;
+(NSString*)stringWithJsonObject:(id)jsonObject;
@end
