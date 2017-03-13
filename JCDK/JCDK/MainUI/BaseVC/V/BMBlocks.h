
//
//  YSBlocks.h
//  TemplateDemo
//
//  Created by 谷硕 on 16/1/16.
//  Copyright © 2016年 sure. All rights reserved.
//

#ifndef BMBlocks_h
#define BMBlocks_h


typedef void (^BMBlock)(void);
typedef void (^BMBlockWithInteger)      (NSInteger integer);
typedef void (^BMBlockWithString)      (NSString *string);
typedef void (^BMBlockWithArray)        (NSArray *array);
typedef void (^BMBlockWithMutableArray)  (NSMutableArray *array);
typedef void (^BMBlockWithDictionary)  (NSDictionary *dictionary);



#endif /* BMBlocks_h */
