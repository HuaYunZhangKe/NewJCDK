
//
//  YSBlocks.h
//  TemplateDemo
//
//  Created by 谷硕 on 16/1/16.
//  Copyright © 2016年 sure. All rights reserved.
//

#ifndef ZKBlocks_h
#define ZKBlocks_h
#import "BiFenListModel.h"
typedef void (^YSBlock)(void);
typedef void (^YSBlockWithInteger)      (NSInteger integer);
typedef void (^YSBlockWithString)      (NSString *string);
typedef void (^YSBlockWithArray)        (NSArray *array);
typedef void (^YSBlockWithMutableArray)  (NSMutableArray *array);
typedef void (^YSBlockWithDictionary)  (NSDictionary *dictionary);
typedef void (^YSBlockWithBiFenListModel)  (BiFenListModel *b);

#endif /* ZKBlocks_h */
