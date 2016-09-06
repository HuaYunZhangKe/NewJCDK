//
//  ClassUtils.h
//  JCDK
//
//  Created by 张科 on 16/9/6.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassUtils : NSObject
+ (NSDictionary *)dateDicWithDate:(NSDate *)date;//NSDate转dateDictionary
+ (NSString *)arabicNumeralsToChinese:(NSInteger)number;//阿拉伯数字转汉子
+ (NSString *)dataStringWithDate:(NSDate *)date;
@end
